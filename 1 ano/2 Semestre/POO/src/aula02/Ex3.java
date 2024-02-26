package aula02;

import java.util.Scanner;

public class Ex3 {
    public static void main(String[] args) {
        double water, joules, finalT, initialT;
        Scanner sc = new Scanner(System.in);

        System.out.print("Quantidade de água em kg: ");
        water = sc.nextDouble();
        System.out.print("Temperatura inicial (ºC): ");
        initialT = sc.nextDouble();
        System.out.print("Temperatura inicial (ºC): ");
        finalT = sc.nextDouble();

        joules = water * (finalT - initialT) * 4184;
        System.out.println("A energia necessária para aquecer " + water +"kg de agua é: " + joules + "J");
        sc.close();

    }
}
