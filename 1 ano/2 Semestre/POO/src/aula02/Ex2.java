package aula02;

import java.util.Scanner;

public class Ex2 {
    public static void main(String[] args) {
        double celsius, fahrenheit;

        Scanner sc = new Scanner(System.in);
        System.out.print("Insira a temperatura em Celsius: ");
        celsius = sc.nextDouble();

        fahrenheit = 1.8 * celsius + 32;
        System.out.println(celsius + "ºC em fahrenheit é equivalente a: " + fahrenheit);
        sc.close();
    }
}
