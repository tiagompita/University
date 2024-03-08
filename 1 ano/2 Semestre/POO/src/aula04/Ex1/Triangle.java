package aula04.Ex1;

import java.util.Scanner;

public class Triangle {
    private double cat1,cat2,hip;

    public Triangle(double cat1, double cat2, double hip) {
        this.cat1 = cat1;
        this.cat2 = cat2;
        this.hip = hip;
    }

    public double[] getSides(){
        return new double[] {cat1,cat2,hip};
    }

    public double[] setSides() {
        Scanner scan = new Scanner(System.in);

        System.out.print("Comprimento do 1º Cateto: ");
        cat1 = scan.nextDouble();

        System.out.print("Comprimento do 2º Cateto: ");
        cat2 = scan.nextDouble();

        System.out.print("Comprimento da hipotenusa: ");
        hip = scan.nextDouble();

        scan.close();
        return new double[] {cat1,cat2,hip};
    }

    public double getArea() {
        double area = (cat1 * cat2) / 2;
        return area;
    }

    public double getPerimeter() {
        double perimeter = cat1 + cat2 + hip;
        return perimeter;
    }

    @Override
    public String toString() {
        return "Triângulo: Cateto 1= " + cat1 + " Cateto 2= " + cat2 + " Hipotenusa= " + hip;
    }

    public double[] getAngles() {
        //Hipotenusa
        double A = Math.acos(   ( (hip*hip) - (cat1*cat1) - (cat2*cat2) ) / (-2 * cat1 * cat2)  );

        double B = Math.acos(   ( (cat1*cat1) - (hip*hip)  - (cat2*cat2) ) / (-2 * hip * cat2)  );

        double C = Math.acos(   ( (cat2*cat2) - (cat1*cat1) - (hip*hip) ) / (-2 * cat1 * hip)  );

        return new double[] {A, B, C};

    }
}
