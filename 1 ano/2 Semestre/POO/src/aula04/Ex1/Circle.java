package aula04.Ex1;

import java.util.Scanner;

public class Circle { 
    private double radius;

    public Circle(double radius) {
        if (radius <= 0) {
            throw new IllegalArgumentException("O raio deve ser positivo.");
        }
        this.radius = radius;
    }

    public double getRadius() {
        return radius;
    }

    public double setRadius() {
        Scanner scan = new Scanner(System.in);
        System.out.print("Raio: ");
        radius = scan.nextDouble();
        scan.close();

        if (radius <= 0) {
            throw new IllegalArgumentException("O raio deve ser positivo.");
        }

        return radius;

    }

    public double getArea() {
        return Math.PI * Math.pow(radius, 2);
    }

    public double getCircumference() {
        return 2 * Math.PI * radius;
    }

    @Override
    public String toString() {
        return "Circulo: Raio = " + radius;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Circle) {
            Circle otherCircle = (Circle) obj;
            if (this.radius == otherCircle.radius) {
                return true;
            } else {
                return false; 
            }
        } else {
            return false;
        }
    }
}
