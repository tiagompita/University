package aula08.Ex2;

import java.util.HashSet;

public class PratoDieta {
    private String nome;
    private HashSet<Alimento> pratoDieta;

    public PratoDieta(String nome) {
        this.nome = nome;
        this.pratoDieta = new HashSet<>();
    }
}
