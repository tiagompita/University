package aula06;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Contactos extends Pessoa{
    private static int IDs = 1000;
    private int id;
    private int tel;
    private String email;

    public Contactos(String nome, int tel, String email) {
        super(nome);
        if (validTel(tel) && validMail(email)) {
            this.tel = tel;
            this.email = email;
        } else {
            throw new Error("Telemóvel ou email inválidos");
        }
        this.id = IDs;
        IDs++;
    }

    

    public void setTel(int tel) {
        this.tel = tel;
    }



    public void setEmail(String email) {
        this.email = email;
    }



    public void setNome(String nome) {
        super.setNome(nome);
    }



    public int getId() {
        return id;
    }



    public int getTel() {
        return tel;
    }



    public String getEmail() {
        return email;
    }

    public String getNome() {
        return super.getNome();
    }



    public boolean validTel(int tel) {
        int length = String.valueOf(tel).length();
        if (length == 9 && String.valueOf(tel).startsWith("9")) {
            return true;
        }
        return false;
    }
    
    public boolean validMail(String email) {
        if (email.contains("@")) {
            if (email.contains(".pt") || email.contains(".com")) {
                return true;
            }
        }
        return false;
        
    }

    
    
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + tel;
        result = prime * result + ((email == null) ? 0 : email.hashCode());
        return result;
    }



    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        Contactos other = (Contactos) obj;
        if (tel != other.tel || (!email.equalsIgnoreCase(other.email)))
            return false;
        return true;
    }



    public static Contactos searchContact(ArrayList<Contactos> contactosList, String search) {
        ArrayList<Contactos> foundContacts = new ArrayList<>();
        for (Contactos c : contactosList) {
            if (c.getNome().equalsIgnoreCase(search) || String.valueOf(c.getTel()).equals(search)) {
                foundContacts.add(c);
            }
        }

        if (foundContacts.size() == 0) {
            System.out.println("Nenhum contacto encontrado.");
            return null;
        } else if (foundContacts.size() == 1) {
            return foundContacts.get(0);
        } else {
            System.out.println("Vários contactos encontrados:");
            for (Contactos c : foundContacts) {
                System.out.println("ID: " + c.getId() + ", Nome: " + c.getNome() + ", Tel: " + c.getTel());
            }

            return null;
        }
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        boolean run = true;

        ArrayList<Contactos> contactosList = new ArrayList<>();

        String search;
        Contactos c;

        while (run) {

            System.out.println("\nMenu:");
            System.out.println("1. Inserir contacto");
            System.out.println("2. Alterar contacto");
            System.out.println("3. Apagar contacto");
            System.out.println("4. Procurar contacto");
            System.out.println("5. Listar contactos");
            System.out.println("0. Sair");

            int option = 0;
            try {
                option = scan.nextInt();
                scan.nextLine();
            } catch (InputMismatchException e) {
                System.out.println("Opção inválida, tente novamente.");
                scan.nextLine(); 
                continue;
            }


            switch (option) {
                case 1:
                    try {

                        System.out.print("Nome: ");
                        String nome = scan.nextLine();

                        System.out.print("Telemóvel: ");
                        int tel = scan.nextInt();
                        scan.nextLine();

                        System.out.print("Email: ");
                        String email = scan.nextLine();

                        Contactos contacto = new Contactos(nome, tel, email);
                        
                        boolean exists = false;
                        for (Contactos cc : contactosList) {
                            if(cc.equals(contacto)) {
                                exists = true;
                                break;
                            }
                        }

                        if (exists) {
                            System.out.println("Contacto já existe. Deseja continuar a inserir como novo contacto? (S/N)");
                            String response = scan.nextLine();
                            if (response.equalsIgnoreCase("N")) {
                                break;
                            }
                        }

                        contactosList.add(contacto);
                        System.out.println("Contacto adicionado com sucesso!");

                    } catch (Error e) {
                        System.out.println("Erro: " + e.getMessage());
                    }

                    break;
                case 2:
                    System.out.println("Insira o nome ou número do contacto que deseja alterar:");
                    search = scan.nextLine();
                    c = searchContact(contactosList, search);
                    if (c != null) {
                        System.out.println("Insira o novo nome:");
                        String novoNome = scan.nextLine();
                        System.out.println("Insira o novo número:");
                        int novoNumero = scan.nextInt();
                        scan.nextLine();  
                        System.out.println("Insira o novo email:");
                        String novoEmail = scan.nextLine(); 

                        // Verificar se o novo email e o novo número de telefone já existem
                        for (Contactos contato : contactosList) {
                            if (contato != c && (contato.getTel() == novoNumero || contato.getEmail().equals(novoEmail))) {
                                System.out.println("O novo número de telefone ou email já existe em outro contato.");
                                return;
                            }
                        }

                        c.setNome(novoNome);
                        c.setTel(novoNumero);
                        c.setEmail(novoEmail);
                        System.out.println("Contacto alterado com sucesso.");
                    } else {
                        System.out.println("Contacto não encontrado.");
                    }
                    break;
                case 3:
                    System.out.println("Insira o nome ou número do contacto que deseja apagar:");
                    search = scan.nextLine();
                    c = searchContact(contactosList, search);
                    if (c != null) {
                        contactosList.remove(c);
                    }
                    break;
                case 4:
                    System.out.println("Insira o nome ou número do contacto que deseja procurar:");
                    search = scan.nextLine();
                    c = searchContact(contactosList, search);
                    if (c != null) {
                        System.out.println("Contacto encontrado: " + c);
                    }
                    break;
                case 5:
                    System.out.println("Listagem de contactos:");
                    for (Contactos contato : contactosList) {
                        System.out.println("ID: " + contato.getId() + ", Nome: " + contato.getNome() + ", Tel: " + contato.getTel() + ", Email: " + contato.getEmail());
                    }
                    break;
            
                case 0:
                    scan.close();
                    run = false;
                    break;
            }

        }
    }
}
