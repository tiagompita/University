package galeria;

public class Quadro extends Obra{
    private String tinta;
    private boolean emoldurado;
    private String tamanho;

    public Quadro(String name, String autor, float price, String tinta, boolean emoldurado, String tamanho) {
        super(name, autor, price);
        this.tinta = tinta;
        this.emoldurado = emoldurado;
        this.tamanho = tamanho;
    }

    

    public String getTinta() {
        return tinta;
    }

    public void setTinta(String tinta) {
        this.tinta = tinta;
    }



    public boolean isEmoldurado() {
        return emoldurado;
    }

    public void setEmoldurado(boolean emoldurado) {
        this.emoldurado = emoldurado;
    }



    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }



    @Override
    public String toString() {
        return "Quadro : "+ super.toString() +", Tinta = " + tinta + ", Emoldurado = " + emoldurado + ", Tamanho = " + tamanho;
    }

    
}
