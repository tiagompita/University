package aula09.Ex3;

public class CommercialPlane extends Plane {
    private int NumTripolantes;

    public CommercialPlane(String id, String fabricante, String modelo, int ano, int maxPax, int maxVel, int numTripolantes) {
        super(id, fabricante, modelo, ano, maxPax, maxVel);
        NumTripolantes = numTripolantes;
    }

    public int getNumTripolantes() {
        return NumTripolantes;
    }

    public void setNumTripolantes(int numTripolantes) {
        NumTripolantes = numTripolantes;
    }

    public String getPlaneType() {
        return "Comercial";
    }

    @Override
    public String toString() {
        return "Avião Comercial " + super.toString() + " Número de Tripolantes: " + NumTripolantes ;
    }

    

}
