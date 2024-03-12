package aula04.Ex1;

import java.util.Scanner;

public class Rectangle {
    double width,height;

    public Rectangle(double width, double height) {
        if (width <= 0 || height <= 0) {
            throw new IllegalArgumentException("O comprimento e altura devem ser positivos.");
        }
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

        if (width <= 0 || height <= 0) {
            throw new IllegalArgumentException("O comprimento e altura devem ser positivos.");
        }
        return new double[]{width, height};
    }

    public double getArea() {
        double Area = width * height;
        return Area;
    }

    public double getPerimeter() {
        double Perimeter = width * 2 + height * 2;
        return Perimeter;
    }

    @Override
    public String toString() {
        return "Retângulo: Comprimento = " + width + ", Altura = " + height;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Rectangle) {
            Rectangle otherRectangle = (Rectangle) obj;
            if (this.width == otherRectangle.width && this.height == otherRectangle.height) {
                return true;
            } else {
                return false; 
            }
        } else {
            return false;
        }
    }
}
