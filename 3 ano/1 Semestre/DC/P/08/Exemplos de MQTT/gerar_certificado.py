"""Gera o certificado autoassinado do broker Mosquitto local.

Uso (num terminal do ESP-IDF, na pasta do broker):
    python gerar_certificado.py <IP do portátil>

Cria server.crt (certificado) e server.key (chave privada) na pasta atual.
O IP fica no Common Name e no campo subjectAltName do certificado.
Usa o pacote cryptography, instalado com o ESP-IDF; funciona em Windows e em Ubuntu.
"""
import datetime
import ipaddress
import sys

from cryptography import x509
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.x509.oid import NameOID


def main():
    if len(sys.argv) != 2:
        sys.exit("Uso: python gerar_certificado.py <IP do portátil>")
    try:
        ip = ipaddress.ip_address(sys.argv[1])
    except ValueError:
        sys.exit(f"Endereço IP inválido: {sys.argv[1]}")

    key = rsa.generate_private_key(public_exponent=65537, key_size=2048)
    name = x509.Name([x509.NameAttribute(NameOID.COMMON_NAME, str(ip))])
    now = datetime.datetime.now(datetime.timezone.utc)
    ski = x509.SubjectKeyIdentifier.from_public_key(key.public_key())
    cert = (
        x509.CertificateBuilder()
        .subject_name(name)
        .issuer_name(name)
        .public_key(key.public_key())
        .serial_number(x509.random_serial_number())
        .not_valid_before(now - datetime.timedelta(minutes=5))
        .not_valid_after(now + datetime.timedelta(days=365))
        .add_extension(x509.BasicConstraints(ca=True, path_length=None), critical=True)
        .add_extension(ski, critical=False)
        .add_extension(x509.AuthorityKeyIdentifier.from_issuer_subject_key_identifier(ski), critical=False)
        .add_extension(x509.SubjectAlternativeName([x509.IPAddress(ip)]), critical=False)
        .sign(key, hashes.SHA256())
    )

    with open("server.key", "wb") as f:
        f.write(key.private_bytes(serialization.Encoding.PEM,
                                  serialization.PrivateFormat.PKCS8,
                                  serialization.NoEncryption()))
    with open("server.crt", "wb") as f:
        f.write(cert.public_bytes(serialization.Encoding.PEM))
    print(f"Criados server.crt e server.key para o IP {ip} (válidos durante 365 dias).")


if __name__ == "__main__":
    main()
