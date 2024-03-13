package aula05;

public class DateYMD {

    public boolean validMonth(int month) {
        if (1 <= month && month <= 12) {
            return true;
        } else {
            return false;
        }
    }

    public int monthDays(int month, int year) {
        switch (month) {
            case 4:
            case 6:
            case 9:
            case 11: return 30;
            
            case 2:
                
                if (year % 400 == 0) {
                    if (year % 100 == 0) {
                        if (year % 4 == 0) {
                            return 29;
                        }
                    }
                }
                return 28;

            default: return 31;
        }
    }

    public boolean leapYear(int year) {
        if (year % 400 == 0) {
            if (year % 100 == 0) {
                if (year % 4 == 0) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean valid(int day, int month, int year) {
        if (validMonth(month) == false || ) {
            return false;
        }
    }

}
