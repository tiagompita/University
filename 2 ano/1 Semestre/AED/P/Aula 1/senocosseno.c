#include <stdio.h>
#include <math.h>

int main(void)
{
    printf("%3s %8s %8s\n", "ang", "sin(ang)", "cos(ang)");
    printf("--- -------- -------- \n");
    for (int i = 0; i <= 20; i += 5)
    {
        double radians = i * M_PI / 180.0;
        double sen_arg = sin(radians);
        double cos_arg = cos(radians);
        printf("%3d %8.3f %8.3f\n", i, sen_arg, cos_arg);
    }

    return 0;
}