package aula06;

import aula05.DateYMD;

public class Professor extends Pessoa {
    
    private String categoria;
    private String departamento;

    public Professor(String nome, int cc, DateYMD dataNasc, String categoria, String departamento) {
        super(nome, cc, dataNasc);
        if (validCategory(categoria)) {
            this.categoria = categoria;
        } else {
            throw new Error("Categoria inválida.");
        }
        this.departamento = departamento;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public boolean validCategory(String categoria) {
        String[] categorias = {"Auxiliar", "Associado", "Catedrático"};
        
        for (String cat : categorias) {
            if (categoria.equals(cat)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public String toString() {
        return "Professor:" + super.toString() + ", Categoria: " + categoria + ", Departamento:" + departamento;
    }

    
}