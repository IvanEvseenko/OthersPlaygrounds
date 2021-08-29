import UIKit
///1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
struct Student {
    var firstName: String
    var secondName: String
    var year: Int
    var averageScore: Float
}

var ivan = Student(firstName: "Ivan", secondName: "Evseenko", year: 1991, averageScore: 5.0)
var anna = Student(firstName: "Anna", secondName: "Ivanova", year: 1993, averageScore: 4.9)
var denis = Student(firstName: "Denis", secondName: "Petrov", year: 1990, averageScore: 4.4)
var oleg = Student(firstName: "Oleg", secondName: "Fedorov", year: 2000, averageScore: 4.7)

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
