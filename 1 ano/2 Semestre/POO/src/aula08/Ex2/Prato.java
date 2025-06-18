package aula08.Ex2;

import java.util.ArrayList;

public class Prato implements Comparable<Prato> {
    private String nome;
    private ArrayList<Alimento> prato;

    public Prato(String nome) {
        this.nome = nome;
        this.prato = new ArrayList<>();
    }

    public boolean addIngrediente(Alimento ingrediente) {
        if (this instanceof Vegetariano && !(ingrediente instanceof Vegetariano)) {
            return false;
        }
        if(this instanceof PratoDieta && (totalCalorias() + ingrediente.getCalorias() > ((PratoDieta) this).getMAX_CALORIAS())) {
            return false;
        }
        prato.add(ingrediente);
        return true;
    }

    public String getNome() {
        return nome;
    }

    public ArrayList<Alimento> getIngredientes() {
        return prato;
    }

    public int totalIngrediente() {
        return prato.size();
    }

    public double totalCalorias() {
        double total = 0;
        for (Alimento alimento : prato) {
            total += alimento.getCalorias(); 
        }
        return total;
    }

    @Override
    public int compareTo(Prato other) {
        return Double.compare(this.totalCalorias(), other.totalCalorias());
    }



    @Override
    public String toString() {
        return "Prato " + nome + ", composto por " + totalIngrediente() + " Ingredientes" ;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
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
        Prato other = (Prato) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        return true;
    }

    
}
