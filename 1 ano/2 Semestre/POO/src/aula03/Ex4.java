package aula03;

import java.util.Scanner;


public class Ex4 {
    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);
        
        System.out.println("Quantos alunos a turma tem?");
        int alunos = scan.nextInt();
        float[][] turma = new float[alunos][2];

        System.out.println("");
        System.out.println("NotaT   NotaP   Pauta");
        for (int i=0; i <= turma.length ; i++) {
            for (int n=0; n < 2; n++) {
                turma[i][n] = common.Utils.randomFloat(20, 0);
            }
            System.out.format("%5.1f %7.1f %7.1f\n", turma[i][0], turma[i][1], notaF(turma[i][0], turma[i][1]));
        }

        scan.close();
    }

    public static float notaF(float notaT, float notaP) {
        float notaF = 0;

        if (notaP < 7 || notaT < 7) {
            notaF = 66;
        } else {
            notaF = Math.round(0.4f * notaT + 0.6f * notaP);
        }

        return notaF;
    }
}
