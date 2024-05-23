package aula11.Ex4;

import java.io.*;
import java.util.*;

public class MostrarSeparadores {

    private static String path = "C:\\University\\1 ano\\2 Semestre\\POO\\src\\aula11\\Ex4\\";

    public static void main(String[] args) {
        MostrarSeparadores ms = new MostrarSeparadores();
        ms.readAndShowSeparators("voos.txt");
    }

    public void readAndShowSeparators(String filename) {
        String file = path + filename;

        try (Scanner scanner = new Scanner(new File(file), "UTF-8")) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String visibleLine = makeSeparatorsVisible(line);
                System.out.println(visibleLine);
            }
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred: " + e.getMessage());
        }
    }

    private String makeSeparatorsVisible(String line) {
        StringBuilder sb = new StringBuilder();
        for (char c : line.toCharArray()) {
            switch (c) {
                case '\t':
                    sb.append("\\t");
                    break;
                case ' ':
                    sb.append("\\s");
                    break;
                case '\n':
                    sb.append("\\n");
                    break;
                case '\r':
                    sb.append("\\r");
                    break;
                default:
                    sb.append(c);
                    break;
            }
        }
        return sb.toString();
    }
}
