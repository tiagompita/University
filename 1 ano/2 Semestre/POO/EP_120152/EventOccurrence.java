
import java.util.*;

public class EventOccurrence {
    private static int idCounter = 1000;
    private int id;
    private Event event;
    private Place place;
    private String dateTime;
    private int ticketsAvailable;
    private List<Ticket> tickets;

    public EventOccurrence(Event event, Place place, String dateTime) {
        this.id = idCounter++;
        this.event = event;
        this.place = place;
        this.dateTime = dateTime;
        this.ticketsAvailable = place.getCapacity();
        this.tickets = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public Event getEvent() {
        return event;
    }

    public Place getPlace() {
        return place;
    }

    public String getDateTime() {
        return dateTime;
    }

    public int getTicketsAvailable() {
        return ticketsAvailable;
    }

    public void bookTickets(int numTickets) {
        ticketsAvailable -= numTickets;
    }

    public void addTicket(Ticket ticket) {
        tickets.add(ticket);
    }

    public void cancelTickets(int numTickets) {
        ticketsAvailable += numTickets;
    }

    @Override
    public String toString() {
        return event.getName() + " [" + event.getDuration() + " minutes], " + event.getDetails() + " at "
                + place.getName() + ", " + dateTime + ", " + ticketsAvailable + " tickets available";
    }
}