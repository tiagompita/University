public class Pneu {
    private String marca, modelo;
    private int largura, altura, diametro;
    private static int count = 0;

    public Pneu(String fabricante, String modelo) {
        count++;
        marca = fabricante;
        this.modelo = modelo;
    }

    public void setDim(int l, int a, int d) {
        largura = l; altura = a; diametro = d;
    }   

    public static int count() {
        return Pneu.count;
    }

    public static void main(String[] args) {
        Pneu p1 = new Pneu("Mixa", "lein");
        System.out.println(p1.count());
    }
}