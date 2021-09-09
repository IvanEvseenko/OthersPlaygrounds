import UIKit

class Person {
    var name : String
    
    init(name: String){
        self.name = name
        print("\(name) инициализируется")
    }
    deinit {
        print("\(name) деинициализируется")
    }
}

var reference1 : Person?
var reference2 : Person?
var reference3 : Person?

reference1 = Person(name: "John Applenko")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil

reference3 = nil


//////////////////  Слабые (weak) ссылки

class Person1 {
    var name : String
    var apartament : Apartament1?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) деинициализирован")
    }
}

class Apartament1 {
    var unit : String
    weak var tenant: Person1?
    
    init(unit: String) {
        self.unit = unit
    }
    deinit {
        print("\(unit) деинициализирован")
    }
}

var person : Person1?
var apartament : Apartament1?

person = Person1(name: "Ivan")
apartament = Apartament1(unit: "234")

person!.apartament = apartament
apartament!.tenant = person

person = nil
apartament = nil

//////////////////////////////////    Бесхозные ссылки


class Customer {
    let name : String
    var card : CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) деинициализируется")
    }
}

class CreditCard {
    let number: Int64
    unowned let customer: Customer
    init(number: Int64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Карта \(number) деинициализируется")
    }
}

var john : Customer?
john = Customer(name: "John bank customer")
john!.card = CreditCard(number: 123124235234123, customer: john!)
//var card = CreditCard(number: 675675765, customer: john!)
john = nil


//////////////////////////////////////////////////////////     /Бесхозные опциональные ссылки

class Departament {
    let name : String
    var courses : [Course]
    
    init(name: String){
        self.name = name
        self.courses = []
    }
    
}


class Course {
    let name : String
    unowned let departament : Departament
    unowned var nextCourse : Course?
    
    init(name: String, departament: Departament) {
        self.name = name
        self.departament = departament
        self.nextCourse = nil
    }
    
}


var departament = Departament(name: "NIX")



var begginer = Course(name: "Begginer", departament: departament)
var intermadiate = Course(name: "Intermadiate", departament: departament)
var advanced = Course(name: "Advanced", departament: departament)

begginer.nextCourse = intermadiate
intermadiate.nextCourse = advanced

departament.courses = [begginer, intermadiate, advanced]


///////////////////////////   Бесхозные ссылки и неявно извлеченные опциональные свойства

class Housband1 {
    let name : String
    var wife: Wife1!
    
    init(name: String, wifeName: String) {
        self.name = name
        self.wife = Wife1(name: wifeName, housband: self)
    }
    
}
class Wife1 {
    let name: String
    unowned var housband: Housband1
    
    init(name: String, housband: Housband1) {
        self.name = name
        self.housband = housband
    }
}
let housband = Housband1(name: "Jack", wifeName: "Sara")
housband.name
housband.wife.name
housband.wife.housband.name



/////////////////////////////
class Wife {
    let name : String
    weak var housband : Housband?
    
    init(name: String) {
        self.name = name
        
    }
    
    deinit {
        print("Wife Деинициализирован")
    }
}

class Housband {
    let name: String
    var wife: Wife?
    
    init(name: String) {
        self.name = name
       
    }
    deinit {
        print("Housband Деинициализирован")
    }
}

var alina : Wife?
var ivan : Housband?

alina = Wife(name: "Alina")
ivan = Housband(name: "Ivan")



alina!.housband = ivan
ivan!.wife = alina

ivan = nil
alina = nil

//////////////////////// Циклы сильных ссылок в замыканиях
class HTMLElement {
    
    let name: String
    var text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in    /////////////Если захваченная ссылка никогда не будет nil, то она должна быть всегда захвачена как unowned ссылка, а не weak ссылка.
        if let text = self.text {
            return "<\(self.name)> \(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) деинициализируется")
    }
}



var heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hi Jack!")
print(paragraph!.asHTML())
paragraph = nil
