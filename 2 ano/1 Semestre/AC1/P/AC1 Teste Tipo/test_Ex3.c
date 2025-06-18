#include <stdio.h>
#include <string.h>

#define N 35

int read_int() {
    int value;
    scanf("%d", &value);
    return value;
}

void print_int10(int val) {
    printf("%d\n", val);
}

void run_test(int input[], int expected_output[], int expected_odd_count) {
    static int a[N], b[N];
    int n_even = 0;
    int n_odd = 0;
    int *p1, *p2;

    // Copy input to array a
    for (int i = 0; i < N; i++) {
        a[i] = input[i];
    }

    // Separate odd numbers into array b and count even and odd numbers
    for (p1 = a, p2 = b; p1 < (a + N); p1++) {
        if ((*p1 % 2) != 0) {
            *p2++ = *p1;
            n_odd++;
        } else {
            n_even++;
        }
    }

    // Check the output
    int passed = 1;
    if (n_odd != expected_odd_count) {
        passed = 0;
    } else {
        for (int i = 0; i < expected_odd_count; i++) {
            if (b[i] != expected_output[i]) {
                passed = 0;
                break;
            }
        }
    }

    if (passed) {
        printf("Test passed\n");
    } else {
        printf("Test failed\n");
    }
}

int main() {
    int input1[N] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35};
    int expected_output1[] = {1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35};
    run_test(input1, expected_output1, 18);

    int input2[N] = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70};
    int expected_output2[] = {};
    run_test(input2, expected_output2, 0);

    int input3[N] = {1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59, 61, 63, 65, 67, 69};
    int expected_output3[] = {1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59, 61, 63, 65, 67, 69};
    run_test(input3, expected_output3, 35);

    return 0;
}