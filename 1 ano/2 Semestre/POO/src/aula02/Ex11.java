package aula02;

import java.util.Scanner;

public class Ex11 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Introduz a idade: ");
        int idade = sc.nextInt();

        
        if (Ex11.valIdade(idade)) {
            System.out.println("Idade válida");
        } else {
            System.out.println("Idade inválida");
        }

        sc.close();
    }

    public static boolean valIdade(int idade) {
        return idade >= 0 && idade < 100;
    }
}
