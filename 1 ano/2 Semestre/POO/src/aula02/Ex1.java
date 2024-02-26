package aula02;

import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args) {
        double miles, km;
        
        Scanner sc = new Scanner(System.in);
        System.out.print("Insira a distância em km:");
        km = sc.nextDouble();

        miles = km / 1.609;

        System.out.println("A distância em milhas é: " + miles);
        sc.close();
    }
}
