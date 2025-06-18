package aula11.Ex1;

import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class test {

    static final String file = "C:\\Universidade\\University\\1 ano\\2 Semestre\\POO\\src\\aula11\\Ex1\\test.txt";
    public static void main(String[] args) {
        Map<String, Map<String, Integer>> wordPairs = new TreeMap<>();

        try {
            Scanner scan = new Scanner(new FileReader(file, StandardCharsets.UTF_8));
            scan.useDelimiter("[\\s*\\t\\n.,:'\\‘\\’;?!\\-*{}=+&/()\\[\\]\\”\\“\"\']+");

            String prevWord = null;
            
            while (scan.hasNext()) {
                String word = scan.next().toLowerCase();
                if (word.length() < 3 || word.isEmpty()) {
                    continue;
                }

                if (prevWord != null) {
                    wordPairs.putIfAbsent(prevWord, new TreeMap<>());
                    wordPairs.get(prevWord).put(word, wordPairs.get(prevWord).getOrDefault(word, 0) + 1);
                }

                prevWord = word;
            }

            scan.close();
        } catch (IOException e) {
            System.out.println("An error occurred: " + e.getMessage());
        }

        for (Map.Entry<String, Map<String, Integer>> entry : wordPairs.entrySet()) {
            System.out.println(entry.getKey() + "=" + entry.getValue());
        }
    }
}