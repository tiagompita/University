package aula08.Ex3;

public class ProdutoComDesconto implements Produto{
    private String nome;
    private double preco;
    private int quantidade;

    public ProdutoComDesconto(String nome, double preco, int quantidade, double desconto) {
        this.nome = nome;
        this.preco = preco - desconto;
        this.quantidade = quantidade;
    }

    @Override
    public String getNome() {
        return nome;
    }

    @Override
    public int getQuantidade() {
        return quantidade;
    }

    @Override
    public double getPreco() {
        return preco;
    }

    @Override
    public void adicionarQuantidade(int quantidade) {
        this.quantidade += quantidade;
    }

    @Override
    public void removerQuantidade(int quantidade) {
        this.quantidade -= quantidade;
    }

    @Override
    public String toString() {
        return "Produto " + nome + ", Preço Descontado: " + preco + ", Quantidade: " + quantidade;
    }
}
