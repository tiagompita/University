package aula02;

import java.util.Scanner;

public class Ex9 {
    public static void main(String[] args) {
        double n;

        Scanner sc = new Scanner(System.in);
        
        System.out.println("Introduz um numero: ");
        n = sc.nextDouble();
        while (n>0) {
            if (n % 10 == 0) {
                System.out.println(n + "\n");
                n--;
            } else {
                System.out.println(n);
                n--;
            }
        }
    }
}
