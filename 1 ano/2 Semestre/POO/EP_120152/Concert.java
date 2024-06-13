public class Concert extends Event {
    private String artist;

    public Concert(String artist, String name, int duration) {
        super(name, duration);
        this.artist = artist;
    }

    @Override
    public String getDetails() {
        return "concert by " + artist;
    }
}