package aula08.Ex1;

public class Ligeiro extends Viatura {

    private int CapacidadeBagageira;

    public Ligeiro(String Matricula, String Marca, String Modelo, int Potencia, int CapacidadeBagageira) {
        super(Matricula, Marca, Modelo, Potencia);
        this.CapacidadeBagageira = CapacidadeBagageira;
    }

    @Override
    public String toString() {
        return "Automóvel Ligeiro => Capacidade da Bagageira: " + CapacidadeBagageira + " kg, " + super.toString();
    }
 
    
}
