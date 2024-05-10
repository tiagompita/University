package aula10.Ex2;

public enum Genre {
    DRAMA("Drama"),
    FICTION("Ficção"),
    HORROR("Horror"),
    ROMANCE("Romance"),
    SCI_FI("Ficção Científica"); 

    private String genre;

    private Genre(String genre) {
        this.genre = genre;
    }

}