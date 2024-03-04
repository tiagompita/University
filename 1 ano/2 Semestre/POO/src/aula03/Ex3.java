package aula03;

import java.util.Scanner;

public class Ex3 {
    public static void main(String[] args) {

        String resposta = "S";
        Scanner scan = new Scanner(System.in);

        do {
            
            int secret = common.Utils.randomInt(100, 0);

            System.out.println("Bem-vindo ao jogo HighLow.");
            System.out.print("");
            System.out.println("Introduz um número:");

            int guess = scan.nextInt();
            int attempts = 0;

            while(guess != secret) {

                if (guess > secret) {
                    System.out.println("High");
                    attempts += 1;
                    guess = scan.nextInt();

                } else if (guess < secret) {
                    System.out.println("Low");
                    attempts += 1;
                    guess = scan.nextInt();

                }

            }

            System.out.println("Ao fim de " + attempts + " advinhas-te o número " + secret);
            System.out.println("Pretende continuar? Prima (S)im");
            resposta = scan.next();

        } while (resposta.equalsIgnoreCase("S"));

        scan.close();

        System.exit(0);

    }
}
