package aula07.Ex2;

import java.time.LocalDate;

public class DateND extends Date{

    protected int days;

    protected int day;
    protected int month;
    protected int year;

    public DateND() {

        this.day = LocalDate.now().getDayOfMonth();
        this.month = LocalDate.now().getMonthValue();
        this.year = LocalDate.now().getYear();

    }

    public void set(int day, int month, int year) {
        if (valid(day, month, year)) {
            this.day = day;
            this.month = month;
            this.year = year;
        } else {
            throw new Error("Data inválida");
        }
    
    }

    public int getDay() {
        return day;
    }
    
    public int getMonth() {
        return month;
    }
    
    public int getYear() {
        return year;
    }

    public int calculateDays() {
        for(int i = 2000; i < year; i++) {
            if (leapYear(i)) {
                days += 366;
            } else {
                days += 365;
            }
        }

        for(int i = 1; i < month; i++) {
            days += monthDays(i, year);
        }

        days += day;

        return days;
    }


    
}
