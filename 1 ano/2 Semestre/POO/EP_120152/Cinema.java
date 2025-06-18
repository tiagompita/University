public class Cinema extends Event {
    private String director;
    private int releaseYear;
    private String[] mainActors;

    public Cinema(String name, String director, int releaseYear, String[] mainActors, int duration) {
        super(name, duration);
        this.director = director;
        this.releaseYear = releaseYear;
        this.mainActors = mainActors;
    }

    @Override
    public String getDetails() {
        return "movie by " + director;
    }
}