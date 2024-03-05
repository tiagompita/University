package common;

import java.lang.Math;

public class Utils {

    //Verifica se é primo
    public static boolean isPrime(int num) {
        if (num <= 1) {
            return false;
        }
        for (int i = 2; i < num; i++) {
            if (num % i == 0) {
                return false;
            }
        }
        return true;
    }

    public static int randomInt(int max, int min) {

        int range = max - min + 1;

        //Número aleatório
        int secret = (int)(Math.random() * range) + min;

        return secret;
    }

    public static float randomFloat(float max, float min) {

        float range = max - min + 1;

        //Número aleatório
        float secret = (float)(Math.random() * range) + min;

        return secret;
    }

    public static boolean isInRangeInt(int valor, int min, int max) {
        if (valor >= min && valor <= max) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean isLeapYear(int year) {
        if (year % 400 == 0) {
            if (year % 100 == 0) {
                if (year % 4 == 0) {
                    return true;
                }
                
            }
        } 

        return false;
        
    }

}
