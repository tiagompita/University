package aula11.Ex4;

import java.util.*;
import java.io.*;
import java.time.*;
import java.time.format.*;

public class Voo {

    private static Map<String, List<String>> voos;
    private static List<List<String>> infos;
    private static String path = "C:\\University\\1 ano\\2 Semestre\\POO\\src\\aula11\\Ex4\\";

    public Voo() {
        voos = new HashMap<>();
        infos = new ArrayList<>();
    }

    public void load(String filename) {

        String file = path + filename;

        try (Scanner scan = new Scanner(new File(file), "UTF-8").useDelimiter("[\\t\\n\\x0B\\f]+")) {
            scan.nextLine();

            while (scan.hasNext()) {
                List<String> info = new ArrayList<>();
                String hora = scan.next();
                String voo = scan.next();
                String companhia = "Companhia";
                String origem = scan.next();
                String atraso = scan.next();

                info.add(hora); // Hora
                info.add(companhia); // Companhia
                info.add(origem); // Origem

                if (atraso.isBlank()) {
                    info.add("-"); // Atraso
                    info.add("-"); // Obs
                } else {
                    info.add(atraso); // Atraso
                    try {
                        DateTimeFormatter format = DateTimeFormatter.ofPattern("HH:mm");
                        LocalTime time = LocalTime.parse(hora.trim(), format);
                        LocalTime delay = LocalTime.parse(atraso.trim(), format);
                        LocalTime newTime = time.plusHours(delay.getHour()).plusMinutes(delay.getMinute());
                        String newTimeStr = "Previsto: " + newTime.format(format);
                        info.add(newTimeStr); // Obs
                    } catch (DateTimeParseException e) {
                        info.add("-"); // Obs
                    }
                }
                infos.add(info);
                voos.put(voo, info);
            }
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred: " + e.getMessage());
        }

        System.out.println(voos.get("IB 8720"));
        System.out.println(voos);
    }

    public void table() {
        System.out.printf("%-7s %-10s %-15s %-20s %-7s %-20s\n", "Hora", "Voo", "Companhia", "Origem", "Atraso", "Obs");
        for (Map.Entry<String, List<String>> entry : voos.entrySet()) {
            List<String> infos = entry.getValue();
            System.out.printf("%-7s %-10s %-15s %-20s %-7s %-20s\n",
                    infos.get(0), // Hora
                    entry.getKey(), // Voo
                    infos.get(1), // Companhia
                    infos.get(2), // Origem
                    infos.get(3), // Atraso
                    infos.get(4)); // Obs
        }
    }

    public static void main(String[] args) {
        Voo voo = new Voo();
        voo.load("voos.txt");
        voo.table();
    }
}
