class Student {
	
	private Person p;
	private int nmec;
	private int courseID;
	private double grade;

	public Student(Person p, int nmec, int courseID, double grade) {
		this.p = p;
		this.nmec = nmec;
		this.courseID = courseID;
		this.grade = grade;
	}

	public int getCourse() {
		return courseID;
	}

	public double getGrade() {
		return grade;
	}

	public int getAge() {
		return p.getAge();
	}

	public String toString() {
		return this.p + " student number " + nmec + ", course " + courseID + ", grade=" + grade;
	}

}