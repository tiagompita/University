import java.util.*;

public abstract class Event {
    private String name;
    private int duration;

    public Event(String name, int duration) {
        this.name = name;
        this.duration = duration;
    }

    public String getName() {
        return name;
    }

    public int getDuration() {
        return duration;
    }

    public abstract String getDetails();
}