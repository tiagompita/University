package aula12;

import java.io.*;
import java.util.*;

public class MovieProgram {
    
    private static final String file = "C:\\Universidade\\University\\1 ano\\2 Semestre\\POO\\src\\aula12\\movies.txt";
    private static HashSet<Movie> Movies = new HashSet<>();
    private static TreeMap<String, Integer> Genre = new TreeMap<>();

    public static void load(String file) {

        try {
            Scanner scan = new Scanner(new File(file), "UTF-8").useDelimiter("[\t\n]+");
            scan.nextLine(); //Skip info line
            
            while (scan.hasNext()) {
                String name = scan.next();
                Float score = Float.parseFloat(scan.next());
                String rating = scan.next();
                String genre = scan.next();
                Integer runningTime = Integer.parseInt(scan.next());

                Movies.add(new Movie(name, score, rating, genre, runningTime));
            }

            scan.close();
        } catch (FileNotFoundException e) {
            System.out.println("File not found.");
        }

    }

    public static void genre() {
        for (Movie movie : Movies) {
            Genre.put(movie.getGenre().toLowerCase(), Genre.getOrDefault(movie.getGenre().toLowerCase(), 0) + 1);
        }

        for (Map.Entry<String, Integer> entry : Genre.entrySet()) {
            System.out.println("Género: " + entry.getKey() + ", Quantidade de filmes: " + entry.getValue());
        }
    }
    
    public static void mySelection(String genre) {

        try {
            FileWriter mySelection = new FileWriter("myselection.txt");
            for (Movie movie : Movies) {
                if (movie.getScore() > 60 && movie.getGenre().equals(genre)) {
                    mySelection.write(movie.toString() + "\n");
                }
            }
            mySelection.close();
        } catch (IOException e) {
            System.out.println("An error occurred");
        }
    }
    public static void main(String[] args) {
        load(file);

        List<Movie> sortedMoviesByName = new ArrayList<>(Movies);
        Collections.sort(sortedMoviesByName);

        for (Movie movie : sortedMoviesByName) {
            System.out.println(movie);
        }

        System.out.println();

        List<Movie> sortedMoviesByScore = new ArrayList<>(Movies);
        Collections.sort(sortedMoviesByScore, Movie.ScoreComparator);

        for (Movie movie : sortedMoviesByScore) {
            System.out.println(movie);
        }

        System.out.println();

        List<Movie> sortedMoviesByRunTime = new ArrayList<>(Movies);
        Collections.sort(sortedMoviesByRunTime, Movie.RunningTimeComparator);

        for (Movie movie : sortedMoviesByRunTime) {
            System.out.println(movie);
        }

        genre();

        mySelection("suspense");
    }
}
