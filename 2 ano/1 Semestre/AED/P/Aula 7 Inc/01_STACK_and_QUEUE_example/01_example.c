//
// TO DO : desenvolva um algoritmo para verificar se um numero inteiro positivo
//         e uma capicua
//         Exemplos: 12321 e uma capiacua, mas 123456 nao e
//         USE uma PILHA DE INTEIROS (STACK) e uma FILA DE INTEIROS (QUEUE)
//
// TO DO : design an algorithm to check if the digits of a positive decimal
//         integer number constitue a palindrome
//         Examples: 12321 is a palindrome, but 123456 is not
//         USE a STACK of integers and a QUEUE of integers
//

#include <stdio.h>

#include "IntegersQueue.h"
#include "IntegersStack.h"

int main(void) { 
    
    // create stack and queue
    Stack* stack = StackCreate(100);
    Queue* queue = QueueCreate(100);

    // read a number
    long long number, digit;
    printf("Digite um numero inteiro positivo: ");
    scanf("%lld", &number);

    // process digits into queue and stack
    long long temp = number;
    while (temp > 0) {
        digit = temp % 10;
        StackPush(stack, digit);
        QueueEnqueue(queue, digit);
        temp /= 10;
    }

    // verify capicua condition
    int IsCapicua = 1;
    while (!StackIsEmpty(stack) && !QueueIsEmpty(queue)) {
        if (StackPop(stack) != QueueDequeue(queue)) {
            IsCapicua = 0;
            break;
        }
    }

    // print result
    if (IsCapicua) {
        printf("%lld e' uma capicua.\n", number);
    } else {
        printf("%lld nao e' uma capicua.\n", number);
    }

    // destroy queue and stack
    StackDestroy(&stack);
    QueueDestroy(&queue);


    return 0; 
}
