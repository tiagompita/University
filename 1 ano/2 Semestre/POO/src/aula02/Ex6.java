package aula02;

import java.util.Scanner;

public class Ex6 {
    public static void main(String[] args) {
        int segundos;

        Scanner sc = new Scanner(System.in);
        System.out.print("Introduz o tempo (s): ");
        segundos = sc.nextInt();

        int horas = segundos / 3600;
        int resto = segundos % 3600;


        int minutos = resto / 60;
        int seg = resto % 60;

        System.out.println(horas+"h:"+minutos+"m:"+ seg + "s");
        sc.close();
    }
}
