package aula07.Ex1;

public class Rectangle extends Forma{
    protected double width,height;

    public Rectangle(String cor, double width, double height) {
        super(cor);
        if (width <= 0 || height <= 0) {
            throw new IllegalArgumentException("O comprimento e altura devem ser positivos.");
        }
        this.width = width;
        this.height = height;
    }

    public double[] getSides() {
        return new double[]{width, height};
    }

    public double[] setSides(double width, double height) {

        if (width <= 0 || height <= 0) {
            throw new IllegalArgumentException("O comprimento e altura devem ser positivos.");
        }
        return new double[]{width, height};
    }

    public double area() {
        return width * height;
    }

    public double perimeter() {
        return width * 2 + height * 2;
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
