Introduction to Embedded Device Reverse Engineering - STUDENT
===

Rules:
- Take good care of the hardware. Please return it after the class.
- DO NOT connect to any VCC pins or chip legs unless told by the instructor to do so.
- DO NOT press the reset button or reset the routers or boards provided to you!
- Before making any connections to the board, make sure the power supply is disconnected. If you need to re-adjust the pin connections, remove the power supply first.
- Do not use Artificial Intelligence (AI) to search for solutions. Use your brain. Otherwise you will get replaced quickly!
- PLEASE do not post any information about this workshop online; you will ruin the experience for future students.


## Exercise 1: Identifying components on a PCB
Have a look at the picture that was provided to you, which is a photo of the router board. 
Can you identify the MANUFACTURER and MODEL of each component in the picture?
DO NOT do a reverse image search! That's cheating :D

1. GD 25Q32CSIG
2. Zentel A3S56D40GTP -50L
3. MEDIATEK MT7628NN


## Exercise 2: Reading the bootlog
After connecting to the UART pins we're able to get a debug shell, great!
If we reboot the router, we can see how it boots - and this gives us a LOT of valuable information.

You have been provided with the bootlog of your router. Analyse it and answer the following questions:

1. What is the bootloader version?
    4.3.0.0
2. What is the Linux kernel version?
    2.6.36
3. How many memory regions are configured and which are they?
    5
    "boot"
    "kernel"
    "rootfs"
    "config"
    "radio"
4. What is the address and size of each partition?
    0x000000000000-0x000000010000 : "boot"
    0x000000010000-0x000000100000 : "kernel"
    0x000000100000-0x0000003e0000 : "rootfs"
    mtd: partition "rootfs" set to be root filesystem
    0x0000003e0000-0x0000003f0000 : "config"
    0x0000003f0000-0x000000400000 : "radio"


## Exercise 3: Analysing the firmware dump
You got your hands on a firmware dump. Great! Now let's analyse it. 

1. Can you find the router's Wi-Fi password?
A partir da bootlog do exercicio 2 analisamos om que parte da memoria está alocada a config. Com este comando (existem outras maneiras) "dd if=dump2.bin of=config bs=1 skip=$((0x3e0000)) count=$((0x10000))" Podemos extrair a config o ficheiro gerado terá um xml com as passwords necessarias.

pwd: deadbeef
2. What about the admin password?
Flashback1337

Once you have those, connect via Wi-Fi and login to the web interface using the admin password.


### Exercise 4: Analysing an unknown binary file
What's this? An unknown file? Hmmm... I see some clear patterns here... see if you can make sense of it!

4C 33 33 54 9F EE 02 00 00 00 00 03 BC 2D 6A B2

Andamos de 4 em 4 bytes pois os processadores modernos utilizam int32.

Inicio do HEADER: 4C 33 33 54 - "L33T"

Tamanho do ficheiro: 9F EE 02 00 (É possivel verificar se é verdade olhando para o ultimo endereço do binario "0002EE90 + F"
Numero de segmentos do ficheiro: 00 00 00 03

Curioso que a informaçao do tamanho do ficheiro está em little endian, mas o numero de segmentos está em big endian.

checksum: BC 2D 6A B2

Entre o header e os segmentos existe um padding de 16 bytes (00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00)

Em diante cada segmentos começa por T33L (54 33 33 4C). Cada segmento tem o seu header.

Primeiro header do primeiro segmento: 54 33 33 4C 06 45 01 00 20 00 0D 40 96 C7 58 EF

54 33 33 4C - "T33L"

06 45 01 00 - Tamanho do segmento (little endian)

20 00 0D 40 - Load address do segmento (little endian) -> 20+00+0D+40 = 6D (ou seja, o address começa em 0000 006D ACHO EU)

96 C7 58 EF - Checksum do segmento

Mais uma vez no fim do header há um padding de 16 bytes.

### Exercise 5: Loading the file into Ghidra and solving the challenge
Good job, now you know what the file is. Cut it and load it into Ghidra. Enter the right button combination on the device to solve the challenge!

* The secret code is a combination of presses of the BOOT button, with waits of a few seconds in between. 
* A wrong combination will trigger a 10 second lockout with the blue led blinking. 
* The right combination will make the blue led solid.
* Pressing the EN button will reboot the device.
