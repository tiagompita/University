
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class BookManager extends BookCostCalculator {

    private static ArrayList<Book> lib;

    public BookManager() {
        lib = new ArrayList<>();
    }

    public void addBook(Book book) {
        for (Book b : lib) {
            if (b.equals(book)) {
                System.out.println("O livro já existe!");
                return;
            }
        }
        lib.add(book);
        System.out.println("Livro adicionado com sucesso.");
    }

    public void removeBook(int id) {
        for (Book book : lib) {
            if (book.getID() == id) {
                lib.remove(book);
                System.out.println("Livro removido com sucesso.");
                return;
            }
        }
        System.out.println("Livro inexistente.");
    }

    public Book getBook(int id) {
        for (Book book : lib) {
            if (book.getID() == id) {
                return book;
            }
        }
        return null;
    }

    public double calculateBookLoanCost(int days, int id) {
        for (Book book : lib) {
            if (book.getID() == id) {
                return calculateCost(days);
            }
        }
        throw new Error("O livro não existe");
    }

    public void printAllBooks() {
        for (Book book : lib) {
            System.out.println(book.toString());
        }
    }

    public void readFile(String file) {
        try (Scanner scan = new Scanner(new File(file), "UTF-8").useDelimiter("[\t\n]+")) {
            scan.nextLine(); //Ignorar a primeira linha

            while (scan.hasNext()) {
                String name = scan.next();
                String autor = scan.next();
                String publisher = scan.next();
                String ISBN = scan.next();
                String release = scan.next();

                Book book = new Book(name, autor, publisher, ISBN, release);

                lib.add(book);
            }
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred: " + e.getMessage());
        }
    }

    public void writeFile(String file) {

        try {
            FileWriter allbooks = new FileWriter(file);
            allbooks.write("Name\tAuthor\tPublisher\tISBN\tRelease Date\n");
            for (Book book : lib) {
                String bookData = String.format("%s\t%s\t%s\t%s\t%s\n",
                        book.getNome(), book.getAutor(), book.getEditora(), book.getISBN(), book.getDataLancamento());
                allbooks.write(bookData);
            }

            allbooks.close();
        } catch (IOException e) {
            System.out.println("An error occurred: " + e.getMessage());
        }

    }
}
