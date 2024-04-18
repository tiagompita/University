package aula08.Ex2;

import java.util.HashSet;

public class PratoVegetariano {
    private String nome;
    private HashSet<Alimento> pratoVegan;

    public PratoVegetariano (String nome) {
        this.nome = nome;
        this.pratoVegan = new HashSet<>();
    }
}
