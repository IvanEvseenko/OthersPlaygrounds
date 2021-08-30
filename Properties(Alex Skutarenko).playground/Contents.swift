import UIKit
import Foundation

struct Student {
    var firstName: String {
        
        willSet(newFirstName) {
            //newValue.capitalized
            print("will set \(newFirstName) instead of \(firstName)")
        }
        didSet(oldFirstName) {
            print("did set \(firstName) instead of \(oldFirstName)")
            
            firstName = firstName.capitalized
        }
    }
}

var student = Student(firstName: "Ivan")

student.firstName

student.firstName = "Bob"

student.firstName = "sam"

student.firstName
