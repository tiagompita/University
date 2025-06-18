import wave
import struct
import sys
from struct import pack
import math
import random

def volume(data, factor):
    return [int(i * factor) for i in data]

def copy(data):
    return data[:]

def normalize(data):
    max_val = max(abs(i) for i in data)
    if max_val == 0:
        return data  # Prevent division by zero if data is all zeros
    factor = 32767.0 / max_val
    return volume(data, factor)

def fadein(data, sample_rate, duration):
    fade_samples = int(sample_rate * duration)
    step = 1.0 / fade_samples
    output = []
    for index, value in enumerate(data):
        factor = min(index * step, 1.0)
        output.append(int(value * factor))
    return output

def fadeout(data, sample_rate, duration):
    fade_samples = int(sample_rate * duration)
    step = 1.0 / fade_samples
    output = []
    for index, value in enumerate(data):
        factor = min((len(data) - index) * step, 1.0)
        output.append(int(value * factor))
    return output

def mask(data, sample_rate, mask_type, start_time, duration, volume_scale=0.01):
    start_sample = int(start_time * sample_rate)
    end_sample = start_sample + int(duration * sample_rate)
    output = list(data)  # Convert tuple to list
    
    for i in range(start_sample, min(end_sample, len(data))):
        if mask_type == "silence":
            output[i] = 0
        elif mask_type == "noise":
            output[i] = int(random.randint(-32768, 32767) * volume_scale)
        elif mask_type == "tone":
            freq = 440  # Exemplo de frequência, você pode parametrizar
            output[i] = int(32767 * volume_scale * math.sin(2 * math.pi * freq * (i / sample_rate)))
    
    return output

def modulate(data, sample_rate, freq):
    return [int(vo * math.sin(2 * math.pi * freq * i / sample_rate)) for i, vo in enumerate(data)]

def delay(data, sample_rate, amount, delay_time):
    tdelay = int(delay_time * sample_rate)
    output = [0] * (len(data) + tdelay)
    
    for index, value in enumerate(data):
        output[index] += value
        if index + tdelay < len(output):
            output[index + tdelay] += int(value * amount)
    
    if amount < 0.05:
        return output[:len(data)]
    
    return delay(output, sample_rate, amount * 0.8, delay_time * 1.2)[:len(data)]

def steg_add(data, message):
    bitstream = ""
    for c in message:
        bitstream += format(ord(c), '08b')  # Convert each character to an 8-bit binary string
    bitstream += '00000000'  # Adding a null character at the end to mark the end of the message
    
    output = []
    encoded_bit = 0
    for index, value in enumerate(data):
        if encoded_bit < len(bitstream):
            lsb = int(bitstream[encoded_bit])  # Get the next bit to encode
            encoded_value = (value & ~1) | lsb  # Set the LSB to the bit value
            output.append(encoded_value)
            encoded_bit += 1
        else:
            output.append(value)  # If message bits are exhausted, keep the original value
    
    return output

def steg_get(data):
    bitstream = ""
    for value in data:
        bitstream += str(value & 1)  # Extract the LSB and add to bitstream
    
    message = ""
    for i in range(0, len(bitstream), 8):
        byte = bitstream[i:i+8]
        if byte == '00000000':  # Null character marks the end of the message
            break
        message += chr(int(byte, 2))
    
    return message

def main(argv):
    stream = wave.open(argv[1], "rb")
    sample_rate = stream.getframerate()
    num_frames = stream.getnframes()
    raw_data = stream.readframes(num_frames)
    stream.close()

    data = struct.unpack("%dh" % num_frames, raw_data)

    output_data = list(data)  # Convert tuple to list
    i = 2
    while i < len(argv):
        if argv[i] == "copy":
            output_data = copy(output_data)
        elif argv[i] == "reverse":
            output_data = list(reversed(output_data))
        elif argv[i] == "volume":
            factor = float(argv[i + 1])
            output_data = volume(output_data, factor)
            i += 1
        elif argv[i] == "normalize":
            output_data = normalize(output_data)
        elif argv[i] == "fade-in":
            duration = float(argv[i + 1])
            output_data = fadein(output_data, sample_rate, duration)
            i += 1
        elif argv[i] == "fade-out":
            duration = float(argv[i + 1])
            output_data = fadeout(output_data, sample_rate, duration)
            i += 1
        elif argv[i] == "mask":
            mask_type = argv[i + 1]
            start_time = float(argv[i + 2])
            duration = float(argv[i + 3])
            volume_scale = 0.01  # Define a escala de volume para noise e tone
            output_data = mask(output_data, sample_rate, mask_type, start_time, duration, volume_scale)
            i += 3
        elif argv[i] == "modulate":
            freq = float(argv[i + 1])
            output_data = modulate(output_data, sample_rate, freq)
            i += 1
        elif argv[i] == "delay":
            delay_time = float(argv[i + 1])
            amount = float(argv[i + 2])
            output_data = delay(output_data, sample_rate, amount, delay_time)
            i += 2
        elif argv[i] == "steg_add":
            message = argv[i + 1]
            output_data = steg_add(output_data, message)
            i += 1
        elif argv[i] == "steg_get":
            message = steg_get(output_data)
            print("Decoded message:", message)
        i += 1

    wvData = b""
    for v in output_data:
        wvData += pack("h", int(v))

    stream = wave.open("out-" + argv[1], "wb")
    stream.setnchannels(1)
    stream.setsampwidth(2)
    stream.setframerate(sample_rate)
    stream.setnframes(len(output_data))
    stream.writeframes(wvData)
    stream.close()

if len(sys.argv) < 3:
    print("Usage: %s wave-file filter1 <params> filter2 <params> ..." % sys.argv[0])
else:
    main(sys.argv)
