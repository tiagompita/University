package aula12;

import java.io.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Scanner;
import java.util.regex.Pattern;

public class wordCounter {

    static final String file = "C:\\Universidade\\University\\1 ano\\2 Semestre\\POO\\src\\aula12\\words.txt";

    public static Integer loadAndCount(String file) {
        ArrayList<String> list = new ArrayList<>();

        try {
            Scanner scan = new Scanner(new File(file), "UTF-8").useDelimiter("[\\p{Punct}\\s]+");

            while (scan.hasNext()) {
                list.add(scan.next());
            }


            scan.close();
        } catch (FileNotFoundException e) {
            System.out.println("Não foi possível encontrar o ficheiro.");
        }
        
        return list.size();
    }

    public static Integer loadAndCountDiff(String file) {
        HashSet<String> list = new HashSet<>();

        try {
            Scanner scan = new Scanner(new File(file), "UTF-8").useDelimiter(Pattern.compile("[\\p{Punct}\\s]+"));

            while (scan.hasNext()) {
                list.add(scan.next().toLowerCase());
            }

            scan.close();
        } catch (FileNotFoundException e) {
            System.out.println("Não foi possível encontrar o ficheiro.");
        }

        return list.size();
    }
    public static void main(String[] args) {
        System.out.println("Numero total de palavras: " + loadAndCount(file));

        System.out.println("Numero de palavras diferentes: " + loadAndCountDiff(file));
    }
}
