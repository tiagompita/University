package aula08.Ex2;

public class Cereal extends Alimento implements Vegetariano {

    private String nome;

    public Cereal(String nome, double proteina, double calorias, double peso) {
        super(proteina, calorias, peso);
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "Cereal " + nome + "," + super.toString();
    }
}
