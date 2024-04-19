package aula08.Ex2;

public class Carne extends Alimento {

    private Ementa.VariedadeCarne tipo;

    public Carne(Ementa.VariedadeCarne tipo, double proteina, double calorias, double peso) {
        super(proteina, calorias, peso);
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Carne de " + tipo + "," + super.toString();
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((tipo == null) ? 0 : tipo.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Carne other = (Carne) obj;
        if (tipo != other.tipo)
            return false;
        return true;
    }

    
}
