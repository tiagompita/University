package aula08.Ex1;

public class Taxi extends Ligeiro {

    private int numLicenca;

    public Taxi(String Matricula, String Marca, String Modelo, int Potencia, int CapacidadeBagageira, int numLicenca) {
        super(Matricula, Marca, Modelo, Potencia, CapacidadeBagageira);
        this.numLicenca = numLicenca;
    }

    @Override
    public String toString() {
        return "Taxi => Nº de licença: " + numLicenca + ", " + super.toString();
    }

    
}
