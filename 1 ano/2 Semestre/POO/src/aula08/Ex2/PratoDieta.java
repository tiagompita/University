package aula08.Ex2;

public class PratoDieta extends Prato{

    private double MAX_CALORIAS;

    public PratoDieta(String nome, double MAX_CALORIAS) {
        super(nome);
        this.MAX_CALORIAS = MAX_CALORIAS;
    }

    

    @Override
    public String toString() {
        return super.toString() + " - Dieta (" + MAX_CALORIAS + " Calorias)";
    }

    
    public double getMAX_CALORIAS() {
        return MAX_CALORIAS;
    }

    
}
