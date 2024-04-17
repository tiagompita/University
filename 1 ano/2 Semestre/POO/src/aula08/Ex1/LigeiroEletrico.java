package aula08.Ex1;

public class LigeiroEletrico extends Viatura {

    private int CapacidadeBagageira;

    public LigeiroEletrico(String Matricula, String Marca, String Modelo, int Potencia, int autonomia,int CapacidadeBagageira) {
        super(Matricula, Marca, Modelo, Potencia, autonomia);
        this.CapacidadeBagageira = CapacidadeBagageira;
    }

    @Override
    public String toString() {
        return "Automóvel Ligeiro => Capacidade da Bagageira: " + CapacidadeBagageira + " kg, Autonomia Restante" + autonomia() + super.toString();
    }

}
