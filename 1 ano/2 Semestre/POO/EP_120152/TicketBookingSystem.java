
import java.util.*;

public class TicketBookingSystem implements ITicketBookingSystem {
    private List<EventOccurrence> occurrences = new ArrayList<>();
    private Map<Integer, EventOccurrence> occurrenceMap = new HashMap<>();
    private Map<Integer, Ticket> ticketBookings = new HashMap<>();

    @Override
    public boolean addEventOccurrence(Event event, Place place, String schedule) {
        for (EventOccurrence occurrence : occurrences) {
            if (occurrence.getPlace().equals(place) && occurrence.getDateTime().equals(schedule)) {
                return false;
            }
        }
        EventOccurrence newOccurrence = new EventOccurrence(event, place, schedule);
        occurrences.add(newOccurrence);
        occurrenceMap.put(newOccurrence.getId(), newOccurrence);
        return true;
    }

    @Override
    public int bookTickets(int eventId, int numTickets) {
        EventOccurrence occurrence = occurrenceMap.get(eventId);
        if (occurrence == null || occurrence.getTicketsAvailable() < numTickets) {
            return -1;
        }
        occurrence.bookTickets(numTickets);
        Ticket ticket = new Ticket(occurrence, numTickets);
        ticketBookings.put(ticket.getReference(), ticket);
        occurrence.addTicket(ticket);
        return ticket.getReference();
    }

    @Override
    public boolean cancelTickets(int ticketReference) {
        Ticket ticket = ticketBookings.remove(ticketReference);
        if (ticket == null) {
            return false;
        }
        EventOccurrence occurrence = ticket.getOccurrence();
        if (occurrence == null) {
            return false;
        }
        occurrence.cancelTickets(ticket.getNumTickets());
        return true;
    }

    @Override
    public Collection<EventOccurrence> getEventOccurrences() {
        return occurrences;
    }
}