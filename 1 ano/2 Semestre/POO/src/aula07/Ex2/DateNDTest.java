package aula07.Ex2;

import java.time.LocalDate;

public class DateNDTest {
    public static void main(String[] args) {
        // Test case 1: Create a DateND object with the current date
        DateND date1 = new DateND();
        System.out.println("Test case 1:");
        System.out.println("Day: " + date1.getDay());
        System.out.println("Month: " + date1.getMonth());
        System.out.println("Year: " + date1.getYear());
        System.out.println("Expected output: Day, Month, and Year should match the current date");
        System.out.println();

        // Test case 2: Set a valid date
        DateND date2 = new DateND();
        date2.set(10, 8, 2022);
        System.out.println("Test case 2:");
        System.out.println("Day: " + date2.getDay());
        System.out.println("Month: " + date2.getMonth());
        System.out.println("Year: " + date2.getYear());
        System.out.println("Expected output: Day: 10, Month: 8, Year: 2022");
        System.out.println();

        // Test case 3: Set an invalid date
        DateND date3 = new DateND();
        try {
            date3.set(30, 2, 2022);
            System.out.println("Test case 3:");
            System.out.println("Expected output: Error should be thrown for invalid date");
        } catch (Error e) {
            System.out.println("Test case 3:");
            System.out.println("Error message: " + e.getMessage());
            System.out.println("Expected output: Error should be thrown for invalid date");
        }
        System.out.println();

        // Test case 4: Calculate the number of days since 1/1/2000
        DateND date4 = new DateND();
        date4.set(1, 1, 2001);
        int days = date4.calculateDays();
        System.out.println("Test case 4:");
        System.out.println("Number of days since 1/1/2000: " + days);
        System.out.println("Expected output: Number of days should be calculated correctly");
    }
}