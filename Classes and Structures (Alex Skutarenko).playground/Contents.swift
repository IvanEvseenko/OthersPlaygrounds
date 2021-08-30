import UIKit
///1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
struct Student {
    var firstName: String
    var secondName: String
    var year: Int
    var averageScore: Float
}

var ivan = Student(firstName: "Ivan", secondName: "Evseenko", year: 1991, averageScore: 5.0)
var anna = Student(firstName: "Anna", secondName: "Evseenko", year: 1993, averageScore: 4.9)
var denis = Student(firstName: "Denis", secondName: "Abramov", year: 1990, averageScore: 4.4)
var oleg = Student(firstName: "Oleg", secondName: "Evseenko", year: 2000, averageScore: 4.7)

var students = [ivan, anna, denis, oleg]

//2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.

func printStudents(_ array: [Student]) {
    var index = 1
    for student in array {
        print("\(index). name: \(student.firstName), surname: \(student.secondName), year of birth: \(student.year), average score: \(student.averageScore)")
        index += 1
    }
}

printStudents(students)
print("++++++++++++++++++++++++++++++++++++++++++++++++")
//3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
let sortedStudents = students.sorted() {$0.averageScore > $1.averageScore}
sortedStudents
printStudents(sortedStudents)

//4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.

let sortedStudents1 = students.sorted { (a, b) -> Bool in
    
    if a.secondName < b.secondName {
        return true
    } else if a.secondName == b.secondName {
        return a.firstName < b.firstName
    }
    return false
   
}
print("++++++++++++++")
printStudents(sortedStudents1)

//5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
var newArray = students
students
newArray[0] = .init(firstName: "Vitaliy", secondName: "Volkov", year: 2000, averageScore: 5.0)
newArray[1] = .init(firstName: "John", secondName: "Haveall", year: 1991, averageScore: 5.0)
newArray[2] = .init(firstName: "Kate", secondName: "McDonald", year: 1995, averageScore: 4.7)
newArray[3] = .init(firstName: "July", secondName: "Evseenko", year: 1993, averageScore: 4.9)

print("#5   #5    #5    #5    #5")
printStudents(students)
print("++++++++++++++")
printStudents(newArray)


//6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?
class StudentClass {
    var firstName: String
    var secondName: String
    var year: Int
    var averageScore: Float
    
    init(firstName: String, secondName: String, year: Int, averageScore: Float) {
        self.firstName = firstName
        self.secondName = secondName
        self.year = year
        self.averageScore = averageScore
    }
}

let stud1 = StudentClass(firstName: "Diana", secondName: "Evseenko", year: 2012, averageScore: 5.0)
let stud2 = StudentClass(firstName: "Ruslan", secondName: "Evseenko", year: 2014, averageScore: 5.0)
let stud3 = StudentClass(firstName: "Alyona", secondName: "Evseenko", year: 1983, averageScore: 4.8)
let stud4 = StudentClass(firstName: "Sergey jr.", secondName: "Evseenko", year: 1984, averageScore: 4.7)

var evseenko = [stud1, stud2, stud3, stud4]
print("#6  #6  #6  #6  #6")
var evseenko1 = evseenko

evseenko1[0].firstName = "Ivan"
evseenko1[1].firstName = "Svetlana"
evseenko1[2].firstName = "Sergey grand"
evseenko1[3].firstName = "Anna"

func printStudentsClass(_ array: [StudentClass]) {
    var index = 1
    for student in array {
        print("\(index). name: \(student.firstName), surname: \(student.secondName), year of birth: \(student.year), average score: \(student.averageScore)")
        index += 1
    }
}

printStudentsClass(evseenko)
print("++++++++++++++")
printStudentsClass(evseenko1)
let z = 5
evseenko
evseenko1


