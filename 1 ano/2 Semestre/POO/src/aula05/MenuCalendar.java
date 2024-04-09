package aula05;

import java.util.InputMismatchException;
import java.util.Scanner;

public class MenuCalendar {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        Calendario calendario = null;

        while (true) {
            System.out.println("\nCalendar operations:");
            System.out.println("1 - Create new calendar");
            System.out.println("2 - Print calendar month");
            System.out.println("3 - print calendar");
            System.out.println("0 - Exit\n");
            
            int option = scan.nextInt();

            switch (option) {
                case 1:
                    String seguinte = "";
                    
                    do {
                        try {
                            System.out.print("Day of week (1-domingo e 7-sábado): ");
                            int dweek = scan.nextInt();
                            System.out.print("Year: ");
                            int year = scan.nextInt();

                            calendario = new Calendario(year, dweek);

                            break;
                        } catch (InputMismatchException e) {
                            System.out.println("Introduza um número válido.");
                            scan.next();
                        }
                        System.out.print("Deseja introduzir uma nova data? (S/N)");
                        seguinte = scan.next();

                    
                    } while (seguinte.equalsIgnoreCase("S"));
                    break;
                case 2:
                    if (calendario != null) {
                        System.out.println("Month: ");
                        int month = scan.nextInt();
                        calendario.printMonth(month);
                    } else {
                        System.out.println("Não existe uma data válida.");
                    }
                    break;
                case 3:
                    if (calendario != null) {
                        System.out.println(calendario);
                    } else {
                        System.out.println("Não existe uma data válida.");
                    }
                    break;
                case 0:
                    scan.close();
                    break;
        
            }
        }
    }
}
