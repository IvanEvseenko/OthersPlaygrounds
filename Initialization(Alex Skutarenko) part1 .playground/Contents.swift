class Student1 {
    var name : String
    var lastName : String
    var fullName : String {
        return name + " " + lastName
    }
    init() {
        name = ""
        lastName = ""
    }
}

class Student2 {
    var name = ""
    var lastName = ""
}

class Student3 {
    var name : String
    var lastName : String
    
    init(name: String, lastname: String) {
        self.name = name
        self.lastName = lastname
    }
}

class Student4 {
    var name : String
    var lastName : String
    var middleName : String?
    
    init(name: String, lastname: String) {
        self.name = name
        self.lastName = lastname
    }
}

class Student5 {
    let maxAge : Int
    
    init() {
        maxAge = 100
    }
}


let s1 = Student1()
let s2 = Student2()
let s3 = Student3(name: "Ivan", lastname: "Evseenko")
let s4 = Student4(name: "Michael", lastname: "Jackson")
s4.middleName = "Joseph"
let s4MiddleName = s4.middleName
let s5 = Student5()
s5.maxAge

/////////////////////////////////////////////////////////
class Human {
    var weight : Int
    var age : Int
    
    init(weight: Int, age: Int) { //// disignated конструктор
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

let h1 = Human(weight: 75 , age: 25)
let h2 = Human()
h2.age
h2.weight



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
    convenience init(firstName: String) {
        self.init(firstNameConvInit: firstName, lastNameConvInit: "")
        
        self.age = 21
        
    }
}

let student1 = Student(firstName: "Ivan")
student1.name
student1.lastName
student1.age
student1.weight

let student2 = Student(firstNameConvInit: "Ivan", lastNameConvInit: "Evseenko")
student2.name
student2.lastName
student2.age
student2.weight





