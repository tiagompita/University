package aula07.Ex1;

public class Circle extends Forma { 
    protected double radius;

    public Circle(String cor ,double radius) {
        super(cor);
        if (radius <= 0) {
            throw new IllegalArgumentException("O raio deve ser positivo.");
        }
        this.radius = radius;
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        
        if (radius <= 0) {
            throw new IllegalArgumentException("O raio deve ser positivo.");
        }
        this.radius = radius;
    }

    public double area() {
        return Math.PI * Math.pow(radius, 2);
    }

    public double perimeter() {
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
