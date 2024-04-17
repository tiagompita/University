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

    

    public String getNome() {
        return Nome;
    }

    public void setNome(String nome) {
        this.Nome = nome;
    }

    public String getCP() {
        return CP;
    }

    public void setCP(String cP) {
        this.CP = cP;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void add(Viatura viatura) {
        boolean exists = false;

        for (int i = 0; i <= Empresa.size(); i++ ) {
            if (Empresa.get(i).equals(viatura)) {
                exists = true;
            }
        }

        if (exists) {
            System.out.println("Veículo já existe!");
        } else {
            Empresa.add(viatura);
        }

    }

    @Override
    public String toString() {
        return "Empresa de Aluguer => Nome: " + Nome + ", CP: " + CP + ", Email: " + mail;
    }
    
    public static void main(String[] args) {
        // Error: LinkageError occurred while loading main class aula08.Ex1.EmpresaAluguer
        //java.lang.UnsupportedClassVersionError: aula08/Ex1/EmpresaAluguer has been compiled by a more recent version of the Java Runtime (class file version 66.65535), this version of the Java Runtime only recognizes class file versions up to 61.0
    }

}
