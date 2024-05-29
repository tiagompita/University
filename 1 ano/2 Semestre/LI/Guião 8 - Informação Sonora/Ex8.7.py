from struct import pack
from math import sin, pi
import wave

def main(argv):
    rate=44100
    wv = wave.open(argv[1], "w")
    wv.setparams((1, 2, rate, 0, "NONE", "not compressed"))

    amplitude = 10000
    data = []
    duration = 3 # Em segundos
    tones = {\
            "1" : (697, 1209), \
            "2" : (697, 1336), \
            "3" : (697, 1477), \
            "A" : (697, 1633), \
            
            "4" : (770, 1209), \
            "5" : (770, 1336), \
            "6" : (770, 1477), \
            "B" : (770, 1633), \
            
            "7" : (852, 1209), \
            "8" : (852, 1336), \
            "9" : (852, 1477), \
            "C" : (852, 1633), \
            
            "*" : (941, 1209), \
            "0" : (941, 1336), \
            "#" : (941, 1477), \
            "D" : (941, 1633)
            }
    
    number = input("Digite um número: ") # número a codificar
    for n in number:
        # Códigos DTMF
        for tone in tones[n]:
            for i in range(0, int(rate*0.040)):
                data.append(
                    amplitude*sin(2*pi*tone*i/rate)
                )
        # Pausa (silêncio)
        for i in range(0, int(rate*0.040)):
            data.append(0)

    # Gerar (pack) a informação no formato correto (16bits)
    wvData = []
    for v in data:
        wvData += pack("h", int(v))

    wv.writeframes(bytearray(wvData))
    wv.close()

main("/home/pita/Desktop/University/1 ano/2 Semestre/LI/Guião 8 - Informação Sonora/wave_files/sho - noir.wav")
