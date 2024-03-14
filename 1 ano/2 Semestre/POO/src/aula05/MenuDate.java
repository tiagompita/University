package aula05;

import java.util.Scanner;

public class MenuDate {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        while (true) {
            System.out.println("\n1 - Create new date");
            System.out.println("2 - Show current date");
            System.out.println("3 - Incremente Date (by 1)");
            System.out.println("4 - Decrement date (by 1)");
            System.out.println("0 - Exit\n");
            
            int option = scan.nextInt();
            DateYMD data = null;

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
                        } catch (Error e) {
                            System.out.println("Erro: " + e.getMessage());
                            System.out.print("Deseja introduzir uma nova data? (S/N)");
                            seguinte = scan.next();
                        }

                    
                    } while (seguinte.equalsIgnoreCase("S"));
                    break;
                case 2:
                    System.out.println(data);
                    break;
                case 3:
                    break;
                case 4:
                    break;
                case 0:
                    scan.close();
                    break;
        
            }
        }

    }
}
