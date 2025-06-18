package galeria;

import java.util.InputMismatchException;
import java.util.Scanner;

public class MainGaleria {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        Galeria galeria = new Galeria(100);
        int opcao = 0;
        do {
            try {
                System.out.println("\nMenu:");
                System.out.println("1. Adicionar uma obra");
                System.out.println("2. Listar obras");
                System.out.println("3. Vender uma obra");
                System.out.println("4. Calcular o lucro total");
                System.out.println("5. Sair");
                System.out.print("Opçao: ");
                opcao = sc.nextInt();
                sc.nextLine();
                switch (opcao) {
                    case 1:
                        System.out.println("\n1. Adicionar uma obra do tipo");
                        System.out.println("1. Quadro");
                        System.out.println("2. Escultura");
                        System.out.println("3. Obra Digital (NFT)");
                        System.out.print("Tipo de produto: ");
                        int opcaoProduto = sc.nextInt();
                        sc.nextLine();
                        switch (opcaoProduto) {
                            case 1:
                                try {
                                    System.out.print("Nome do Quadro: ");
                                    String name = sc.nextLine();
                                    System.out.print("Autor do Quadro: ");
                                    String autor = sc.nextLine();
                                    System.out.print("Preço do Quadro: ");
                                    float price = sc.nextFloat();
                                    sc.nextLine();


                                    System.out.print("Tinta usada no Quadro (oleo,gauche,aguarela): ");
                                    String tinta = sc.nextLine();
                                    if (!tinta.equalsIgnoreCase("oleo") && !tinta.equalsIgnoreCase("gauche") && !tinta.equalsIgnoreCase("aguarela")) {
                                        throw new Error("Tinta inválida");
                                    }


                                    System.out.print("Está Emoldurado? (S/N): ");
                                    String moldura = sc.nextLine();
                                    Boolean emoldurado;
                                    if(moldura.equalsIgnoreCase("S")) {
                                        emoldurado = true;
                                    } else {
                                        emoldurado = false;
                                    }


                                    System.out.print("Tamanho do Quadro (S, M, L, XL): ");
                                    String tamanho = sc.nextLine();
                                    if (!tamanho.equalsIgnoreCase("S") && !tamanho.equalsIgnoreCase("M") && !tamanho.equalsIgnoreCase("L") && !tamanho.equalsIgnoreCase("XL")) {
                                        throw new Error("Tamanho inválido");
                                    }

                                    Quadro quadro = new Quadro(name, autor, price, tinta, emoldurado, tamanho);
                                    galeria.newObra(quadro);
                                    } catch (Error e) {
                                        System.out.println("Erro: " + e.getMessage());
                                        continue;
                                    }
                                break;
                            case 2:
                                try {
                                    System.out.print("Nome da Escultura: ");
                                    String name = sc.nextLine();
                                    System.out.print("Autor da Escultura: ");
                                    String autor = sc.nextLine();
                                    System.out.print("Preço da Escultura: ");
                                    float price = sc.nextFloat();
                                    sc.nextLine();


                                    System.out.print("Material da Escultura (madeira, ceramica, metal): ");
                                    String material = sc.nextLine();
                                    if (!material.equalsIgnoreCase("madeira") && !material.equalsIgnoreCase("ceramica") && !material.equalsIgnoreCase("metal")) {
                                        throw new Error("Material inválido");
                                    }


                                    System.out.print("Quantos exemplares foram produzidos: ");
                                    int exemplares = sc.nextInt();
                                    sc.nextLine();

                                    Escultura escultura = new Escultura(name, autor, price, material, exemplares);
                                    galeria.newObra(escultura);
                                    } catch (Error e) {
                                        System.out.println("Erro: " + e.getMessage());
                                        continue;
                                    }
                                break;
                            case 3:
                                try {
                                    System.out.print("Nome do NFT: ");
                                    String name = sc.nextLine();
                                    System.out.print("Autor do NFT: ");
                                    String autor = sc.nextLine();
                                    System.out.print("Preço do NFT: ");
                                    float price = sc.nextFloat();
                                    sc.nextLine();


                                    System.out.print("Nome da Blockchain (Ethererum, Polygon, Solana, etc): ");
                                    String blockchain = sc.nextLine();


                                    System.out.println("Endereço do contrato");
                                    System.out.println("Exemplo : 0x1234AF");
                                    String address = sc.nextLine();


                                    ObraDigital obradigital = new ObraDigital(name, autor, price, blockchain, address);
                                    galeria.newObra(obradigital);
                                    } catch (Error e) {
                                        System.out.println("Erro: " + e.getMessage());
                                        continue;
                                    }
                                break;
                        }
                        break;
                    case 2:
                        // Listar as obras
                        galeria.list();
                        break;
                    case 3:
                        // Vender uma obra
                        System.out.print("Identificador da Obra: ");
                        int id = sc.nextInt();
                        sc.nextLine();
                        System.out.print("Preço de venda: ");
                        float price = sc.nextFloat();
                        sc.nextLine();

                        galeria.sellObra(id, price);

                        break;
                    case 4:
                        // Apresentar o lucro total
                        System.out.println("Lucro total: " + galeria.getLucro());
                        break;
                    case 5:
                        System.out.println("5. Sair");
                        sc.close();
                        break;
                }
            } catch (InputMismatchException e) {
                System.out.println("Carater inválido.");
                sc.nextLine();
                continue;
            }
        } while (opcao != 5);
    }
}