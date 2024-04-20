package aula08.Ex3;

import java.util.ArrayList;

public class CarrinhoDeCompras implements Compra {

    private ArrayList<Produto> Carrinho;

    public CarrinhoDeCompras() {
        Carrinho = new ArrayList<>();
    }

    @Override
    public void adicionarProduto(Produto produto, int quantidade) {
        for (int i = 1; i <= quantidade; i++) {
            Carrinho.add(produto);
        }
    }

    @Override
    public void listarProdutos() {
        for(Produto produto : Carrinho) {
            System.out.println(produto);
        }
        
    }

    @Override
    public double calcularTotal() {
        double total = 0;
        for(Produto produto : Carrinho) {
            total += produto.getPreco();
        }
        return total;
    }
}
