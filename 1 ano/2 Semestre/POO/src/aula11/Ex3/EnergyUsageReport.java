package aula11.Ex3;

import java.util.*;
import java.io.*;

public class EnergyUsageReport {

    private static Map<Integer, List<Double>> list;
    private static String path = "C:\\Universidade\\University\\1 ano\\2 Semestre\\POO\\src\\aula11\\Ex3\\";

    public EnergyUsageReport() {
        list = new TreeMap<>();
    }

    public void load(String file) throws IOException {
        file = path + file;

        try (Scanner scan = new Scanner(new File(file), "UTF-8").useDelimiter("[|\\\n]+")) {
            
            while (scan.hasNext()) {
                Integer clientID = Integer.valueOf(scan.next());
                List<Double> leituras = new ArrayList<>();
                leituras.add(Double.valueOf(scan.next()));
                leituras.add(Double.valueOf(scan.next()));
                leituras.add(Double.valueOf(scan.next()));
                leituras.add(Double.valueOf(scan.next()));

                list.put(clientID, leituras);
            }

        }
    }

    public void addCustomer(Customer customer) {
        list.putIfAbsent(customer.getCustomerId(), customer.getMeterReadings());
    }

    public void removeCustomer(Integer id) {
        if (list.containsKey(id)) {
            list.remove(id);
        } else {
            System.out.println("Couldn't find the customer.");
        }
    }

    public Customer getCustomer(Integer id) {
        if (list.containsKey(id)) {
            return new Customer(id, list.get(id));
        } else {
            System.out.println("Couldn't  find the customer.");
            return null;
        }
    }

    public double calculateTotalUsage(Integer id) {
        double total = 0d;
        
        for (double leitura : list.get(id)) {
            total += leitura;
        }

        return total;
    }

    public void generateReport(String filename) throws IOException{
        File file = new File(path + filename);
    
        try (FileWriter report = new FileWriter(file)) {
            for (Map.Entry<Integer, List<Double>> entry : list.entrySet()) {
                double totalConsumed = calculateTotalUsage(entry.getKey());
                report.write("Client ID: " + entry.getKey() + "\t//\tTotal consumed: " + totalConsumed + "\n");
            }
        }
    
        System.out.println("Done.");
    }
}
