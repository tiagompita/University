package aula07.Ex2;

public class DateYMD extends Date {
    
    protected int day;
    protected int month;
    protected int year;

    public DateYMD(int day, int month, int year) {
        if (valid(day, month, year)) {
            this.day = day;
            this.month = month;
            this.year = year;
        } else {
            throw new Error("Data invalida");
        }
    }


    public void set(int day, int month, int year) {
        if (valid(day, month, year)) {
            this.day = day;
            this.month = month;
            this.year = year;
            System.out.printf("Data definida para % / % / %", day, month,year);
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

    public void increment() {
        this.day++;

        if (day > monthDays(month, year)) {
            this.day = 1;
            this.month++;
            if (!validMonth(this.month)) {
                this.month = 1;
                this.year++;
            }
        }
        System.out.println("New date: " + this);
    }

    public void decrement() {
        this.day--;

        if (day < 1) {
            this.month--;
            this.day = monthDays(month, year);
            if (!validMonth(this.month)) {
                this.month = 12;
                this.year--;
            }
        }
        System.out.println("New date: " + this);
    }

    @Override
    public String toString() {
        return year + "-" + month + "-" + day + "\n";
    }
}
