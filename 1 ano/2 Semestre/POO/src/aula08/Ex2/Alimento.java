package aula08.Ex2;

public abstract class Alimento {

    private double proteina;
    private double calorias;
    private double peso;

    public enum VariedadeCarne {
        VACA, PORCO, PERU, FRANGO, OUTRA;
    }

    public enum TipoPeixe {
        CONGELADO, FRESCO;
    }

    public Alimento(double proteina, double calorias, double peso) {
        this.proteina = proteina;
        this.calorias = calorias;
        this.peso = peso;
    }

    @Override
    public String toString() {
        return " Proteina: " + proteina + "g, calorias: " + calorias + "kcal, peso: " + peso + "g";
    }

}
