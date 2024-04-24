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

    public Pessoa(String nome) {
            this.nome = nome;  
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
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

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        result = prime * result + cc;
        result = prime * result + ((dataNasc == null) ? 0 : dataNasc.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Pessoa other = (Pessoa) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        if (cc != other.cc)
            return false;
        if (dataNasc == null) {
            if (other.dataNasc != null)
                return false;
        } else if (!dataNasc.equals(other.dataNasc))
            return false;
        return true;
    }

    
    
}
