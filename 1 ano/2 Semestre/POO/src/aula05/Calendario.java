package aula05;

import java.time.Month;
import java.util.Scanner;

public class Calendario {
    private int year;
    private int dweek;
    private int[][] events = new int[12][31]; // 12 meses, 31 dias

    Scanner scan = new Scanner(System.in);
    
    public Calendario(int year, int dweek){
        this.year = year;
        this.dweek = dweek;
       

    }

    public int year() {
        return this.year;
    }

    public String firstWeekdayOfYear() {
        switch (this.dweek) {
            case 1: 
                return "Domingo";
            case 2:
                return "Segunda-feira";
            case 3:
                return "Terça-feira";
            case 4:
                return "Quarta-feira";
            case 5:
                return "Quinta-feira";
            case 6:
                return "Segunda-feira";
            default:
                return "Sábado";
        }
    }

    public int firstWeekdayOfMonth(int month) {
        return 1; // ??????
    }

    public void addEvent(DateYMD date) {
        int day = date.getDay();
        int month = date.getMonth();
        
        events[month - 1][day - 1]++;
        System.out.printf("Evento para %s/%s criado.", day, month);

    }

    public void removeEvent(DateYMD date) {
        int day = date.getDay();
        int month = date.getMonth();

        if (events[month - 1][day - 1] > 0) {
            events[month - 1][day - 1]--;
        } else {
            System.out.println("Não há eventos nesta data.");
        }
    }

    public void printMonth(int month) {
        System.out.format("%10s %4d\n", Month.of(month).name(), year);
        System.out.println("Su Mo Tu We Th Fr Sa");

        int daysInMonth = DateYMD.monthDays(month, year);

        for(int i = 1; i < dweek; i++) {
            System.out.print("   ");
        }
        for(int dia = 1; dia <= daysInMonth; dia++) {
            if (events[month - 1][dia - 1] != 0) {
                System.out.printf("*%2d", dia);
            } else {
                System.out.printf("%2d ", dia);
            }
            if ((dia + dweek - 1) % 7 == 0) {
                System.out.println();
            }
        }
        System.out.println();
        dweek = (dweek + daysInMonth - 1) % 7 + 1; // Update dweek for the next month
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 12; i++) {
            sb.append(String.format("%10s %4d\n", Month.of(i).name(), year));
            sb.append("Su Mo Tu We Th Fr Sa\n");

            int daysInMonth = DateYMD.monthDays(i, year);

            for(int j = 1; j < dweek; j++) {
                sb.append("   ");
            }
            for(int dia = 1; dia <= daysInMonth; dia++) {
                if (events[i - 1][dia - 1] != 0) {
                    sb.append(String.format("*%2d ", dia));
                } else {
                    sb.append(String.format("%2d ", dia));
                }
                if ((dia + dweek - 1) % 7 == 0) {
                    sb.append("\n");
                }
            }
            sb.append("\n");
            dweek = (dweek + daysInMonth - 1) % 7 + 1; // Update dweek for the next month
        }
        return sb.toString();
    }
}

