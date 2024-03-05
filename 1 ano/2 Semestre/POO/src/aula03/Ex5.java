package aula03;

import java.time.Month;
import java.util.Scanner;

public class Ex5 {
    public static void main(String[] args) {
        int d,mm,yyyy = 0;

        Scanner scan = new Scanner(System.in);
        
        do{
            System.out.println("Mês:");
            mm = common.UtilsIO.nextInt();
        } while (!common.Utils.isInRangeInt(mm, 1, 12));

        System.out.println("Ano:");
        yyyy = common.UtilsIO.nextInt();
        
        System.out.println("Dia da semana (1 = Segunda, 2 = Terça, 3 = Quarta, 4 = Quinta,5 = Sexta, 6 = Sábado, 7 = Domingo)");
        d = common.UtilsIO.nextInt();

        int days;
        switch (mm) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12: 
                days = 31;            
                break;
        
            case 2: 
                if (common.Utils.isLeapYear(yyyy)) {
                    days = 29;
                } else {
                    days = 28;
                }
                break;

            default:
                days = 30;
                break;
        }


        System.out.format("%10s %4d\n", Month.of(mm).name(), yyyy);
        System.out.println("Su Mo Tu We Th Fr Sa");
        for (int i = 1; i < d; i++) {
            System.out.print("   ");
        }
        for (int dia = 1; dia <= days; dia++) {
            System.out.printf("%2d ", dia);
            if ((dia + d - 1) % 7 == 0) {
                System.out.println();
            }
        }

        scan.close();
    }

    
}
