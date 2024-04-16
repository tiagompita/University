package aula08.Ex1;

public class PesadoMercadorias extends Viatura {

    private int peso;
    private int CargaMax;

    public PesadoMercadorias(String Matricula, String Marca, String Modelo, int Potencia, int peso, int CargaMax) {
        super(Matricula, Marca, Modelo, Potencia);
        if (peso > 0 && CargaMax > 0) {
            this.peso = peso;
            this.CargaMax = CargaMax;
        } else {
            throw new Error("Atributos inválidos");
        }
    }

    @Override
    public String toString() {
        return "PesadoMercadorias => Peso: " + peso + ", Carga Max.:" + CargaMax + super.toString();
    }

    
}
