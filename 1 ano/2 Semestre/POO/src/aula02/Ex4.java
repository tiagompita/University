package aula02;

import java.util.Scanner;

public class Ex4 {
    public static void main(String[] args) {
        double investido, tjuro;

        Scanner sc = new Scanner(System.in);
        System.out.print("Indica o montante investido (€): ");
        investido = sc.nextDouble();
        System.out.print("Qual a tava de juro mensal(%): ");
        tjuro = sc.nextDouble();

        for (int i=0; i<3; i++)
            investido = investido + (investido * (tjuro/100));

        System.out.println("Ao fim de 3 meses, o total será de:" + investido);
        sc.close();
    }
}