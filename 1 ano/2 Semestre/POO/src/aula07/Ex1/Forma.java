package aula07.Ex1;

public abstract class Forma {
    public abstract double area();
    public abstract double perimeter();

    public static final double DOUBLE_PI = 2*Math.PI;
    

    protected String cor;
    public Forma(String cor) {
        this.cor = cor;
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Forma other = (Forma) obj;
        if (cor == null) {
            if (other.cor != null)
                return false;
        } else if (!cor.equalsIgnoreCase(other.cor))
            return false;
        return true;
    }

    
}
