package common;

import java.util.Scanner;

public class UtilsIO {

    public static float floatCheck() {
        Scanner scan = new Scanner(System.in);
        boolean isValid = false;
        float input = 0;

        while (!isValid) {
            if (scan.hasNextFloat()) {
                input = scan.nextFloat();
                isValid = true;
            } else {
                scan.next();
            }
        }
        scan.close();
        return input;
        
    }

    public static int nextInt() {
        Scanner scan = new Scanner(System.in);
        boolean isValid = false;
        int input = 0;

        while (!isValid) {
            if (scan.hasNextInt()) {
                input = scan.nextInt();
                isValid = true;
            } else {
                scan.next();
            }
        }
        scan.close();
        return input;
    }

}
