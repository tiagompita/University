package aula06;

import java.time.LocalDate;

import aula05.DateYMD;

public class Aluno extends Pessoa {

    private static int autoNMec = 100;
    private DateYMD inscricao;
    private int nMec;

    public Aluno(String nome, int cc, DateYMD d, DateYMD inscricao) {
        super(nome, cc, d);
        this.nMec = autoNMec;

        if (inscricao == null) {
            inscricao = new DateYMD(LocalDate.now().getDayOfMonth(), LocalDate.now().getMonthValue(), LocalDate.now().getYear());
        }
    }

    public Aluno(String nome, int cc, DateYMD d) {
        super(nome, cc, d);
        this.nMec = autoNMec;
        
        this.inscricao = new DateYMD(LocalDate.now().getDayOfMonth(), LocalDate.now().getMonthValue(), LocalDate.now().getYear());
        
    }

    public int getNMec() {
        return nMec;
    }

    @Override
    public String toString() {
        return "Aluno:" + super.toString() + ", Data de inscrição: " + inscricao + ", nMec:" + nMec;
    }

    
}
