package aula11.Ex4;

import java.util.*;
import java.io.*;
import java.time.*;
import java.time.format.*;

public class Voo {

    private Map<String, List<String>> voos;
    private String path = "C:\\Universidade\\University\\1 ano\\2 Semestre\\POO\\src\\aula11\\Ex4\\";

    public Voo() {
        voos = new HashMap<>();
    }

    public void load(String filename) {
        String file = path + filename;

        try (Scanner scan = new Scanner(new File(file), "UTF-8")) {
            scan.nextLine(); // Skip header

            while (scan.hasNextLine()) {
                List<String> info = new ArrayList<>();
                String line = scan.nextLine();
                String[] parts = line.split("\t");

                if (parts.length < 3) {
                    continue; // Skip malformed lines
                }

                String hora = parts[0];
                String voo = parts[1];
                String origem = parts[2];
                String atraso = parts.length > 3 ? parts[3] : "";

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
                voos.put(voo, info);
            }
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred: " + e.getMessage());
        }

        System.out.println(voos.get("IB 8720"));
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
        /* voo.table(); */
    }
}
