#include <stdio.h>

unsigned int div(unsigned int dividendo, unsigned int divisor) {
    if (divisor == 0) {
        // Handle division by zero
        return 0; // or some error code
    }
    
    if (dividendo < divisor) {
        // If the divisor is greater than the dividendo, the quociente is 0
        return 0;
    }

    unsigned int quociente = 0;
    unsigned int resto = dividendo;

    while (resto >= divisor) {
        resto -= divisor;
        quociente++;
    }

    // Combine quociente and resto into a single value if needed
    // For example, return (resto << 16) | quociente;
    return quociente;
}

int main() {
    unsigned int dividendo = 0x8000;
    unsigned int divisor = 0x8000;
    unsigned int result = div(dividendo, divisor);
    printf("Result: %u\n", result);
    return 0;
}