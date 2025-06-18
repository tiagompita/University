from struct import pack
from math import sin, pi
import wave
import sys

def main(argv):
    rate=44100
    wv = wave.open(argv[1], "w")
    wv.setparams((1, 2, rate, 0, "NONE", "not compressed"))

    amplitude = 10000
    data = []
    duration = 1 # Em segundos
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


    for digit in number:
        # Códigos DTMF
        for i in range(0, int(rate*0.040)):
            data.append(amplitude*sin(2*pi*tones[digit][0]*i/rate) + amplitude*sin(2*pi*tones[digit][1]*i/rate)
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

main(sys.argv)
#exec => python3 Ex8.7.py saida.wav