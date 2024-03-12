package aula04.Ex1;

import java.util.Scanner;

public class Triangle implements Triangle {
    private double cat1,cat2,hip;

    public Triangle(double cat1, double cat2, double hip) {
        if (cat1 <= 0 || cat1 <= 0 || hip <= 0) {
            throw new IllegalArgumentException("Os lados devem ser positivos.");
        }
        if (cat1 + cat2 <= hip || cat1 + hip <= cat2 || cat2 + hip <= cat1) {
            throw new IllegalArgumentException("Os lados não satisfazem a desigualdade triangular.");
        }
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

        if (cat1 <= 0 || cat1 <= 0 || hip <= 0) {
            throw new IllegalArgumentException("Os lados devem ser positivos.");
        }
        if (cat1 + cat2 <= hip || cat1 + hip <= cat2 || cat2 + hip <= cat1) {
            throw new IllegalArgumentException("Os lados não satisfazem a desigualdade triangular.");
        }

        return new double[] {cat1,cat2,hip};
    }


    public double getArea() {
        double S = (cat1 + cat2 + hip) / 2;
        double Area = Math.sqrt(S * (S - cat1) * (S - cat2) * (S - hip));
        return Area;
    }


    public double getPerimeter() {
        double Perimeter = cat1 + cat2 + hip;
        return Perimeter;
    }

    @Override
    public String toString() {
        return "Triângulo: Cateto 1 = " + cat1 + ", Cateto 2 = " + cat2 + ", Hipotenusa = " + hip;
    }


    public double[] getAngles() {
        //Hipotenusa
        double A = Math.acos(   ( (hip*hip) - (cat1*cat1) - (cat2*cat2) ) / (-2 * cat1 * cat2)  );

        double B = Math.acos(   ( (cat1*cat1) - (hip*hip)  - (cat2*cat2) ) / (-2 * hip * cat2)  );

        double C = Math.acos(   ( (cat2*cat2) - (cat1*cat1) - (hip*hip) ) / (-2 * cat1 * hip)  );

        return new double[] {A, B, C};

    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Triangle) {
            Triangle otherTriangle = (Triangle) obj;
            if (this.cat1 == otherTriangle.cat1 && this.cat2 == otherTriangle.cat2 && this.hip == otherTriangle.hip) {
                return true;
            } else {
                return false; 
            }
        } else {
            return false;
        }
    }
}
