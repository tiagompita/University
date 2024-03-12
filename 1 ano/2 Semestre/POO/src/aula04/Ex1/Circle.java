package aula04.Ex1;

import java.util.Scanner;

public class Circle { 
    private double radius;

    public Circle(double radius) {
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

        return radius;

    }

    public double getArea() {
        return Math.PI * Math.pow(radius, 2);
    }

    public double getCircumference() {
        return 2 * Math.PI * radius;
    }
}
