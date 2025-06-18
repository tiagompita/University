
public class BookCostCalculator implements IBookCostCalculator {

    private static final Double emprestLivro = 2.00;
    private static final Double juro = 0.75;

    @Override
    public double calculateCost(int days) {
        if (days <= 5) {
            return emprestLivro;
        } else {
            return emprestLivro + (days - 5) * juro;
        }
    }

}
