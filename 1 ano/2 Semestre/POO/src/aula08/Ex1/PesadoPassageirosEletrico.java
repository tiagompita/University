package aula08.Ex1;

public class PesadoPassageirosEletrico extends PesadoPassageiros implements VeiculoEletrico {

    private int autonomia;

    public PesadoPassageirosEletrico(String Matricula, String Marca, String Modelo, int Potencia, int peso, int MaxPax, int autonomia) {
        super(Matricula, Marca, Modelo, Potencia, peso, MaxPax);
        // Aqui você deve definir o valor de autonomia para este objeto, por exemplo:
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
        return "Pesado Passageiros Eletrico => Peso: " + super.toString();
    }
 
}