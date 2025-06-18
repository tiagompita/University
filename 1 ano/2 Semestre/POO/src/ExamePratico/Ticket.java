package ExamePratico;

public class Ticket extends EventOccurrence {
    private String sequence;
    private Integer tickets;

    public Ticket(String name, Integer capacity, String time, String sequence, Integer tickets) {
        super(name, capacity, time);
        this.sequence = sequence;
        this.tickets = tickets;
    }

    public String getSequence() {
        return sequence;
    }

    public void setSequence(String sequence) {
        this.sequence = sequence;
    }

    public Integer getTickets() {
        return tickets;
    }

    public void setTickets(Integer tickets) {
        this.tickets = tickets;
    }

    
}
