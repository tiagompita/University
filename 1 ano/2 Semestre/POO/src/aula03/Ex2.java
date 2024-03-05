package aula03;

import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        float investimento, tax = -1;

        do {
            System.out.println("Introduz o montante a inventir(min.: 1000€): ");
            investimento = scan.nextFloat();

            System.out.println("Introduz a taxa de juro mensal (%): ");
            tax = scan.nextFloat();
        } while (investimento % 1000 != 0 && tax < 0 && tax > 5);

        for (int i=0; i<12; i++) {
            investimento = investimento + (investimento * (tax/100));
            System.out.println("Mês "+ i + ": " +investimento);
        }
        
        scan.close();
    }
}
