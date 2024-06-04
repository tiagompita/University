import wave
import struct
import sys
from struct import pack
import math

def volume(data, factor):
    return [int(i * factor) for i in data]


def copy(data):
    output = []
    for index,value in enumerate(data):
        output.append(value)
    return output

def main(argv):
    stream = wave.open(argv[1], "rb")
    sample_rate = stream.getframerate()
    num_frames = stream.getnframes()
    raw_data = stream.readframes( num_frames )
    stream.close()

    data = struct.unpack("%dh" % num_frames, raw_data) # "B" para ficheiros 8bits
    # Aplica efeito sobre data, para output_data
    i = 2
    output_data = []
    while i < len(argv):
        if argv[i] == "copy":
            output_data = copy(data)
        elif argv[i] == "reverse":
            output_data = reversed(data)
        elif argv[i] == "volume":
            factor = float(argv[ i + 1])
            output_data = volume(data, factor)
            i+= 1
            
        i += 1

    wvData = b""
    for v in output_data:
        wvData += pack("h", int(v))

    stream = wave.open("out-"+argv[1], "wb")
    stream.setnchannels(1)
    stream.setsampwidth(2)
    stream.setframerate(sample_rate)
    stream.setnframes(len(wvData))
    stream.writeframes(bytearray(wvData))
    stream.close()

if len(sys.argv) < 3:
    print("Usage: %s wave-file filter1 <params> filter2 <params> ..." % sys.argv[0])
else:
    main(sys.argv)

#A partir do 8.11