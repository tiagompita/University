package aula09.Ex3;

public class MilitaryPlane extends Plane {
    private int NumMunicoes;

    public MilitaryPlane(String id, String fabricante, String modelo, int ano, int maxPax, int maxVel, int numMunicoes) {
        super(id, fabricante, modelo, ano, maxPax, maxVel);
        NumMunicoes = numMunicoes;
    }

    public int getNumMunicoes() {
        return NumMunicoes;
    }

    public void setNumMunicoes(int numMunicoes) {
        NumMunicoes = numMunicoes;
    }

    public String getPlaneType() {
        return "Militar";
    }

    @Override
    public String toString() {
        return "Avião Militar " + super.toString() + " Número de Munições: " + NumMunicoes;
    }
}
