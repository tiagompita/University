package ExamePratico;

public class Concert extends Event {
    private String artist;

    public Concert(String name, String artist, Integer duration) {
        super(name, duration);
        this.artist = artist;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    
}
