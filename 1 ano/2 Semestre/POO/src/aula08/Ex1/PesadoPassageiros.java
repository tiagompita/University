package aula08.Ex1;

public class PesadoPassageiros extends Viatura {

    private int peso;
    private int MaxPax;

    public PesadoPassageiros(String Matricula, String Marca, String Modelo, int Potencia, int peso, int MaxPax) {
        super(Matricula, Marca, Modelo, Potencia);
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
