/*
   Programa para incrementar 3 variáveis a diferentes frequências:
   - cnt1: 1Hz (incrementa a cada 1000ms)
   - cnt5: 5Hz (incrementa a cada 200ms)
   - cnt10: 10Hz (incrementa a cada 100ms)
   
   Os valores são exibidos na mesma linha, com formatação de 5 dígitos (ex.: 00020   00100   00200).
   Para garantir que a impressão ocorra sempre na mesma linha, inicia-se com o caractere '\r'
   utilizando o system call putChar().
   
*/

void resetCoreTimer(void);          // Reinicia o contador de tempo (core timer)
unsigned int readCoreTimer(void);   // Retorna o valor atual do core timer
void putChar(char c);               // Envia um caractere para o ecrã

// Função delay conforme especificado:
void delay(unsigned int ms) 
{ 
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

int main(void)
{
    int cnt1 = 0, cnt5 = 0, cnt10 = 0;
    int tick = 0;  // Contador de iterações (cada iteração tem delay de 100ms)
    
    while(1)
    {
        delay(100); // Cada iteração tem um delay de 100ms
        tick++;
        
        // Incrementa cnt10 a cada 100ms (10Hz)
        cnt10++;
        
        // Incrementa cnt5 a cada 200ms (a cada 2 iterações de 100ms)
        if(tick % 2 == 0)
            cnt5++;
        
        // Incrementa cnt1 a cada 1000ms (a cada 10 iterações de 100ms)
        if(tick % 10 == 0)
            cnt1++;
        
        // Imprime os valores sempre na mesma linha:
        // 1) Retorna ao início da linha com '\r'
        putChar('\r');
        
        // 2) Imprime cnt1, cnt5 e cnt10, com 3 espaços entre eles
        printInt(cnt1, 10 | 5 << 16);
        putChar('\t');
        printInt(cnt5, 10 | 5 << 16);
        putChar('\t');
        printInt(cnt10, 10 | 5 << 16);
    }
    
    return 0;
}
