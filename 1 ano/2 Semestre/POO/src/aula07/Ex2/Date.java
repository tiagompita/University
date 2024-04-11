package aula07.Ex2;

public abstract class Date {

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

    public abstract void set(int day, int month, int year);

    public abstract int getDay();
    public abstract int getMonth();
    public abstract int getYear();

}
