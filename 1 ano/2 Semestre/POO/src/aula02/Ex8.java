package aula02;

import java.util.Scanner;

public class Ex8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        double A = 0, B = 0;

        while (A <= 0) {
            System.out.println("Indica o valor do cateto A:");
            A = sc.nextDouble();
            if (A <= 0) {
                System.out.println("Valor inválido.");
            }
        }

        while (B <= 0) {
            System.out.println("Indica o valor do cateto B:");
            B = sc.nextDouble();
            if (B <= 0) {
                System.out.println("Valor inválido.");
            }
        }

        double C = Math.sqrt(A * A + B * B);

        System.out.println("O valor da hipotenusa é:" + C);
        sc.close();
    }
}
