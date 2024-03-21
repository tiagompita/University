package aula06;

import aula05.DateYMD;

public class Bolseiro extends Aluno {

    private int bolsa;
    private Professor prof;

    public Bolseiro(String name, int cc, DateYMD date, Professor prof, int bolsa) {
        super(name, cc, date);
        this.prof = prof;
        this.bolsa = bolsa;
    }

    public int getBolsa() {
        return bolsa;
    }

    public void setBolsa(int bolsa) {
        this.bolsa = bolsa;
    }

    public Professor getProf() {
        return prof;
    }

    public void setProf(Professor prof) {
        this.prof = prof;
    }

    @Override
    public String toString() {
        return "Bolseiro: " + super.toString()+ ", Orientador: " + prof + ", Bolsa Mensal: " + bolsa;
    }

    
}
