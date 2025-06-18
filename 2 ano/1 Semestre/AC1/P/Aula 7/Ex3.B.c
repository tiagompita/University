#include <stdio.h>
#include <string.h>

#define STR_MAX_SIZE 30

char *strcpy(char *dst, const char *src);
char *strrev(char *str);
void print_string(const char *str);
void print_int10(int num);

int main(void)
{
    static char str1[] = "I serodatupmoC ed arutetiuqrA";
    static char str2[STR_MAX_SIZE + 1];
    int exit_value;

    if (strlen(str1) <= STR_MAX_SIZE) {
        strcpy(str2, str1);
        print_string(str2);
        print_string("\n");
        print_string(strrev(str2));
        exit_value = 0;
    } else {
        print_string("String too long: ");
        print_int10(strlen(str1));
        exit_value = -1;
    }

    return exit_value;
}

char *strcpy(char *dst, const char *src) {
    char *ret = dst;
    while ((*dst++ = *src++) != '\0');
    return ret;
}

char *strrev(char *str) {
    int len = strlen(str);
    for (int i = 0; i < len / 2; i++) {
        char temp = str[i];
        str[i] = str[len - i - 1];
        str[len - i - 1] = temp;
    }
    return str;
}

void print_string(const char *str) {
    printf("%s", str);
}

void print_int10(int num) {
    printf("%d", num);
}