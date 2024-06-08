package ExamePratico;

import java.util.*;

public class TicketBookingSystem implements ITicketBookingSystem {
    private Map<Event, Map<Place, String>> tbs;

    public TicketBookingSystem() {
        this.tbs = new TreeMap<>();
    }

    @Override
    public boolean addEventOccurrence(Event event, Place place, String schedule) {
        Map<Place, String> placeScheduleMap = tbs.get(event);
    
        if (placeScheduleMap == null) {
            placeScheduleMap = new TreeMap<>();
            tbs.put(event, placeScheduleMap);
        }
    

        if (placeScheduleMap.containsKey(place)) {

            if (placeScheduleMap.get(place).equals(schedule)) {
                return false;
            }
        }
    

        placeScheduleMap.put(place, schedule);
    
        return true;
    }
    @Override
    public int bookTickets(int eventId, int numTickets) {
        /* for (Event event : tbs.keySet()) {
            if (event.getId() == eventId) {
                if (event.getAvailableTickets() >= numTickets) {
                    event.setAvailableTickets(event.getAvailableTickets() - numTickets);
                    return event.getTicketReference();
                } else {
                    return -1;
                }
            }
        } */
        return -1; 
    }
    
    @Override
    public boolean cancelTickets(int ticketReference) {
        /* for (Event event : tbs.keySet()) {
            if (event.getTicketReference() == ticketReference) {
                event.setAvailableTickets(event.getAvailableTickets() + 1);
                return true;
            }
        } */
        return false; 
    }
    
    @Override
    public Collection<EventOccurrence> getEventOccurrences() {
        Collection<EventOccurrence> eventOccurrences = new ArrayList<>();
        /* for (Event event : tbs.keySet()) {
            Map<Place, String> placeSchedule = tbs.get(event);
            for (Place place : placeSchedule.keySet()) {
                String schedule = placeSchedule.get(place);
                eventOccurrences.add(new EventOccurrence(event, place, schedule));
            }
        } */
        return eventOccurrences;
    }
}