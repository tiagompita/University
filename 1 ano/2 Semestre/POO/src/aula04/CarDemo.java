package aula04;

import java.util.Scanner;
import java.util.Arrays;

class Car {
    public String make;
    public String model;
    public int year;
    public int kms;

    public Car(String make, String model, int year, int kms) {
        this.make = make;
        this.model = model;
        this.year = year;
        this.kms = kms;
    }

    public void drive(int distance) {
        kms += distance;
    }

}

public class CarDemo {

    static Scanner sc = new Scanner(System.in);

    static int registerCars(Car[] cars) {
        // pede dados dos carros ao utilizador e acrescenta ao vetor
        // registo de carros termina quando o utilizador inserir uma linha vazia 
        // devolve número de carros registados

        for (int i=0; i < 10; i++) {
            System.out.print("Insira dados do carro (marca modelo ano quilómetros): ");
            while (true) {
                String input = sc.nextLine();
                if (input.isEmpty()) {
                    return i;
                }
                String[] car = input.split(" ");
                if (car.length < 4) {
                    System.out.println("Dados inválidos. Tente novamente.");
                    i--;
                    break;
                }
                String make = car[0];
                String model = String.join(" ", Arrays.copyOfRange(car, 1, car.length - 2));
                int year = Integer.parseInt(car[car.length-2]); 
                int kms = Integer.parseInt(car[car.length-1]);

                if (verify(make, model, year, kms)) {
                    cars[i] = new Car(make, model, year, kms);
                    break;
                } else {
                    System.out.println("Dados inválidos. Tente novamente.");
                    i--;
                    break;
                }
            }
        }
        return 10;
    }

    static boolean verify(String make, String model, int year, int kms) {
        String[] marca = make.split(" ");

        if (marca.length != 1 || model.length() <= 0 || year <= 0 || year < 1000 || kms < 0) {
            return false;
        }
        return true;
    }

    static void registerTrips(Car[] cars, int numCars) {
        // pede dados das viagens ao utilizador e atualiza informação do carro
        // registo de viagens termina quando o utilizador inserir uma linha vazia 
        while (true) {
            System.out.print("Registe uma viagem no formato \"carro:distância\": ");
            String input = sc.nextLine();
            if (input.isEmpty()) {
                break;
            }

            int carro = Integer.parseInt(input.split(":")[0]);
            if (carro > numCars - 1) {
                System.out.println("Carro inválido");
                continue;
            }
            int distance = Integer.parseInt(input.split(":")[1]);
            if (distance < 0) {
                continue;
            }

            cars[carro].drive(distance);
        }
    }


    static void listCars(Car[] cars) {
        System.out.println("\nCarros registados: ");
        // lista todos os carros registados
        // Exemplo de resultado
        // Carros registados: 
        // Toyota Camry, 2010, kms: 234346
        // Renault Megane Sport Tourer, 2015, kms: 32536
        for (Car car : cars) {
            if (car != null) {
                System.out.printf("%s, %s, %d, kms: %d\n", car.make, car.model, car.year, car.kms);
            }
        }
        System.out.println("\n");
    }

    public static void main(String[] args) {

        Car[] cars = new Car[10];

        int numCars = registerCars(cars);

        if (numCars>0) {
            listCars(cars);
            registerTrips(cars, numCars);
            listCars(cars);
        }

        sc.close();

    }
}