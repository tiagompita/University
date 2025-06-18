package aula03;

import java.util.Scanner;

public class Ex8 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        System.out.println("Escreva a frase para tornar acrónimo:");
        String frase = scan.nextLine();

        String lista[] = frase.split(" ");

        String acro = "";
        for (int i=0; i < lista.length ; i++) {
            if (lista[i].length() >= 3) {
                acro += lista[i].charAt(0);
            }
        }
        System.out.println("Acrónimo: " + acro);

        scan.close();
    }
}