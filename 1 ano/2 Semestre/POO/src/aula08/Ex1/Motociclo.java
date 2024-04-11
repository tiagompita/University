package aula08.Ex1;

public class Motociclo extends Viatura {

    private String tipo;

    public Motociclo(String Matricula, String Marca, String Modelo, int Potencia, String tipo) {
        super(Matricula, Marca, Modelo, Potencia);
        if (validTipo(tipo)) {
            this.tipo = tipo;
        } else {
            throw new Error("Tipo da mota inválido");
        }
        
    }

    private boolean validTipo(String tipo) {
        if (tipo.equalsIgnoreCase("desportivo") || tipo.equalsIgnoreCase("estrada") || tipo.equalsIgnoreCase("desportiva")) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public String toString() {
        return "Motociclo => Tipo: " + tipo + ", " + super.toString();
    }

}
