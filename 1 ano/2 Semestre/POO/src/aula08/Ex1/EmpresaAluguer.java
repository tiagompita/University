package aula08.Ex1;

import java.util.ArrayList;

public class EmpresaAluguer {

    private ArrayList<Viatura> Empresa;
    private String Nome;
    private String CP;
    private String mail;

    public EmpresaAluguer(String Nome, String CP, String mail) {
        if (CP.length() == 8 && mail.contains("@")) {
            this.Nome = Nome;
            this.CP = CP;
            this.mail = mail;
            this.Empresa = new ArrayList<>();
        } else {
            throw new Error("Atributo(s) inválido(s)");
        }
    }

    @Override
    public String toString() {
        return "Empresa de Aluguer => Nome: " + Nome + ", CP: " + CP + ", Email: " + mail;
    }

    public static void main(String[] args) {
        
        EmpresaAluguer empresa = new EmpresaAluguer("CarRent", "1234-567", "carrent@rent.com");
        Motociclo mota = new Motociclo("AB01BC", "Honda", "CB500", 40, "naked");
        Taxi taxi = new Taxi("BB11DD", "Mercedes", "Benz", 90, 200, 143242);
        Ligeiro carro = new Ligeiro("GB10DA", "Toyota", "Yaris", 54, 240);
        PesadoMercadorias camiao = new PesadoMercadorias("BF23DC", "Volvo", "Hulk", 550, 3500, 5000);
        PesadoPassageiros autocarro = new PesadoPassageiros("AD23BC", "Volvo", "Carry", 430, 3000, 70);

    }
}
