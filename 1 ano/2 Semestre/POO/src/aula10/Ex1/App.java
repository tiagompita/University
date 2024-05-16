package aula10.Ex1;

import java.util.HashMap;

public class App {
    private static HashMap<Genre, Book> bookByGenre = new HashMap<>();
    
    public static void insert(Genre genre, Book Book) {
        if(!bookByGenre.containsKey(genre)) {
            bookByGenre.put(genre, Book);
        }
    }

    public static void remove(Genre Genre) {
        if(bookByGenre.containsKey(Genre)) {
            bookByGenre.remove(Genre);
        }
    }


    public static void main(String[] args) {
        // Drama
        App.insert(Genre.DRAMA, new Book("Hamlet", "William Shakespeare", 1603));

        // Ficção
        App.insert(Genre.FICTION, new Book("Dom Quixote", "Miguel de Cervantes", 1605));

        // Horror
        App.insert(Genre.HORROR, new Book("O Iluminado", "Stephen King", 1977));

        // Romance
        App.insert(Genre.ROMANCE, new Book("Orgulho e Preconceito", "Jane Austen", 1813));

        // Ficção Científica
        App.insert(Genre.SCI_FI, new Book("Admirável Mundo Novo", "Aldous Huxley", 1932));

        printBookByGenre();

        printGenre();

        for (Book book : bookByGenre.values()) {
            System.out.println(book);
        }

        System.out.println("\n\n");
        // Remove todos os livros de um gênero
        App.remove(Genre.FICTION);

        //Alterar
        bookByGenre.put(Genre.DRAMA, new Book("Alterar", "Aterar", 1111));
    
        printBookByGenre();

    }

    public static void printBookByGenre() {
        for (HashMap.Entry<Genre, Book> entry : bookByGenre.entrySet()) {
            System.out.println(entry.getKey() + ": ");
            System.out.println("\t" + entry.getValue());

        }
    }
    
    public static void printGenre() {
        System.out.println("\n=========Géneros=========");
        for (HashMap.Entry<Genre, Book> entry : bookByGenre.entrySet()) {
            System.out.println(entry.getKey());
        }
        System.out.println();
    }
}
