package aula09.Ex2;

import java.util.Collection;
import java.util.HashSet;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.TreeSet;
import java.util.Iterator;
import java.util.LinkedHashSet;

public class CollectionTester {
    public static void main(String[] args) {
        int[] DIM = {1000, 5000, 10000, 20000, 40000, 100000};
        Collection<Integer>[] collections = new Collection[]{
            new ArrayList<Integer>(), 
            new LinkedList<Integer>(), 
            new ArrayDeque<Integer>(),
            new HashSet<Integer>(),
            new LinkedHashSet<Integer>(),
            new TreeSet<Integer>()
        };

        System.out.printf("%-15s","Collection");
        for (int i : DIM) {
            System.out.printf(" %-10d", i);
        }
        System.out.println();

        for (Collection<Integer> col : collections) {

            System.out.println(col.getClass().getSimpleName());

            double[][] tempos = new double[DIM.length][];
            for (int i = 0; i < DIM.length; i++) {
                tempos[i] = checkPerformance(col, DIM[i]);
            }

            System.out.printf("%-15s", "add");
            for (double[] tempo : tempos) {
                System.out.printf(" %-10.2f", tempo[0]);
            }
            System.out.println();

            System.out.printf("%-15s", "search");
            for (double[] tempo : tempos) {
                System.out.printf(" %-10.2f", tempo[1]);
            }
            System.out.println();

            System.out.printf("%-15s", "remove");
            for (double[] tempo : tempos) {
                System.out.printf(" %-10.2f", tempo[2]);
            }
            System.out.println();
            System.out.println();
        }
    }

    private static double[] checkPerformance(Collection<Integer> col, int i) {
        double start, stop;
        double[] delta = new double[3];

        // Add
        start = System.nanoTime(); // clock snapshot before
        for(int j=0; j < i; j++ )
            col.add( j );

        stop = System.nanoTime(); // clock snapshot after
        delta[0] = (stop-start)/1e6; // convert to milliseconds

        /* System.out.println(col.size()+ ": Add to " +
            col.getClass().getSimpleName() +" took " + delta + "ms"); */

        // Search
        start = System.nanoTime(); // clock snapshot before
        for(int j=0; j < i; j++ ) {
            int n = (int) (Math.random() * i);
            if (!col.contains(n))
                System.out.println("Not found???"+n);
        }

        stop = System.nanoTime(); // clock snapshot after
        delta[1] = (stop-start)/1e6; // convert nanoseconds to milliseconds

        /* System.out.println(col.size()+ ": Search to " +
            col.getClass().getSimpleName() +" took " + delta + "ms"); */

        // Remove
        start = System.nanoTime(); // clock snapshot before
        Iterator<Integer> iterator = col.iterator();
        while (iterator.hasNext()) {
            iterator.next();
            iterator.remove();
        }
        stop = System.nanoTime(); // clock snapshot after
        delta[2] = (stop-start)/1e6; // convert nanoseconds to milliseconds

        /* System.out.println(col.size() + ": Remove from "+
            col.getClass().getSimpleName() +" took " + delta + "ms"); */

        
        return delta;
    }
}