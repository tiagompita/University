package aula12;

import java.io.*;
import java.util.*;

public class AllWordsOrganized {

    static final String file = "C:\\Universidade\\University\\1 ano\\2 Semestre\\POO\\src\\aula12\\resumo-de-a-cidade-e-as-serras.txt";

    public static TreeMap<String, TreeMap<String, Integer>> WordsOrganized(String file) {
        TreeMap<String, TreeMap<String, Integer>> list = new TreeMap<>();
        char[] alfabeto = "abcdefghijklmnopqrstuvwxyz".toCharArray();

        try {
            Scanner scan = new Scanner(new File(file), "UTF-8").useDelimiter("[\\p{Punct}\\s]+");

            for (char letter : alfabeto) {
                list.put(String.valueOf(letter), new TreeMap<>());
            }

            while (scan.hasNext()) {
                String word = scan.next().toLowerCase();
                if (word.length() < 2) 
                    continue;

                for (String letter : list.keySet()) {
                    if(word.startsWith(letter)) {
                        list.get(letter).put(word, list.get(letter).getOrDefault(word, 0) + 1);
                    }
                }

            }


            scan.close();
        } catch (FileNotFoundException e) {
            System.out.println("Não foi possível encontrar o ficheiro.");
        }
        
        return list;
    }


    public static void main(String[] args) {

        TreeMap<String, TreeMap<String, Integer>> list = WordsOrganized(file);
        
        for (Map.Entry<String, TreeMap<String, Integer>> entry : list.entrySet()) {
            System.out.print("\n" + entry.getKey() + ":");
            for (Map.Entry<String, Integer> innerEntry : entry.getValue().entrySet()) {
                System.out.print(" " + innerEntry.getKey() + ", " + innerEntry.getValue() + ";");
            }
        }

    }
}
