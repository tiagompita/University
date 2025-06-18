package aula08.Ex2;

import java.util.ArrayList;

public class Ementa {

    private String nome;
    private String local;
    private ArrayList<Prato> Ementa;

    public Ementa(String nome, String local) {
        this.nome = nome;
        this.local = local;
        this.Ementa = new ArrayList<>();
    }

    public ArrayList<Prato> addPrato(Prato prato, DiaSemana Dia) {
        Ementa.add(prato);
        return Ementa;
    }

    public enum DiaSemana {
        SEGUNDA, TERÇA, QUARTA, QUINTA, SEXTA, SABADO, DOMINGO;
    }

    public enum VariedadeCarne {
        VACA, PORCO, PERU, FRANGO, OUTRA;
    }

    public enum TipoPeixe {
        CONGELADO, FRESCO;
    }

    @Override
    public String toString() {
        StringBuilder string = new StringBuilder();


        for (int i = 0; i < Ementa.size(); i++) {
            string.append(Ementa.get(i));
            string.append(" , ");
            string.append("dia " + DiaSemana.values()[i]);
            string.append("\n");
        }

        return string.toString();
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        result = prime * result + ((local == null) ? 0 : local.hashCode());
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
        Ementa other = (Ementa) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        if (local == null) {
            if (other.local != null)
                return false;
        } else if (!local.equals(other.local))
            return false;
        return true;
    }

    

}
