package aula03;

import java.util.Scanner;

public class Ex7 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("Escreve uma frase: ");
        String frase = scan.nextLine();

        int num = countDigits(frase);
        System.out.println("Número de dígitos: " + num);

        int numSpace = countSpaces(frase);
        System.out.println("Número de espaços: " + numSpace);

        boolean minusculas = isAllLowerCase(frase);
        System.out.println("Só contém minúsculas? " + minusculas);

        String noSpace = removeExtraSpaces(frase);
        System.out.println("Frase sem espaços extras: " + noSpace);

        boolean ePalindromo = isPalindrome(frase);
        System.out.println("É um palíndromo? " + ePalindromo);

        scan.close();
    }

    public static int countDigits(String s) {
        int count = 0;
        for (char c : s.toCharArray()) {
            if (Character.isDigit(c)) {
                count++;
            }
        }
        return count;
    }

    public static int countSpaces(String s) {
        int count = 0;
        for (char c : s.toCharArray()) {
            if (c == ' ') {
                count++;
            }
        }
        return count;
    }

    public static boolean isAllLowerCase(String s) {
        for (char c : s.toCharArray()) {
            if (Character.isLetter(c) && Character.isUpperCase(c)) {
                return false;
            }
        }
        return true;
    }

    public static String removeExtraSpaces(String s) {
        return s.replaceAll("\\s+", " ");
    }

    public static boolean isPalindrome(String s) {
        String sSemEspacos = s.replaceAll("\\s", "");
        String sReverso = new StringBuilder(sSemEspacos).reverse().toString();
        return sSemEspacos.equalsIgnoreCase(sReverso);
    }
}
