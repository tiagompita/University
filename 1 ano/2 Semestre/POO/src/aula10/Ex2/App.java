package aula10.Ex2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import aula10.Ex1.Genre;
import aula10.Ex1.Book;

public class App {
    private static HashMap<Genre, ArrayList<Book>> BookByGenre = new HashMap<>();
    
    public static void insert(Genre Genre, Book Book) {
        if(!BookByGenre.containsKey(Genre)) {
            BookByGenre.put(Genre, new ArrayList<Book>());
        }
        BookByGenre.get(Genre).add(Book);
    }

    public static void remove(Genre Genre) {
        if(BookByGenre.containsKey(Genre)) {
            BookByGenre.remove(Genre);
        }
    }
    
    public static void remove(Genre Genre, Book Book) {
        if(BookByGenre.containsKey(Genre)) {
            if(BookByGenre.get(Genre).contains(Book)) {
                BookByGenre.get(Genre).remove(Book);
            }
        }
    }


    public static void main(String[] args) {
        // Drama
        App.insert(Genre.DRAMA, new Book("Hamlet", "William Shakespeare", 1603));
        App.insert(Genre.DRAMA, new Book("Um Bonde Chamado Desejo", "Tennessee Williams", 1947));
        App.insert(Genre.DRAMA, new Book("Casa de Bonecas", "Henrik Ibsen", 1879));
        App.insert(Genre.DRAMA, new Book("Morte de um Vendedor", "Arthur Miller", 1949));
        App.insert(Genre.DRAMA, new Book("Rei Lear", "William Shakespeare", 1605));

        // Ficção
        App.insert(Genre.FICTION, new Book("Dom Quixote", "Miguel de Cervantes", 1605));
        App.insert(Genre.FICTION, new Book("O Senhor dos Anéis", "J.R.R. Tolkien", 1954));
        App.insert(Genre.FICTION, new Book("Cem Anos de Solidão", "Gabriel García Márquez", 1967));
        App.insert(Genre.FICTION, new Book("O Grande Gatsby", "F. Scott Fitzgerald", 1925));
        App.insert(Genre.FICTION, new Book("Orgulho e Preconceito", "Jane Austen", 1813));

        // Horror
        App.insert(Genre.HORROR, new Book("O Iluminado", "Stephen King", 1977));
        App.insert(Genre.HORROR, new Book("O Exorcista", "William Peter Blatty", 1971));
        App.insert(Genre.HORROR, new Book("Frankenstein", "Mary Shelley", 1818));
        App.insert(Genre.HORROR, new Book("Drácula", "Bram Stoker", 1897));
        App.insert(Genre.HORROR, new Book("O Corvo", "Edgar Allan Poe", 1845));

        // Romance
        App.insert(Genre.ROMANCE, new Book("Orgulho e Preconceito", "Jane Austen", 1813));
        App.insert(Genre.ROMANCE, new Book("O NoteBook", "Nicholas Sparks", 1996));
        App.insert(Genre.ROMANCE, new Book("Diário de Uma Paixão", "Nicholas Sparks", 1996));
        App.insert(Genre.ROMANCE, new Book("A Cabana", "William P. Young", 2007));
        App.insert(Genre.ROMANCE, new Book("Como Água para Chocolate", "Laura Esquivel", 1985));

        // Ficção Científica
        App.insert(Genre.SCI_FI, new Book("Admirável Mundo Novo", "Aldous Huxley", 1932));
        App.insert(Genre.SCI_FI, new Book("1984", "George Orwell", 1949));
        App.insert(Genre.SCI_FI, new Book("O Guia do Mochileiro das Galáxias", "Douglas Adams", 1979));
        App.insert(Genre.SCI_FI, new Book("Duna", "Frank Herbert", 1965));
        App.insert(Genre.SCI_FI, new Book("O Jogo de Ender", "Orson Scott Card", 1985));

        printBookByGenre();

        printGenre();

        for (ArrayList<Book> List : BookByGenre.values()) {
            for (Book Book : List) {
                System.out.println(Book);
            }
        }

        // Remove um livro específico
        App.remove(Genre.DRAMA, new Book("Hamlet", "William Shakespeare", 1603));

        // Remove todos os livros de um gênero
        App.remove(Genre.FICTION);

        printBookByGenre();

        printGenre();

        printRandomBookByGenre(Genre.HORROR);

    }

    public static void printBookByGenre() {
        for (HashMap.Entry<Genre, ArrayList<Book>> entry : BookByGenre.entrySet()) {
            System.out.println(entry.getKey() + ": ");
            for (Book book : entry.getValue()) {
                System.out.println("\t" + book);
            }
        }
    }
    
    public static void printGenre() {
        System.out.println("\n=========Géneros=========");
        for (HashMap.Entry<Genre, ArrayList<Book>> entry : BookByGenre.entrySet()) {
            System.out.println(entry.getKey());
        }
        System.out.println();
    }

    public static void printRandomBookByGenre(Genre genre) {
        Random random = new Random();
        ArrayList<Book> books = BookByGenre.get(genre);
    
        if (books != null && !books.isEmpty()) {
            int randomIndex = random.nextInt(books.size());
            System.out.println(books.get(randomIndex)); 
        } else {
            System.out.println("Não há livros desse género");
        }

    }
}
