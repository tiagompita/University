package aula08.Ex1;

public class LigeiroEletrico extends Ligeiro implements VeiculoEletrico {

    private int autonomia;

    public LigeiroEletrico(String Matricula, String Marca, String Modelo, int Potencia, int CapacidadeBagageira, int autonomia) {
        super(Matricula, Marca, Modelo, Potencia, CapacidadeBagageira);
        this.autonomia = autonomia;
    }

    @Override
    public int autonomia() {
        return autonomia;
    }

    @Override
    public void carregar(int percentagem) {
        int maxAutonomia = 500; 
        int carga = maxAutonomia * percentagem / 100;
        autonomia += carga;
        if (autonomia > maxAutonomia) {
            autonomia = maxAutonomia;
        }
    }

    @Override
    public String toString() {
        return "Automóvel Ligeiro Eletrico => Autonomia Restante" + autonomia() + super.toString();
    }

}
