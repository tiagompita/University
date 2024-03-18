package aula05;

public class DateYMD {
    
    private int day;
    private int month;
    private int year;

    public DateYMD(int day, int month, int year) {
        if (valid(day, month, year)) {
            this.day = day;
            this.month = month;
            this.year = year;
        } else {
            throw new Error("Data invalida");
        }
    }

    public static boolean validMonth(int month) {
        if (1 <= month && month <= 12) {
            return true;
        } else {
            return false;
        }
    }

    public static int monthDays(int month, int year) {
        switch (month) {
            case 4:
            case 6:
            case 9:
            case 11: return 30;
            case 2:
                
                if (leapYear(year)) {
                    return 29;
                } else {
                    return 28;
                }

            default: return 31;
        }
    }

    public static boolean leapYear(int year) {
        if (year % 400 == 0) {
            if (year % 100 == 0) {
                if (year % 4 == 0) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean valid(int day, int month, int year) {
        if (!validMonth(month)) {
            return false;
        } else {
            if (monthDays(month, year) < day || day < 0) {
                return false;
            }
        }
        return true;
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
