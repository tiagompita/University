#include <stdio.h>
#include <math.h>

int main(void) {
    printf("%5s\t|\t%10s\t|\t%12s\n", "Num", "Quadrado", "Raiz Quadrada");
    for (int i = 1; i <= 10; i++)
    {
        double sqroot = sqrt(i);
        printf("%5d\t|\t%10d\t|\t%12.6f\n", i, i * i, sqroot);
    }
    
    return 0;
}