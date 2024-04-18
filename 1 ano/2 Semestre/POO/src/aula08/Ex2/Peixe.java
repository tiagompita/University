package aula08.Ex2;

public class Peixe extends Alimento {

    private Alimento.TipoPeixe tipo;

    public Peixe(Alimento.TipoPeixe tipo, double proteina, double calorias, double peso) {
        super(proteina, calorias, peso);
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Peixe " + tipo + "," + super.toString();
    }


}
