package galeria;

import java.util.ArrayList;

public class Galeria {
    private float lucro = 0;
    private ArrayList<Obra> galeria;

    public Galeria(int n) {
        this.galeria = new ArrayList<>(n);
    }

    public void newObra(Obra arte) {
        boolean exists = false;

        for(int i = 0; i < galeria.size(); i++) {
            if (galeria.get(i).equals(arte)) {
                exists = true;
            }
        }

        if (exists) {
            System.out.println("Obra recusada! Já existe uma obra com esse nome.");
        } else {
            galeria.add(arte);
        }
    }

    public void list() {
        for(int i = 0; i < galeria.size(); i++) {
            System.out.println(galeria.get(i).toString());
        }
        if (galeria.size() == 0) {
            System.out.println("Galeria Vazia.");
        }
    }

    public void sellObra(int id, float price) {
        for(int i = 0; i < galeria.size(); i++) {
            if(galeria.get(i).getID() == id) {
                this.lucro += price - galeria.get(i).getPrice();
                System.out.println("Obra vendida: " + galeria.get(i).getName() + " por " + price + " Euros");
                if (galeria.get(i) instanceof Escultura) {
                    Escultura escultura = (Escultura) galeria.get(i);
                    int exemplares = escultura.getExemplares();
                    if (exemplares == 1) {
                        galeria.remove(i);
                    } else {
                        escultura.setExemplares(exemplares - 1);
                    }
                    
                } else {
                    galeria.remove(i);
                }
                
            }
        }
    }

    public float getLucro() {
        return lucro;
    }
}
