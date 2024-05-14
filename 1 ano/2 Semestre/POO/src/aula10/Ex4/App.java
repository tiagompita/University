package aula10.Ex4;

import java.io.FileReader;
import java.io.FileNotFoundException;
import java.util.HashSet;
import java.util.Scanner;

public class App {

    public static void main(String[] args) {
        HashSet<String> words = new HashSet<>();


        try {
            Scanner input = new Scanner(new FileReader("C:\\Universidade\\University\\1 ano\\2 Semestre\\POO\\src\\aula10\\Ex4\\words.txt"));
            while (input.hasNext()) {
                String word = input.next();
                if (word.length() > 2 && word.matches("[a-zA-Z]*")) {
                    words.add(word);
                    System.out.println(word);
                }
            }
            input.close();
        } catch (FileNotFoundException e) {
            System.out.println("File not found: " + e.getMessage());
        }

        for (String word : words) {
            if (word.endsWith("s")) {
                System.out.println(word);
            }

        }
    }

    
}