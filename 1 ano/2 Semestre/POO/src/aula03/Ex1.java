package aula03;

import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int num = -1;

        do {
            System.out.println("Introduz um número inteiro positivo: ");
            num = scan.nextInt();
        } while (num < 0);

        int sum = num;

        for (int i = 2; i <= num; i++) {
            if (isPrime(i)) {
                sum += i;
            }
        }

        System.out.println("A soma de todos os números primos até esse valor(inclusive) é: "+ sum);

        scan.close();
    }

    public static boolean isPrime(int num) {
        if (num <= 1) {
            return false;
        }
        for (int i = 2; i < num; i++) {
            if (num % i == 0) {
                return false;
            }
        }
        return true;
    }
}
