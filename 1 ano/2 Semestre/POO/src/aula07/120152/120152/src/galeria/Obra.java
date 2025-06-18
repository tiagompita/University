package galeria;

public class Obra {
    private static int IDs = 33;
    private int id;
    private String name;
    private String autor;
    private float price;

    public Obra(String name, String autor, float price) {
        this.name = name;
        this.autor = autor;
        this.price = price;
        this.id = IDs;
        IDs++;
    }

    public int getID() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }



    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        Obra other = (Obra) obj;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equalsIgnoreCase(other.name))
            return false;
        return true;
    }



    @Override
    public String toString() {
        return "Obra : ID = " + id + ", Nome = " + name + ", Autor = " + autor + ", Preço = " + price + "Eur";
    }

    
}
