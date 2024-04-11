package aula08.Ex1;

public class Ligeiro extends Viatura {

    private int quadro;
    private int CapacidadeBagageira;
    private static int quadros = 1;

    public Ligeiro(String Matricula, String Marca, String Modelo, int Potencia, int CapacidadeBagageira) {
        super(Matricula, Marca, Modelo, Potencia);
        this.CapacidadeBagageira = CapacidadeBagageira;
        this.quadro = quadros;
        quadros++;
    }

    @Override
    public String toString() {
        return "Automóvel Ligeiro => Nº do Quadro: " + quadro + ", CapacidadeBagageira: " + CapacidadeBagageira + " kg, " + super.toString();
    }
 
    
}
