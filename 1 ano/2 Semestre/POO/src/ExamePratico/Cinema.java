package ExamePratico;


public class Cinema extends Event {
    private String director;
    private Integer year;
    private String[] AllActors;

    public Cinema(String name, String director, Integer year, String[] AllActors, Integer duration) {
        super(name, duration);
        this.director = director;
        this.year = year;
        this.AllActors = AllActors;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public String[] getAllActors() {
        return AllActors;
    }

    public void setAllActors(String[] allActors) {
        AllActors = allActors;
    }

    
}
