public class Ticket {
    private static int idCounter = 1;
    private int reference;
    private EventOccurrence occurrence;
    private int numTickets;

    public Ticket(EventOccurrence occurrence, int numTickets) {
        this.reference = idCounter++;
        this.occurrence = occurrence;
        this.numTickets = numTickets;
    }

    public int getReference() {
        return reference;
    }

    public EventOccurrence getOccurrence() {
        return occurrence;
    }

    public int getNumTickets() {
        return numTickets;
    }
}