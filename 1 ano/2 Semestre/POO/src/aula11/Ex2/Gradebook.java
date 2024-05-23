package aula11.Ex2;

import java.util.*;
import java.io.*;

public class Gradebook {

    private static String path = "C:\\Universidade\\University\\1 ano\\2 Semestre\\POO\\src\\aula11\\Ex2\\";
    private static Map<String, ArrayList<Double>> gradebook;
    
    public Gradebook() {
        gradebook = new TreeMap<>();
    }

    public Map<String, ArrayList<Double>> load(String file) {

        path = path + file;

        try (Scanner scan = new Scanner(new File(path), "UTF-8").useDelimiter("[|\n]+")) {

            while(scan.hasNext()) {
                String student = scan.next();
                ArrayList<Double> notas = new ArrayList<>();
                notas.add(Double.valueOf(scan.next()));
                notas.add(Double.valueOf(scan.next()));
                notas.add(Double.valueOf(scan.next()));

                /* System.out.println(student);
                System.out.println(nota1);
                System.out.println(nota2);
                System.out.println(nota3); */

                gradebook.put(student, notas);
            }

        } catch (FileNotFoundException e) {
            System.out.println("An error occurred: " + e.getMessage());
        }

        return gradebook;
    }

    public void addStudent(Student student) {
        gradebook.putIfAbsent(student.getName(), student.getGrades());
    }

    public void removeStudent(String name) {
        if (gradebook.containsKey(name)) {
            gradebook.remove(name);
        } else {
            System.out.println("Couldn't find a student with name " + name);
        }
    }

    public Student getStudent(String name) {
        if (gradebook.containsKey(name)) {;
            return new Student(name, gradebook.get(name));
        } else {
            System.out.println("Couldn't find a student with name " + name);
            return null;
        }
    }

    public Double calculateAverageGrade(String name) {
        Double media = 0d;

        for (Double nota : gradebook.get(name)) {
            media += nota;
        }

        return media / 3;
    }

    public void printAllStudents() {
        for(Map.Entry<String, ArrayList<Double>> entry : gradebook.entrySet()) {
            System.out.printf("Name: %-20s \t Grades: %s\n", entry.getKey(), entry.getValue().toString());
        }
    }

    public ArrayList<Double> allGrades() {
        ArrayList<Double> allGrades = new ArrayList<>();
        
        for (ArrayList<Double> grades : gradebook.values()) {
            allGrades.addAll(grades);
        }
        /* System.out.println(gradebook.values()); */
        /* System.out.println(allGrades); */
        return allGrades;
    }

}