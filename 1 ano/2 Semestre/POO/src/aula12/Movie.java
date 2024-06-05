package aula12;

import java.util.Comparator;

public class Movie implements Comparable<Movie>{
    private String name;
    private float score;
    private String rating;
    private String genre;
    private int runningTime;

    public Movie(String name, float score, String rating, String genre, int runningTime) {
        this.name = name;
        this.score = score;
        this.rating = rating;
        this.genre = genre;
        this.runningTime = runningTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getRunningTime() {
        return runningTime;
    }

    public void setRunningTime(int runningTime) {
        this.runningTime = runningTime;
    }

    @Override
    public int compareTo(Movie o) {
        return this.name.compareTo(o.name);
    }

    // Comparator for sorting movies by score (Descending)
    public static Comparator<Movie> ScoreComparator = new Comparator<Movie>() {
        @Override
        public int compare(Movie m1, Movie m2) {
            return Float.compare(m2.getScore(), m1.getScore()); //trocar m1 por m2 para inverter a ordem
        }
    };

    // Comparator for sorting movies by running time
    public static Comparator<Movie> RunningTimeComparator = new Comparator<Movie>() {
        @Override
        public int compare(Movie m1, Movie m2) {
            return Integer.compare(m1.getRunningTime(), m2.getRunningTime());
        }
    };

    @Override
    public String toString() {
        return "Movie =>\tName: " + name + " // Score: " + score + " // Rating: " + rating + " // Genre: " + genre + " // Running Time: "
                + runningTime;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Movie other = (Movie) obj;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        return true;
    }

    
}
