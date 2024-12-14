#include <stdio.h>
#include <math.h>

float xtoy(float x, int y)
{
    int i;
    float result;
    for (i = 0, result = 1.0; i < abs(y); i++)
    {
        if (y > 0)
            result *= x;
        else
            result /= x;
    }
    return result;
}

int abs(int val)
{
    if (val < 0)
        val = -val;
    return val;
}

int main()
{
    float x;
    int y;

    // Test cases
    printf("Testing x^y\n");
    printf("Enter the value of x: ");
    if (scanf("%f", &x) != 1)
    {
        printf("Invalid input for x.\n");
        return 1; // Indicate an error
    }

    printf("Enter the value of y: ");
    if (scanf("%d", &y) != 1)
    {
        printf("Invalid input for y.\n");
        return 1; // Indicate an error
    }

    float result = xtoy(x, y);

    printf("x^y = %.6f\n", result);

    return 0;
}