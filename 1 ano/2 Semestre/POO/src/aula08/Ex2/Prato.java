package aula08.Ex2;

import java.util.HashSet;

public abstract class Prato {
    private String nome;
    private HashSet<Alimento> prato;

    public Prato(String nome) {
        this.nome = nome;
        this.prato = new HashSet<>();
    }
}
