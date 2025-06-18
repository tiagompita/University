package aula08.Ex2;

public class Peixe extends Alimento {

    private Ementa.TipoPeixe tipo;

    public Peixe(Ementa.TipoPeixe tipo, double proteina, double calorias, double peso) {
        super(proteina, calorias, peso);
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Peixe " + tipo + "," + super.toString();
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
        Peixe other = (Peixe) obj;
        if (tipo != other.tipo)
            return false;
        return true;
    }

    
}
