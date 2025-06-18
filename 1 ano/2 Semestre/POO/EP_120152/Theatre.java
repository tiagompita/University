public class Theatre extends Event {
    private String author;
    private String company;

    public Theatre(String name, String author, String company, int duration) {
        super(name, duration);
        this.author = author;
        this.company = company;
    }

    @Override
    public String getDetails() {
        return "theatre play by " + author + ", performed by " + company;
    }
}