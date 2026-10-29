#!/usr/bin/env python3
"""
ble_scan.py - observador BLE para o PC (Dispositivos Conectados, guião de Bluetooth LE)

Mostra, para os dispositivos cujo nome contém o texto indicado na linha de comando:
  - o endereço BLE, o tipo de endereço e o tipo de PDU de cada pacote recebido
    (ADV_IND, ADV_SCAN_IND, ADV_NONCONN_IND, SCAN_RSP);
  - as estruturas AD em bruto (comprimento, tipo e dados) dos dados de anúncio e da
    scan response, sempre que o seu conteúdo muda;
  - a cada 5 segundos, o número de anúncios recebidos, o RSSI médio e o menor
    intervalo observado entre dois anúncios consecutivos.

Suporte por sistema operativo:
  - Windows 10 (versão 2004 ou posterior) e Windows 11: suporte completo (API WinRT).
  - Linux (BlueZ): endereço, tipo de endereço, campos interpretados e RSSI; o sistema
    não fornece os dados em bruto nem o tipo de PDU. Para esses, use o btmon.
  - macOS: o sistema não fornece o endereço nem os dados em bruto. Use o PacketLogger.

Instalação:  pip install bleak
Utilização:  python ble_scan.py DC-P2-G07        (Ctrl+C para terminar)
"""

import asyncio
import sys
import time

from bleak import BleakScanner

FILTRO = sys.argv[1] if len(sys.argv) > 1 else ""
PERIODO_RESUMO = 5.0  # segundos

TIPOS_AD = {
    0x01: "Flags",
    0x02: "16-bit Service UUIDs (incompleta)",
    0x03: "16-bit Service UUIDs (completa)",
    0x08: "Nome (abreviado)",
    0x09: "Nome (completo)",
    0x0A: "TX Power Level",
    0x16: "Service Data - 16-bit UUID",
    0x19: "Appearance",
    0x1A: "Advertising Interval",
    0x1B: "LE Bluetooth Device Address",
    0x1C: "LE Role",
    0x24: "URI",
    0xFF: "Manufacturer Specific Data",
}

# Nomes do enumerado BluetoothLEAdvertisementType (WinRT) -> nome do PDU na especificação
PDU_WINRT = {
    "CONNECTABLE_UNDIRECTED": "ADV_IND",
    "CONNECTABLE_DIRECTED": "ADV_DIRECT_IND",
    "SCANNABLE_UNDIRECTED": "ADV_SCAN_IND",
    "NON_CONNECTABLE_UNDIRECTED": "ADV_NONCONN_IND",
    "SCAN_RESPONSE": "SCAN_RSP",
    "EXTENDED": "EXTENDED",
}

ultimo_conteudo = {}  # (endereço, PDU) -> conteúdo já apresentado
ultimo_anuncio = {}   # endereço -> último objeto de anúncio processado (Windows)
estatisticas = {}     # endereço -> {"n", "rssi", "t_ant", "dt_min"}


def hexa(dados: bytes) -> str:
    return " ".join(f"{b:02X}" for b in dados)


def registar_rececao(endereco: str, rssi: int, medir_intervalo: bool = True) -> None:
    """Atualiza as estatísticas com a receção de um anúncio (não conta scan responses)."""
    agora = time.monotonic()
    e = estatisticas.setdefault(endereco, {"n": 0, "rssi": 0, "t_ant": None, "dt_min": None})
    e["n"] += 1
    e["rssi"] += rssi
    if medir_intervalo and e["t_ant"] is not None:
        dt = agora - e["t_ant"]
        if e["dt_min"] is None or dt < e["dt_min"]:
            e["dt_min"] = dt
    e["t_ant"] = agora


def mostrar_resumo() -> None:
    for endereco, e in estatisticas.items():
        if e["n"] == 0:
            print(f"[resumo] {endereco}: nenhuma receção nos últimos {PERIODO_RESUMO:.0f} s")
            continue
        dt = f"{e['dt_min'] * 1000:.0f} ms" if e["dt_min"] is not None else "n/d"
        print(f"[resumo] {endereco}: {e['n']} receções em {PERIODO_RESUMO:.0f} s, "
              f"RSSI médio {e['rssi'] / e['n']:.1f} dBm, menor intervalo observado {dt}")
        e["n"], e["rssi"], e["dt_min"] = 0, 0, None


# --------------------------------------------------------------------------- Windows

def formatar_endereco_winrt(valor: int) -> str:
    return ":".join(f"{b:02X}" for b in valor.to_bytes(6, byteorder="big"))


def tipo_endereco_winrt(args) -> str:
    try:  # propriedade disponível a partir do Windows 10 versão 2004
        return args.bluetooth_address_type.name.lower()
    except AttributeError:
        return "?"


def mostrar_pacote_winrt(args) -> None:
    endereco = formatar_endereco_winrt(args.bluetooth_address)
    nome_tipo = args.advertisement_type.name
    pdu = PDU_WINRT.get(nome_tipo, nome_tipo)
    seccoes = [(s.data_type, bytes(s.data)) for s in args.advertisement.data_sections]
    conteudo = b"".join(bytes([len(d) + 1, t]) + d for t, d in seccoes)

    chave = (endereco, pdu)
    if ultimo_conteudo.get(chave) == conteudo:
        return  # conteúdo inalterado: não repete
    ultimo_conteudo[chave] = conteudo

    print(f"\n{pdu}  endereço {endereco} ({tipo_endereco_winrt(args)})  "
          f"RSSI {args.raw_signal_strength_in_dbm} dBm  {len(conteudo)} bytes")
    print(f"  em bruto: {hexa(conteudo)}")
    for t, d in seccoes:
        print(f"  len=0x{len(d) + 1:02X} tipo=0x{t:02X} {TIPOS_AD.get(t, '(outro)'):34s} {hexa(d)}")
    if pdu != "SCAN_RSP" and not any(t == 0x01 for t, _ in seccoes):
        try:  # algumas versões do Windows apresentam as Flags apenas nesta propriedade
            flags = args.advertisement.flags
            if flags is not None:
                print(f"  (Flags indicadas pelo Windows fora da lista de estruturas: 0x{int(flags):02X})")
        except Exception:
            pass


def callback_windows(dispositivo, dados_anuncio) -> None:
    _, par = dados_anuncio.platform_data  # par = (anúncio, scan response)
    anuncio = par.adv
    if anuncio is not None and anuncio is not ultimo_anuncio.get(dispositivo.address):
        ultimo_anuncio[dispositivo.address] = anuncio
        registar_rececao(dispositivo.address, anuncio.raw_signal_strength_in_dbm)
    for args in par:
        if args is not None:
            mostrar_pacote_winrt(args)


# --------------------------------------------------------------------------- Linux

def callback_linux(dispositivo, dados_anuncio) -> None:
    _, props = dados_anuncio.platform_data
    # no Linux, a callback também é chamada por outras alterações de propriedades do
    # dispositivo, pelo que o intervalo entre chamadas não mede o intervalo de anúncio
    registar_rececao(dispositivo.address, dados_anuncio.rssi, medir_intervalo=False)
    campos = (
        dados_anuncio.local_name,
        dados_anuncio.tx_power,
        tuple(sorted((k, bytes(v)) for k, v in dados_anuncio.service_data.items())),
        tuple(sorted(dados_anuncio.service_uuids)),
    )
    chave = (dispositivo.address, "campos")
    if ultimo_conteudo.get(chave) == campos:
        return
    ultimo_conteudo[chave] = campos
    print(f"\nendereço {dispositivo.address} ({props.get('AddressType', '?')})  "
          f"RSSI {dados_anuncio.rssi} dBm")
    print(f"  nome: {dados_anuncio.local_name}  TX power: {dados_anuncio.tx_power}")
    for uuid, valor in dados_anuncio.service_data.items():
        print(f"  service data {uuid}: {hexa(bytes(valor))}")
    if dados_anuncio.service_uuids:
        print(f"  UUID de serviços: {', '.join(dados_anuncio.service_uuids)}")


# --------------------------------------------------------------------------- comum

def callback(dispositivo, dados_anuncio) -> None:
    if FILTRO and FILTRO not in (dados_anuncio.local_name or ""):
        return
    if sys.platform == "win32":
        callback_windows(dispositivo, dados_anuncio)
    else:
        callback_linux(dispositivo, dados_anuncio)


async def principal() -> None:
    if sys.platform == "darwin":
        print("No macOS, o sistema não fornece às aplicações o endereço BLE nem os dados de\n"
              "anúncio em bruto. Use o PacketLogger (Additional Tools for Xcode).")
        return
    if sys.platform.startswith("linux"):
        print("Linux: são apresentados apenas os campos interpretados pelo BlueZ.\n"
              "Para os dados em bruto e o tipo de PDU, use: sudo btmon")
    scanner = BleakScanner(
        detection_callback=callback,
        scanning_mode="active",  # pesquisa ativa: pede e recebe as scan responses
        bluez={"filters": {"DuplicateData": True}},  # Linux: reportar cada anúncio
    )
    print(f"A pesquisar dispositivos cujo nome contém '{FILTRO}' (Ctrl+C para terminar)...")
    await scanner.start()
    try:
        while True:
            await asyncio.sleep(PERIODO_RESUMO)
            mostrar_resumo()
    finally:
        await scanner.stop()


if __name__ == "__main__":
    try:
        asyncio.run(principal())
    except KeyboardInterrupt:
        pass
