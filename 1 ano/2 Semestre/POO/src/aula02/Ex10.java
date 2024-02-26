package aula02;

import java.util.Scanner;

public class Ex10 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Introduz um numero: ");
        double num = sc.nextDouble();

        double postnum = num;
        double max = num;
        double min = num;
        double sum = num;

        int count = 1;

        do {
            System.out.println("Introduz outro número:");
            num = sc.nextDouble();

            if (num > max) {
                max = num;
            }

            if (num < min) {
                min = num;
            }

            sum += num;
            count++;

        } while (num != postnum);


        double media = sum / count;

        System.out.println("O Valor máximo é: " + max);
        System.out.println("O Valor mínimo é: " + min);
        System.out.println("O Valor médio é: " + media);
        System.out.println("O Valor total é: " + sum);

        sc.close();
    }
}
