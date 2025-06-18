package galeria;

public class Escultura extends Obra{
    private String material;
    private int exemplares;

    public Escultura(String name, String autor, float price, String material, int exemplares) {
        super(name, autor, price);
        this.material = material;
        this.exemplares = exemplares;
    }


    
    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }



    public int getExemplares() {
        return exemplares;
    }

    public void setExemplares(int exemplares) {
        this.exemplares = exemplares;
    }



    @Override
    public String toString() {
        return "Escultura : "+ super.toString() +", Material = " + material + ", Exemplares = " + exemplares;
    }
}
