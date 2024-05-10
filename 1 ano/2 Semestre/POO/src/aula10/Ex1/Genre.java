package aula10.Ex1;

public enum Genre {
    DRAMA("Drama"),
    FICTION("Ficção"),
    HORROR("Horror"),
    ROMANCE("Romance"),
    SCI_FI("Ficcção Científica");

    private String genre;

    private Genre(String genre) {
        this.genre = genre;
    }
    
    public String getGenre() {
        return genre;
    }

    @Override
    public String toString() {
        return this.getGenre();
    }
}