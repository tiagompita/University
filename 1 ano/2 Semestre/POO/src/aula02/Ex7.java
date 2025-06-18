package aula02;

import java.util.Scanner;

public class Ex7 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("Coordenadas do Ponto 1 (X,Y): ");
        double p1x = sc.nextDouble();
        double p1y = sc.nextDouble();

        System.out.println("Coordenadas do Ponto 2 (X,Y): ");
        double p2x = sc.nextDouble();
        double p2y = sc.nextDouble();

        double d = Math.sqrt((p2x - p1x)*(p2x - p1x) + (p2y - p1y)*(p2y - p1y));
        System.out.println("A distancia entre os dois pontos é: " + d);
        sc.close();
    }
}
