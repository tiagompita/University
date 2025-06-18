#define K 20000

void delay(unsigned int ms) {
    resetCoreTimer();
    while(readCoreTimer() < K * ms);
}

void configD11(void);
void outD11(int val);

int main(void) {

    //Inicialização do LED D11
    configD11();

    while(1) {
        
        outD11(1);
        delay(500);

        outD11(0);
        delay(600);

        outD11(1);
        delay(200);

        outD11(0);
        delay(150);

        outD11(1);
        delay(100);
        
        outD11(0);
        delay(600);

    }
    return 0;
}