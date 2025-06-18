package aula07.Ex2;

import java.util.InputMismatchException;
import java.util.Scanner;

public class MenuDate {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        DateYMD data = null; // Declare data here
        boolean run = true;

        while (run) {
            System.out.println("\nDate operations:");
            System.out.println("1 - Create new date");
            System.out.println("2 - Show current date");
            System.out.println("3 - Incremente Date (by 1)");
            System.out.println("4 - Decrement date (by 1)");
            System.out.println("0 - Exit\n");
            
            int option = scan.nextInt();

            switch (option) {
                case 1:
                    String seguinte = "";
                    
                    do {
                        try {
                            System.out.print("Day: ");
                            int day = scan.nextInt();
                            System.out.print("Month: ");
                            int month = scan.nextInt();
                            System.out.print("Year: ");
                            int year = scan.nextInt();

                            data = new DateYMD(day, month, year);

                            break;
                        } catch (InputMismatchException e) {
                            System.out.println("Introduza um número válido.");
                            scan.next();
                        } catch (Error e) {
                            System.out.println("Erro: " + e.getMessage());
                
                        }
                        System.out.print("Deseja introduzir uma nova data? (S/N)");
                        seguinte = scan.next();

                    
                    } while (seguinte.equalsIgnoreCase("S"));

                    
                    break;
                case 2:
                    if (data != null) {
                        System.out.println(data);
                    } else {
                        System.out.println("Não existe uma data válida.");
                    }
                    break;
                case 3:
                    if (data != null) {
                        data.increment();
                    } else {
                        System.out.println("Não existe uma data válida.");
                    }
                    break;
                case 4:
                    if (data != null) {
                        data.decrement();
                    } else {
                        System.out.println("Não existe uma data válida.");
                    }
                    break;
                case 0:
                    scan.close();
                    run = false;
                    break;
        
            }
        }
    }
}