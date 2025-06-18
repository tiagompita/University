package ExamePratico;

public class Theatre extends Event{
    private String Author;
    private String company;

    public Theatre(String name, String Author, String company, Integer duration) {
        super(name, duration);
        this.Author = Author;
        this.company = company;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String author) {
        Author = author;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    
}
