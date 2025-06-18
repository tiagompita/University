package aula04;

import java.util.ArrayList;

class Product {
    private String name;
    private double price;
    private int quantity;

    public Product(String name, double price, int quantity) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public double getTotalValue() {
        return price * quantity;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int  getQuantity() {
        return quantity;
    }
}

class CashRegister {
    private ArrayList<Product> products;

    public CashRegister() {
        products = new ArrayList<>();
    }

    public void addProduct(Product product) {
        products.add(product);
    }

    public void displayProducts() {
        double total = 0;
        System.out.printf("%-15s %5s %12s %8s\n", "Product", "Price", "Quantity", "Total");
        for (Product product : products) {
            total += product.getTotalValue();
            System.out.printf("%-15s %5.2f %12d %8.2f\n", product.getName(), product.getPrice(), product.getQuantity(), product.getPrice() * product.getQuantity());
        }
        System.out.printf("\nTotal value: %.2f\n", total);
    }
}

public class CashRegisterDemo {

    public static void main(String[] args) {

        // Cria e adiciona 5 produtos
        CashRegister cr = new CashRegister();
        cr.addProduct(new Product("Book", 9.99, 3));
        cr.addProduct(new Product("Pen", 1.99, 10));
        cr.addProduct(new Product("Headphones", 29.99, 2));
        cr.addProduct(new Product("Notebook", 19.99, 5));
        cr.addProduct(new Product("Phone case", 5.99, 1));
        
        // Listar o conteúdo e valor total
        cr.displayProducts();

    }
}