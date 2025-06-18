package aula08.Ex2;

public class PratoVegetariano extends Prato implements Vegetariano {

    public PratoVegetariano (String nome) {
        super(nome);
    }

    @Override
    public String toString() {
        return super.toString() + " - Prato Vegetariano";
    }
    
}
