package aula11.Ex2;

import java.util.ArrayList;

public class SimpleGradeCalculator implements IGradeCalculator {
    
    public SimpleGradeCalculator() {
        
    }

    @Override
    public double calculate(ArrayList<Double> grades) {
        Double media = 0d;

        for (Double grade : grades) {
            media += grade;
        }

        return media / grades.size();
    }
}
