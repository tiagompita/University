package aula06;
import aula05.DateYMD;

public class Pessoa {
    private String nome;
    private int cc;
    private DateYMD dataNasc;

    public Pessoa(String nome, int cc, DateYMD dataNasc) {
        if (validCC(cc)) {
            this.nome = nome;
            this.cc = cc;
            this.dataNasc = dataNasc;
        } else {
            throw new Error("Atributos inválidos");
        }
    }

    public String getNome() {
        return nome;
    }

    public int getCC() {
        return cc;
    }

    public DateYMD getDataNasc() {
        return dataNasc;
    }

    public boolean validCC(int cc) {
        int length = String.valueOf(cc).length();
        if (length != 7) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public String toString() {
        return "Nome: " + nome + ", cc: " + cc + ", dataNasc: " + dataNasc;
    }

    
}
