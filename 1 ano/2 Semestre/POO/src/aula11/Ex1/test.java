package aula11.Ex1;

import java.io.FileReader;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;
import java.util.TreeMap;

public class test {

    public static void main(String[] args) {
        TreeMap<String, String> map = new TreeMap<>();

        try {
            Scanner scan = new Scanner(new FileReader("C:\\Users\\tiago\\Documents\\University\\1 ano\\2 Semestre\\POO\\src\\aula11\\Ex1\\test.txt",StandardCharsets.UTF_8));
            scan.useDelimiter("[\t\n.,:'‘’;?!-*{}=+&/()\\[\\]”“\"\']+");
            while (scan.hasNext()) {
                String word = scan.next();
                
            scan.close();
            }
        } catch (Exception e) {
            System.out.println("An error occurred: " + e.getMessage());
        }
    }

}
