package aula08.Ex1;

public class PesadoPassageirosEletrico extends Viatura {

    private int peso;
    private int MaxPax;

    public PesadoPassageirosEletrico(String Matricula, String Marca, String Modelo, int Potencia, int autonomia,int peso, int MaxPax) {
        super(Matricula, Marca, Modelo, Potencia, autonomia);
        if(peso > 0 && MaxPax > 0) {
            this.peso = peso;
            this.MaxPax = MaxPax;
        } else {
            throw new Error("Atributos inválidos.");
        }
    }

    @Override
    public String toString() {
        return "PesadoPassageiros => Peso: " + peso + ", Capacidade de Passageiros: " + MaxPax + super.toString();
    }

    

}
