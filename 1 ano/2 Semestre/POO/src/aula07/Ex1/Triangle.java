package aula07.Ex1;

public class Triangle extends Forma{
    protected double cat1,cat2,hip;

    public Triangle(String cor , double cat1, double cat2, double hip) {
        super(cor);
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


    public double[] setSides(double cat1, double cat2, double hip) {

        if (cat1 <= 0 || cat1 <= 0 || hip <= 0) {
            throw new IllegalArgumentException("Os lados devem ser positivos.");
        }
        if (cat1 + cat2 <= hip || cat1 + hip <= cat2 || cat2 + hip <= cat1) {
            throw new IllegalArgumentException("Os lados não satisfazem a desigualdade triangular.");
        }

        return new double[] {cat1,cat2,hip};
    }


    public double area() {
        double S = (cat1 + cat2 + hip) / 2;
        double Area = Math.sqrt(S * (S - cat1) * (S - cat2) * (S - hip));
        return Area;
    }


    public double perimeter() {
        return cat1 + cat2 + hip;
    }

    @Override
    public String toString() {
        return "Triângulo: Cateto 1 = " + cat1 + ", Cateto 2 = " + cat2 + ", Hipotenusa = " + hip;
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
