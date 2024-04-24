package aula09.Ex1;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;
import java.util.Collections;
import aula06.Pessoa;
import aula07.Ex2.Date;
import aula07.Ex2.DateND;

public class ALDemo {
    public static void main(String[] args) {
        ArrayList<Integer> c1 = new ArrayList<>();
        for (int i = 10; i <= 100; i+=10)
            c1.add(i);

        System.out.println("Size: " + c1.size());
        for (int i = 0; i < c1.size(); i++)
            System.out.println("Elemento: " + c1.get(i));
            
        ArrayList<String> c2 = new ArrayList<>();
        c2.add("Vento");
        c2.add("Calor");
        c2.add("Frio");
        c2.add("Chuva");
        System.out.println("Contem 'Chuva'? " + c2.contains("Chuva"));
        System.out.println("Index de 'Frio': " + c2.indexOf("Frio"));
        c2.add("Calor");
        c2.add("Calor");
        System.out.println("Last Index de 'Calor': " + c2.lastIndexOf("Calor"));
        System.out.println("Trocar posição de 'Calor'[4] por 'Neve': " + c2.set(4, "Neve"));
        System.out.println(c2.subList(3, 5));

        System.out.println(c2);
        Collections.sort(c2);
        System.out.println(c2);
        c2.remove("Frio");
        c2.remove(0);
        System.out.println(c2);

        
        Set<Pessoa> c3 = new HashSet<>();

        c3.add(new Pessoa("Joana"));
        c3.add(new Pessoa("Ana"));
        c3.add(new Pessoa("Miguel"));
        c3.add(new Pessoa("Pedro"));
        c3.add(new Pessoa("Maria"));

        System.out.println(c3);
        c3.add(new Pessoa("Maria"));
        System.out.println(c3);

        Set<Date> c4 = new TreeSet<>();
        c4.add(new DateND());
        c4.add(new DateND());

        System.out.println(c4);
    }

}