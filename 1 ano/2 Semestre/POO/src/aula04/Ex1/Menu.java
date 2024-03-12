package aula04.Ex1;
import java.util.Scanner;
import java.util.ArrayList;

public class Menu {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        ArrayList<Object> figures = new ArrayList<>();

        while (true) {
            System.out.println("\n1. Criar figura");
            System.out.println("2. Listar figuras");
            System.out.println("3. Comparar figuras");
            System.out.println("4. Sair");
            System.out.print("Escolha uma opção: ");
            int option = scan.nextInt();

            switch (option) {
                case 1: //Cria as figuras
                    String continueAdding;
                    do { //loop para poder criar mais do que 1 figura
                        try { // try catch para que o programa nao termine caso ocorra o erro esperado.
                            System.out.println("\n1. Criar círculo");
                            System.out.println("2. Criar retângulo");
                            System.out.println("3. Criar Triângulo");
                            System.out.println("4. Sair");

                            System.out.print("Escolha uma opção: ");
                            int option2 = scan.nextInt();

                            switch (option2) {
                                case 1:
                                    System.out.print("Introduza o raio: ");
                                    double radius = scan.nextDouble();
                                    figures.add(new Circle(radius));
                                    break;
                                
                                case 2:
                                    System.out.print("Introduz o comprimento: ");
                                    double width = scan.nextDouble();
                                    System.out.print("Introduz a altura: ");
                                    double height = scan.nextDouble();
                                    figures.add(new Rectangle(width, height));
                                    break;

                                case 3:
                                    System.out.print("Introduz o primeiro cateto: ");
                                    double cat1 = scan.nextDouble();
                                    System.out.print("Introduz o segundo cateto: ");
                                    double cat2 = scan.nextDouble();
                                    System.out.print("Introduz a hipotenusa: ");
                                    double hip = scan.nextDouble();
                                    figures.add(new Triangle(cat1, cat2, hip));
                                    break;
                                case 4:
                                    break;
                                default:
                                    System.out.println("Opção inválida.");
                            }

                            System.out.print("Deseja adicionar mais figuras? (s/n): ");
                            continueAdding = scan.next();
                        } catch (IllegalArgumentException e) {
                            System.out.println("Erro: " + e.getMessage());
                            continueAdding = "s";
                        }
                    } while (continueAdding.equalsIgnoreCase("s"));
                    break;
                case 2: // Lista as figuras
                    int i = 0;
                    for (Object figure : figures) {
                        System.out.println(i + "- " + figure + "\n");
                        i++;
                    }
                    break;
                case 3:
                    // Código para comparar figuras
                    if (figures.size() < 2) {
                        System.out.println("\n Nao existe figuras suficientes para comparar. \n");
                        break;
                    }   

                    try {
                        System.out.print("Introduz o índice da primeira figura (0 a " + (figures.size() - 1) + "): ");
                        int index1 = scan.nextInt();
                        System.out.print("Introduz o índice da segunda figura (0 a " + (figures.size() - 1) + "): ");
                        int index2 = scan.nextInt();

                        Object figure1 = figures.get(index1);
                        Object figure2 = figures.get(index2);

                        if (figure1.equals(figure2)) {
                            System.out.println("As figuras são iguais.");
                        } else {
                            System.out.println("As figuras são diferentes.");
                        }
                        break;
                    } catch (IndexOutOfBoundsException e) {
                        System.out.println("Erro: " + e.getMessage());
                    }
                case 4:
                    scan.close();
                    System.exit(0);
                default:
                    System.out.println("Opção inválida.");
            }
        }
    }
}