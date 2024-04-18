package aula08.Ex2;

public class Legume extends Alimento implements Vegetariano {

    private String nome;

    public Legume(String nome, double proteina, double calorias, double peso) {
        super(proteina, calorias, peso);
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "Legume " + nome + "," + super.toString();
    }
}
