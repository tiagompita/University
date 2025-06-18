import pyaudio
import wave

file = "/mnt/c/Universidade/University/1 ano/2 Semestre/LI/Guião 8 - Informação Sonora/wave_files/sho - noir.wav"

player = pyaudio.PyAudio()

wf = wave.open(file, "rb")
print("Frequência: ", wf.getframerate())
print("Nº de canais: ", wf.getnchannels())

print("Tamanho(Byte): ", wf.getsampwidth())
print("Nº de Frames de Som: ", wf.getnframes())

stream = player.open(format= player.get_format_from_width(wf.getsampwidth()),
                     channels = wf.getnchannels(),
                     rate = wf.getframerate(),
                     output = True)

while True:
    data = wf.readframes(1024)

    if not data:
        break

    stream.write(data)

stream.close()
wf.close()
player.terminate()