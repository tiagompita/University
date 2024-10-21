#include <stdio.h>

#define SIZE 20

void read_string(char *str, int size);
void print_int10(int num);

int main(void) {
    static char str[SIZE + 1]; // Reserve space for an array of "SIZE+1" bytes
    int num, i;
    
    read_string(str, SIZE); // Read string into str
    
    num = 0;
    i = 0;
    
    while (str[i] != '\0') { // Iterate through the string until null terminator
        if ((str[i] >= '0') && (str[i] <= '9')) {
            num++; // Increment num if the character is a digit
        }
        i++; // Move to the next character
    }
    
    print_int10(num); // Print the number of digits
}

// Dummy implementations for read_string and print_int10
void read_string(char *str, int size) {
    // Implementation to read a string from input
}

void print_int10(int num) {
    printf("%d\n", num); // Print the integer
}