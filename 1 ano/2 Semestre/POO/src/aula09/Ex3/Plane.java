package aula09.Ex3;

public abstract class Plane {
    private String ID;
    private String Fabricante;
    private String Modelo;
    private int Ano;
    private int MaxPax;
    private int MaxVel;

    public Plane(String id, String fabricante, String modelo, int ano, int maxPax, int maxVel) {
        ID = id;
        Fabricante = fabricante;
        Modelo = modelo;
        Ano = ano;
        MaxPax = maxPax;
        MaxVel = maxVel;
    }

    public abstract String getPlaneType();

    public String getID() {
        return ID;
    }
    public void setID(String iD) {
        ID = iD;
    }


    public String getFabricante() {
        return Fabricante;
    }
    public String getModelo() {
        return Modelo;
    }
    public int getAno() {
        return Ano;
    }


    public int getMaxPax() {
        return MaxPax;
    }
    public void setMaxPax(int maxPax) {
        MaxPax = maxPax;
    }


    public int getMaxVel() {
        return MaxVel;
    }
    public void setMaxVel(int maxVel) {
        MaxVel = maxVel;
    }

    @Override
    public String toString() {
        return "ID: " + ID + ", Fabricante: " + Fabricante + ", Modelo: " + Modelo + ", Ano: " + Ano + ", MaxPax: " + MaxPax + ", MaxVel: " + MaxVel + "km/h";
    }


    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((ID == null) ? 0 : ID.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Plane other = (Plane) obj;
        if (ID == null) {
            if (other.ID != null)
                return false;
        } else if (!ID.equals(other.ID))
            return false;
        return true;
    }

    
    
}
