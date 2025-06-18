#include <stdio.h>
#include <math.h>

#define NUM_TESTS 9

double sqrt(double val)
{
    double aux, xn = 1.0;
    int i = 0;
    if (val > 0.0)
    {
        do
        {
            aux = xn;
            xn = 0.5 * (xn + val / xn);
        } while ((aux != xn) && (++i < 25));
    }
    else
        xn = 0.0;
    return xn;
}

int main()
{
    double numbers[NUM_TESTS] = {0.0, 1.0, 4.0, 9.0, 25.0, 16.0, 2.0, 7.0, -1.0};

    for (int i = 0; i < NUM_TESTS; i++)
    {
        double result = sqrt(numbers[i]);
        printf("Raiz quadrada de %.2lf: %.4lf\n", numbers[i], result);

        if (numbers[i] >= 0.0)
        { // Comparação feita para valores positivos
            printf("Comparação com a função sqrt do math.h: %.4lf\n", sqrt(numbers[i]));
        }
    }

    return 0;
}