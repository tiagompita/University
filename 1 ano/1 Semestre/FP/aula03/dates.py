
# This function checks if year is a leap year.
# It is wrong: 1900 was a common year!
# (See: https://en.wikipedia.org/wiki/Leap_year)
 
def isLeapYear (year) :
   if year % 4 == 0:
      if year % 100 == 0:
         if year % 400 == 0:
            return True
         else:
            return False
      else:
         return True
   else:
      return False                  

# This function has a semantic error: February in a leap year should return 29!
# Correct it.
def monthDays(year, month):
   MONTHDAYS = (0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31) 
    # Change February to 28 days for non-leap years.
        # This tuple contains the days in each month (on a common year).
        # For example: MONTHDAYS[3] is the number of days in March.
   if month == 2 and isLeapYear(year):
        days = 29
   else:
        days = MONTHDAYS[month]
   return days   

# This is wrong, too.
def nextDay(year, month, day):
    # Get the number of days in the current month.
    daysMonth = monthDays(year, month)
    
    # Increment the day.
    day += 1
    
    # If we have gone past the end of the month,
    # increment the month and set the day to one.
    if day > daysMonth:
        month += 1
        day = 1
        
        # If we have gone past December,
        # increment the year and set the month to January.
        if month > 12:
            year += 1
            month = 1
            
    return year, month, day

def nextMonth(year, month):
   nextMonth = month + 1
   if nextMonth > 12:
      year += 1
      month = 1
   else:
      month += 1
   return year, month
   
def previousDay(year, month, day):
    # Previous the day.
    day -= 1
    
    if day < 1:
        month -= 1
        day = monthDays(year, month)
        
        # If we have gone past December,
        # increment the year and set the month to January.
        if month < 1:
            year -= 1
            month = 12
            
    return year, month, day
      
def previousMonth(year, month):
    previousMonth = month - 1
    if previousMonth < 1:
      year -= 1
      month = 12
    else:
      month -= 1
    return year, month 

def dateIsValid(year, month, day):
    return

# This is the main function
def main():
    print("Was", 2017, "a leap year?", isLeapYear(2017))    # False?
    print("Was", 2016, "a leap year?", isLeapYear(2016))    # True?
    print("Was", 2000, "a leap year?", isLeapYear(2000))    # True?
    print("Was", 1900, "a leap year?", isLeapYear(1900))    # False?
    
    print("January 2017 had", monthDays(2017, 1), "days")   # 31
    print("February 2017 had", monthDays(2017, 2), "days")  # 28
    print("February 2016 had", monthDays(2016, 2), "days")  # 29
    print("February 2000 had", monthDays(2000, 2), "days")  # 29
    print("February 1900 had", monthDays(1900, 2), "days")  # 28
    
    y, m, d = nextDay(2017, 1, 30)
    print(y, m, d)    # 2017 1 31 
    y, m, d = nextDay(2017, 1, 31)
    print(y, m, d)    # 2017 2 1 
    y, m, d = nextDay(2017, 2, 28)
    print(y, m, d)    # 2017 3 1 
    y, m, d = nextDay(2016, 2, 29)
    print(y, m, d)    # 2016 3 1 
    y, m, d = nextDay(2017, 12, 31)
    print(y, m, d)    # 2018 1 1 


# call the main function
if __name__ == "__main__":
    main()