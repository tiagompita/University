package aula11.Ex1;

import java.util.*;
import java.io.*;
import static java.lang.System.err;

public class PropostaSolucao {

    public static Map<String, Map<String, Integer>> readFile(Map<String, Map<String, Integer>> pairHist, String filename) {

        assert filename != null && !filename.isEmpty();

        Map<String, Map<String, Integer>> res = pairHist; // it can be null!

        Scanner input = null;

        try {

            input = new Scanner(new File(filename), "UTF-8").useDelimiter("[\\p{Punct}“”‘’ \t\n\r]+");

            if (res == null)

                res = new TreeMap<>();

            String last = null;

            while (input.hasNext()) {

                String word = input.next().toLowerCase();

                if (word.length() >= 3) {

                    if (last != null) {

                        Map<String, Integer> wHist;

                        int count = 0;

                        if (!res.containsKey(last)) {

                            wHist = new TreeMap<>();

                            res.put(last, wHist);

                        }

                        else {

                            wHist = res.get(last);

                            if (wHist.containsKey(word))

                                count = wHist.get(word);

                        }

                        wHist.put(word, count + 1);

                    }

                    last = word;

                }

            }

        }

        catch (IOException e) {

            err.println("ERROR: reading file \"" + filename + "\"!");

            System.exit(1);

        }

        finally {

            if (input != null)

                input.close();

        }

        return res;

    }
}
