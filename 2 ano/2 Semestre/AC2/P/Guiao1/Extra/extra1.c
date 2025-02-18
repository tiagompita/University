#define UP 1
#define DOWN 0
#define STOP 2

void wait(int);

int main(void) {
    int state = STOP;
    int cnt = 0;
    char c;
    
    do
    {
        putChar('\r');   // Carriage return character 
        printInt(cnt, 10 | 3 << 16); // 0x0003000A: decimal w/ 3 digits 
        putChar('\t');   // Tab character 
        printInt(cnt, 2 | 8 << 16); // 0x00080002: binary w/ 8 bits

        wait(5);      // wait 0.5s 

        c = inkey(); 
        if (c == '+') 
            state = UP; 
        else if (c == '-') 
            state = DOWN; 
        else if (c == 's') 
            state = STOP;
        else if (c == 'r')
            cnt = 0;
        else
            if (state == UP) 
                cnt = (cnt + 1) & 0xFF;  // Up counter MOD 256 
            else if (state == DOWN)  
                cnt = (cnt - 1) & 0xFF; // Down counter MOD 256

    } while (c != 'q');

    return 0;
}

void wait(int ts) {
    int i;
    for (i = 0; i < ts * 515000; i++) { // wait approximately ts/10 seconds 
    }
}