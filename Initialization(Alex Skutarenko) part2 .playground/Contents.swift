import UIKit

class Human {
    var weight : Int
    var age : Int
    
    init(weight: Int, age: Int) { //// designated конструктор
        self.weight = weight
        self.age = age
    }
    
    convenience init(age: Int) { /// convenience конструктор
        self.init(weight: 0, age: age)
    }
    
    convenience init(weight: Int){  /// convenience конструктор
        self.init(weight: weight, age: 0)
    }
    convenience init() {
        self.init(weight: 0)
    }

    func test() {
        
    }
}

class Student : Human {
    var name : String
    var lastName : String
    
    init(firstNameConvInit: String, lastNameConvInit: String) {
        /// сначала должны заполняться проперти дочернего класса, потом родительского
        self.name = firstNameConvInit
        self.lastName = lastNameConvInit
        super.init(weight: 0, age: 0) ////// disignated инициализатор  может  вызывать только disignated инициализатор
        
        self.age = 18
        
    }
    
//    override init(weight: Int, age: Int) {
//        self.name = "Student"
//        self.lastName = "Studentov"
//        super.init(weight: weight, age: age)
//
//    }
    
    convenience init(firstName: String) {
        self.init(firstNameConvInit: firstName, lastNameConvInit: "!!!")
        
        //self.age = 21
        
    }
}



class Doctor : Student {
    
    var fieldOfStudy : String
    
    init(fieldOfStudy: String) {
        self.fieldOfStudy = fieldOfStudy
        super.init(firstNameConvInit: "Doctor", lastNameConvInit: "Philipenko")
    }
    
    override init(firstNameConvInit: String, lastNameConvInit: String) { //// Чтобы получить доступ к convenience инициализаторам родительского класса, нужно переопределить designated инициализатор родительского класса(если designated несколько у родительского, то нужно переопределять их все, чтобы получить доступ к convenience инициализаторам родительского). Или родительский класс должен не иметь своих designeted   инициализаторов
        fieldOfStudy = "Stomatolog"
        super.init(firstNameConvInit: firstNameConvInit, lastNameConvInit: lastNameConvInit)
        age = 30
    }
}

let d1 = Doctor(fieldOfStudy: "Health")
let d2 = Doctor(firstName: "Docrorrr")
d2.fieldOfStudy
d1.fieldOfStudy
d2.age
d2.lastName
//let d3 = Doctor(




d2.weight
