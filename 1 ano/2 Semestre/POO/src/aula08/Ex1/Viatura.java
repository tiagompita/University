package aula08.Ex1;

public abstract class Viatura implements KmPercorridosInterface {
    private String Matricula;
    private String Marca;
    private String Modelo;
    private int Potencia;

    private int quilometros;
    private int TotalQuilometros = 0;

    public Viatura(String Matricula, String Marca, String Modelo, int Potencia) {
        if(validMatricula(Matricula) && validPotencia(Potencia)) {
            this.Matricula = Matricula;
            this.Marca = Marca;
            this.Modelo = Modelo;
            this.Potencia = Potencia;
        } else {
            throw new Error("Dados inválidos");
        }
    }

    private boolean validMatricula(String Matricula) {
        if(!Matricula.matches("\\w")) {
            return false;
        }
        return true;
    }

    private boolean validPotencia(int Potencia) {
        if (Potencia < 0) {
            return false;
        }
        return true;
    }

    

    public String getMatricula() {
        return Matricula;
    }

    public String getMarca() {
        return Marca;
    }

    public String getModelo() {
        return Modelo;
    }

    public int getPotencia() {
        return Potencia;
    }

    public void setPotencia(int potencia) {
        Potencia = potencia;
    }

    public void trajeto(int quilometros) {
        this.quilometros = quilometros;
        this.TotalQuilometros += quilometros;
    }

    public int ultimoTrajeto() {
        return this.quilometros;
    }

    public int distanciaTotal() {
        return this.TotalQuilometros;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((Matricula == null) ? 0 : Matricula.hashCode());
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
        Viatura other = (Viatura) obj;
        if (Matricula == null) {
            if (other.Matricula != null)
                return false;
        } else if (!Matricula.equals(other.Matricula))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Matricula: " + Matricula + ", Marca: " + Marca + ", Modelo: " + Modelo + ", Potencia: " + Potencia
                + ", Total de Quilometros: " + TotalQuilometros + "]";
    }

    

}
