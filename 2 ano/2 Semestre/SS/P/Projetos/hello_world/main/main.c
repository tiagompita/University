#include <stdio.h>

void app_main(void)
{
    setvbuf(stdout, NULL, _IONBF, 0);
    printf("Hello from ESP32 !!\n");
    fflush(stdout);
}
