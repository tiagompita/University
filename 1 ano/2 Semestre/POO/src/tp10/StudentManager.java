import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.InvalidPathException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class StudentManager {
	
	public static void main(String[] args) {
		List<Student> students = new ArrayList<>();

		try {
			Path path = Paths.get("student_list.csv");
			List<String> content = Files.readAllLines(path);
			content.remove(0);
			for (String l: content) {
				String[] data = l.split(",");
				Student s = new Student(new Person(data[1], 
					data[2]), Integer.parseInt(data[0]), 
					Integer.parseInt(data[3]), 
					Double.parseDouble(data[4]));
				students.add(s);
			}
		} catch (InvalidPathException e) {
			System.out.println("Could not open file.");
		} catch (IOException e) {
			System.out.println("Error while reading file.");
		}

		// filtrar
		for (Student s: students) {
			if (s.getGrade()>= 15) System.out.println(s);
		}

		// média idades
		int idadeTotal = 0;
		for (Student s: students) idadeTotal+=s.getAge();
		System.out.println(idadeTotal / students.size());


		// média por curso
		Map<Integer, List<Double>> grades = new HashMap<>();
		for (Student s: students) {
			if (!grades.containsKey(s.getCourse()))
				grades.put(s.getCourse(), new ArrayList<>());

			grades.get(s.getCourse()).add(s.getGrade());
		}

		for (int courseID: grades.keySet()) {
			double sum = 0.0;
			for (double g: grades.get(courseID)) sum+=g;
			double average = sum / grades.get(courseID).size();			

			System.out.printf("%d: %.2f\n", courseID , average);
		}


	}

}
