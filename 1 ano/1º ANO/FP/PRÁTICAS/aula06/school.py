def loadFile(fname, students):
    with open(fname, 'r') as f:
        f.readline()
        for line in f:
            line = line.rstrip()
            student = line.split(sep='\t')
            i = 0
            for at in student:
                if '.' in at:
                    student[i] = float(at)
                elif at.isdigit():
                    student[i] = int(at)
                i += 1
            students.append(student)

def notaFinal(student, notasFinal):
    notas = student[-3:len(student)]
    notasFinal.append(round(sum(notas) / 3, 2))

def printPauta(students, notasFinal):
    with open("finalGrades.csv", 'w') as f2:
        print("{:6s}                         {:4s}                       {:10s}".format("Número", "Nome", "Nota Final"), file=f2)
        students.sort()
        i = 0
        for student in students:
            print("{:6d}    {:45s}    {:6.2f}".format(student[0], student[1], notasFinal[i]), file=f2)
            i += 1
def main():
    students = []
    notasFinal = []
    loadFile("school1.csv", students)
    loadFile("school2.csv", students)
    loadFile("school3.csv", students)
    for s in students:
        notaFinal(s, notasFinal)
    printPauta(students, notasFinal)
    
if __name__ == "__main__":
    main()