#include <detpic32.h>

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

int main()
{
    int contador = 0;
    float freq = 100;
    while(1){
        int i = 0;

        do
        {
            send2displays(contador);
            // 50Hz
            delay(20);
        } while (i++ < (int)freq);

        char c = inkey();
        if (c >= '0' && c <= '4')
        {
            freq = 2 * (1 + (c - '0'));
        }

        if (c == 13)
        {
            putChar('\r');
            printStr("Freq: ");
            printInt10(freq);
            putChar('\n');
        }

        contador = (contador + 1) % 100;

        putChar('\r');
        printStr("Contador: ");
        printInt10(contador);
    }
    return 0;
}
