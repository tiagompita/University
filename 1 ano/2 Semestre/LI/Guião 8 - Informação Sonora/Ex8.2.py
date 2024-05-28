import wave
import sys

def main(agrv):
    wf = wave.open(agrv[1], "rb")
    print("Frequência: ", wf.getframerate())
    print("Nº de canais: ", wf.getnchannels())
    
    print("Tamanho(Byte): ", wf.getsampwidth())
    print("Nº de Frames de Som: ", wf.getnframes())

    wf.close()

main(sys.argv)