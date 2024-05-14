package aula10.Ex3;

import java.util.HashSet;
import java.util.TreeMap;

public class App {

    public static void main(String[] args) {
        TreeMap<String, HashSet<Integer>> treemap = new TreeMap<>();
        String frase = "Hello World";
        Integer counter = 0;

        for(char c: frase.toCharArray()) {
            String key = String.valueOf(c);

            if(!treemap.containsKey(key)) {
                treemap.put(key, new HashSet<Integer>());
                treemap.get(key).add(counter);
            } else {
                treemap.get(key).add(counter);
            }
            counter++;
        }

        System.out.println(treemap.toString());
    }
}
