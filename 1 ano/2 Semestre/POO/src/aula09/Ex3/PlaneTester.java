package aula09.Ex3;

import java.util.InputMismatchException;
import java.util.Scanner;

public class PlaneTester {
    public static void main(String[] args) {
        PlaneManager frota = new PlaneManager();
        Scanner scan = new Scanner(System.in);
        int option = 0;

        Plane c1 = new CommercialPlane("AAD", "Boeing", "B123", 2000, 200, 900, 7);
        Plane c2 = new CommercialPlane("KGD", "Boeing", "B844", 2010, 500, 900, 12);
        Plane c3 = new CommercialPlane("UDH", "AirBus", "A243", 2000, 350, 1000, 8);
        Plane c4 = new CommercialPlane("WEB", "AirBus", "A642", 2000, 600, 1100, 14);

        Plane m1 = new MilitaryPlane("F24", "Lockheed", "C-130", 1990, 100, 800, 3000);
        Plane m2 = new MilitaryPlane("H754", "ASK", "21", 1998, 3, 700, 200);
        Plane m3 = new MilitaryPlane("K23A", "AW119", "Koala", 2002, 7, 750, 1200);
        Plane m4 = new MilitaryPlane("M234", "Lockheed", "F16", 2003, 1, 2160, 2000);

        frota.addPlane(c1);
        frota.addPlane(c2);
        frota.addPlane(c3);
        frota.addPlane(c4);
        frota.addPlane(m1);
        frota.addPlane(m2);
        frota.addPlane(m3);
        frota.addPlane(m4);


        do {
            try {
                System.out.println("Menu -----------------------------");
                System.out.println("1. Adicionar avião");
                System.out.println("2. Remover avião");
                System.out.println("3. Procurar avião");
                System.out.println("4. Informação dos aviões presentes");
                System.out.println("5. Lista de aviões comerciais ou militares");
                System.out.println("6. Avião mais rápido presente");
                System.out.println("7. Sair");
    
                System.out.print("Opção: ");
                option = scan.nextInt();
                scan.nextLine();
    
                switch (option) {
                    case 1:
                        System.out.println();
                        System.out.println("1. Comercial");
                        System.out.println("2. Militar");
                        System.out.print("Opção: ");
                        int option2 = scan.nextInt();
                        scan.nextLine();
    
                        if (option2 == 1) {
                            System.out.println("Comercial");
                            System.out.println();
                            System.out.print("ID: ");
                            String id = scan.nextLine();
                            System.out.print("Fabricante: ");
                            String fabricante = scan.nextLine();
                            System.out.print("Modelo: ");
                            String modelo = scan.nextLine();
                            System.out.print("Ano do Avião: ");
                            int ano = scan.nextInt();
                            scan.nextLine();
                            System.out.print("Máx. de Passageiros: ");
                            int maxPax = scan.nextInt();
                            scan.nextLine();
                            System.out.print("Vel. Máxima do Avião: ");
                            int maxVel = scan.nextInt();
                            scan.nextLine();
                            System.out.print("Número de Tripolantes: ");
                            int numTrip = scan.nextInt();
                            scan.nextLine();
    
                            Plane Comercial = new CommercialPlane(id, fabricante, modelo, ano, maxPax, maxVel, numTrip);
    
                            frota.addPlane(Comercial);
                        } else {
                            System.out.println("Militar");
                            System.out.println();
                            System.out.print("ID: ");
                            String id = scan.nextLine();
                            System.out.print("Fabricante: ");
                            String fabricante = scan.nextLine();
                            System.out.print("Modelo: ");
                            String modelo = scan.nextLine();
                            System.out.print("Ano do Avião: ");
                            int ano = scan.nextInt();
                            scan.nextLine();
                            System.out.print("Máx. de Passageiros: ");
                            int maxPax = scan.nextInt();
                            scan.nextLine();
                            System.out.print("Vel. Máxima do Avião: ");
                            int maxVel = scan.nextInt();
                            scan.nextLine();
                            System.out.print("Número de Munições: ");
                            int numMun = scan.nextInt();
                            scan.nextLine();
    
                            Plane Militar = new MilitaryPlane(id, fabricante, modelo, ano, maxPax, maxVel, numMun);
    
                            frota.addPlane(Militar);
                        }
    
                        break;
                    case 2:
                        System.out.print("Qual o id do avião a remover? ");
                        String id = scan.nextLine();
                        frota.removePlane(id);
                        break;
                    case 3:
                        System.out.print("Qual o id do avião a procurar? ");
                        String id2 = scan.nextLine();
                        System.out.println(frota.searchPlane(id2));
                        System.out.println();
                        break;
                    case 4:
                        frota.printAllPlanes();
                        break;
    
                    case 5:
                        System.out.println("Lista a imprimir:");
                        System.out.println();
                        System.out.println("1. Comercial");
                        System.out.println("2. Militar");
                        System.out.print("Opção: ");
                        int option3 = scan.nextInt();
                        scan.nextLine();

                        if (option3 == 1) {
                            for (Plane plane : frota.getCommercialPlanes()) {
                                System.out.println(plane);
                            }
                        } else {
                            for (Plane plane : frota.getMilitaryPlanes()) {
                                System.out.println(plane);
                            }
                        }
                        break;
    
                    case 6:
                        System.out.print("Avião mais rápido da frota: " + frota.getFastestPlane());
                        System.out.println();
                        break;
                    case 7:
                        scan.close();
                        System.exit(0);
                        break;
                }
            } catch (InputMismatchException e) {
                System.out.println();
                System.out.println();
                System.out.println("Carater inválido");
                System.out.println();
                System.out.println();
                scan.nextLine();
                continue;
            }
            
        } while (option != 7);
        
    }
}