
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class Book {

    private int ID;
    private static int IDs = 1;
    private String nome;
    private String autor;
    private String editora;
    private String ISBN;
    private LocalDate DataLancamento;

    public Book(String nome, String autor, String editora, String ISBN, String DataLancamento) {
        ID = IDs;
        this.nome = nome;
        this.autor = autor;
        this.editora = editora;
        String[] ISBNcheck = ISBN.split("-");
        if (ISBNcheck.length == 5 && String.join("", ISBN.split("-")).length() == 13) {
            if (ISBN.replaceAll("-", "").matches("\\d+")) {
                this.ISBN = ISBN;
            } else {
                throw new Error("Invalid ISBN: not numeric");
            }
        } else {
            throw new Error("Invalid ISBN: incorrect length");
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        this.DataLancamento = LocalDate.parse(DataLancamento, formatter);
    
        IDs++;
    }

    public String getNome() {
        return nome;
    }


    public int getID() {
        return ID;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEditora() {
        return editora;
    }

    public void setEditora(String editora) {
        this.editora = editora;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String iSBN) {
        ISBN = iSBN;
    }

    public LocalDate getDataLancamento() {
        return DataLancamento;
    }

    public void setDataLancamento(LocalDate dataLancamento) {
        DataLancamento = dataLancamento;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        result = prime * result + ((ISBN == null) ? 0 : ISBN.hashCode());
        return result;
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Book other = (Book) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (nome.equals(other.nome))
            return true;
        if (ISBN == null) {
            if (other.ISBN != null)
                return false;
        } else if (ISBN.equals(other.ISBN))
            return true;
        return false;
    }

    @Override
    public String toString() {
        return "Book =>\n\tID: " + ID + "\tNome: " + nome + "\tAutor: " + autor + "\n\tEditora:" + editora + "\tISBN: " + ISBN
                + "\n\tData de Lançamento:" + DataLancamento;
    }

    
    
}
