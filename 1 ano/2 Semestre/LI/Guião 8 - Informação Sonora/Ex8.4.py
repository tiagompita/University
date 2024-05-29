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
    freq_a = 440
    freq_b = 880
    for i in range(0, rate * duration): #8.5
        data.append(
            amplitude*sin(2*pi*freq_a*i/rate) +
            amplitude*sin(2*pi*freq_b*i/rate)
            )

    # Gerar (pack) a informação no formato correto (16bits)
    wvData = []
    for v in data:
        wvData += pack("h", int(v))

    wv.writeframes(bytearray(wvData))
    wv.close()

main("/home/pita/Desktop/University/1 ano/2 Semestre/LI/Guião 8 - Informação Sonora/wave_files/sho - noir.wav")
