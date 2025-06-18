package ExamePratico;

public class EventOccurrence extends Place {
    private String time;

    public EventOccurrence(String name, Integer capacity, String time) {
        super(name, capacity);
        this.time = time;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}