package aula04.Ex1;

import java.util.Scanner;

public class Rectangle {
    double width,height;

    public Rectangle(double width, double height) {
        this.width = width;
        this.height = height;
    }

    public double[] getSides() {
        return new double[]{width, height};
    }

    public double[] setSides() {
        Scanner scan = new Scanner(System.in);
        System.out.print("Comprimento: ");
        width = scan.nextDouble();
        System.out.print("Altura: ");
        height = scan.nextDouble();

        scan.close();
        return new double[]{width, height};
    }
}
