import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

class Person {
	private String name;
	private LocalDate dob;

	public Person(String name, String dob) {
		this.name = name;
		this.dob = LocalDate.parse(dob);
	}

	public String toString() {
		return name + " (" + dob + ")";
	}

	public int getAge() {
		return (int)ChronoUnit.YEARS.between(LocalDate.now(), this.dob); 
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((dob == null) ? 0 : dob.hashCode());
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
		Person other = (Person) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (dob == null) {
			if (other.dob != null)
				return false;
		} else if (!dob.equals(other.dob))
			return false;
		return true;
	}

	
}