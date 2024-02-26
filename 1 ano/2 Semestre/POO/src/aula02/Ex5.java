package aula02;

import java.util.Scanner;

public class Ex5 {
    public static void main(String[] args) {
        double v1,d1,v2,d2,t1,t2,mf;
        
        Scanner sc = new Scanner(System.in);
        System.out.print("Qual a velocidade do primeiro trajeto? ");
        v1 = sc.nextDouble();
        while (v1 <= 0) {
            System.err.println("Valor inválido");
            System.out.print("Qual a velocidade do primeiro trajeto? ");
            v1 = sc.nextDouble();
        }


        System.out.print("Qual a distancia do primeiro trajeto? ");
        d1 = sc.nextDouble();
        while (d1 <= 0) {
            System.err.println("Valor inválido");
            System.out.print("Qual a distancia do primeiro trajeto? ");
            d1 = sc.nextDouble();
        }


        System.out.print("Qual a velocidade do segundo trajeto? ");
        v2 = sc.nextDouble();
        while (v2 <= 0) {
            System.err.println("Valor inválido");
            System.out.print("Qual a velocidade do segundo trajeto? ");
            v2 = sc.nextDouble();
        }


        System.out.print("Qual a distancia do segundo trajeto? ");
        d2 = sc.nextDouble();
        while (d2 <= 0) {
            System.err.println("Valor inválido");
            System.out.print("Qual a distancia do segundo trajeto? ");
            d2 = sc.nextDouble();
        }

        t1 = d1 / v1;
        t2 = d2 / v2;

        mf = (d1 + d2) / (t1 + t2);
        System.out.println("A velocidade média final é de: " + mf);

        sc.close();
    }
}
