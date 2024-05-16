package aula10.Ex4;

import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.io.FileNotFoundException;
import java.util.HashSet;
import java.util.Scanner;

public class App {

    public static void main(String[] args) {
        HashSet<String> words = new HashSet<>();


        try {
            Scanner input = new Scanner(new FileReader("C:\\Users\\tiago\\Documents\\University\\1 ano\\2 Semestre\\POO\\src\\aula10\\Ex4\\words.txt", StandardCharsets.UTF_8));
            while (input.hasNext()) {
                String word = input.next().replaceAll("[^a-zA-Z]+", "");

                if (word.length() > 2 ) {
                    words.add(word);
                    System.out.println(word);
                }
            }
            input.close();
        } catch (FileNotFoundException e) {
            System.out.println("File not found: " + e.getMessage());
        } catch (IOException e) {
            System.out.println("An error occurred:" + e.getMessage());
        }

        for (String word : words) {
            if (word.endsWith("s")) {
                System.out.println(word);
            }

        }
    }

    
}