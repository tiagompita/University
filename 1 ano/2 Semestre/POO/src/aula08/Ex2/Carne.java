package aula08.Ex2;

public class Carne extends Alimento {

    private Alimento.VariedadeCarne tipo;

    public Carne(Alimento.VariedadeCarne tipo, double proteina, double calorias, double peso) {
        super(proteina, calorias, peso);
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Carne de " + tipo + "," + super.toString();
    }


    
}
