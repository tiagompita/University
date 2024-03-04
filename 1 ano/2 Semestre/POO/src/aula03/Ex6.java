package aula03;
import java.util.Scanner;

public class Ex6 {
    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);
        System.out.print("Escreve uma frase: ");
        String frase = scan.nextLine();

        // minúsculas
        String fraseMinuscula = frase.toLowerCase();
        System.out.println(fraseMinuscula);

        // último carater da frase
        char ultimoCarater = frase.charAt(frase.length() - 1);
        System.out.println("Último caractere: " + ultimoCarater);

        // Três primeiros carateres
        String first3 = frase.substring(0, 3);
        System.out.println("Três primeiros carater: " + first3);

        // Comprimento da frase
        int comprimento = frase.length();
        System.out.println("Comprimento da frase: " + comprimento);

        // Verificar se a frase está vazia
        boolean isEmpty = frase.isEmpty();
        System.out.println("A frase está vazia? " + isEmpty);

        // Substituir a por @
        String substituir = frase.replace('a', '@');
        System.out.println("Frase com 'a' substituído por '@': " + substituir);
        
        scan.close();
    }

}