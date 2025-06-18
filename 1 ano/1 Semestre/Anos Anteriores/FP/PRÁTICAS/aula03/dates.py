
# This function checks if year is a leap year.
# It is wrong: 1900 was a common year!
def isLeapYear(year):
    if year%4 == 0 and year%100 != 0 or year%400 == 0:
        value = True
    else:
        value = False
    return value

# A table with the days in each month (on a common year).
# For example: MONTHDAYS[3] is the number of days in March.
MONTHDAYS = (0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)

# This function has a semantic error: February in a leap year should return 29!
# Correct it.
def monthDays(year, month):
    if isLeapYear(year) == True and month == 2:
        days = MONTHDAYS[month] + 1
    else:
        days = MONTHDAYS[month]
    return days

# This is wrong, too.
def nextDay(year, month, day):
    day += 1
    if day > MONTHDAYS[month]:
        month += 1
        day = 1
    if month > 12:
        year += 1
        month = 1
        day = 1
    return year, month, day

# This is the main function
def main():
    print("Was", 2017, "a leap year?", isLeapYear(2017))    # False?
    print("Was", 2016, "a leap year?", isLeapYear(2016))    # True?
    print("Was", 2000, "a leap year?", isLeapYear(2000))    # True?
    print("Was", 1900, "a leap year?", isLeapYear(1900))    # False?
    
    print("January 2017 had", monthDays(2017, 1), "days")   # 31?
    print("February 2017 had", monthDays(2017, 2), "days")  # 28?
    print("February 2016 had", monthDays(2016, 2), "days")  # 29?
    print("February 2000 had", monthDays(2000, 2), "days")  # 29?
    print("February 1900 had", monthDays(1900, 2), "days")  # 28?
    
    y, m, d = nextDay(2017, 1, 30)
    print(y, m, d)    # 2017 1 31 ?
    y, m, d = nextDay(2017, 1, 31)
    print(y, m, d)    # 2017 2 1 ?
    y, m, d = nextDay(2017, 2, 28)
    print(y, m, d)    # 2017 3 1 ?
    y, m, d = nextDay(2016, 2, 29)
    print(y, m, d)    # 2016 3 1 ?
    y, m, d = nextDay(2017, 12, 31)
    print(y, m, d)    # 2018 1 1 ?

# call the main function
main()
