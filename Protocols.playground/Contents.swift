import UIKit


//////////////// Требование свойств

protocol FullyNamed {
    var fullName: String {get}
}


struct Person: FullyNamed {
    var fullName: String
    var age: Int
}

var person1 = Person(fullName: "John Applenko", age: 30)
person1.fullName
person1.fullName = "John Ivanov"
person1.fullName




///
class StarShip: FullyNamed {
    let name : String
    var prefix : String?
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " ":"") + name
    }
}

var ncc1701 = StarShip(name: "Enterprise", prefix: "USS")
ncc1701.fullName
var ncc2000 = StarShip(name: "Galaxy")
ncc2000.fullName


///Требование методов
protocol RandomNumberGenerator {
    func random() -> Double
}


class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}
let generator1 = LinearCongruentialGenerator()
print("Случайное число: \(generator1.random())")
print("Ещё одно случайное число: \(generator1.random())")


///Требования изменяющих методов
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off: self = .on
        case .on: self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
lightSwitch




///Требование инициализатора

protocol SomeProtocol {
    init(someParameter: Int)
}

class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        print("initialization")
    }
}



protocol SomeProtocol1 {
    init()
}
 
class SomeSuperClass {
    init() {
        // реализация инициализатора…
    }
}
 
class SomeSubClass: SomeSuperClass, SomeProtocol1 {
    // "required" от соответсвия протоколу SomeProtocol; "override" от суперкласса SomeSuperClass
    required override init() {
        // реализация инициализатора…
    }
}


///Протоколы как типы
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var dice1 = Dice(sides: 6, generator: generator1)
dice1.roll()
for _ in 1...5 {
    print("Выпало \(dice1.roll())")
}

var dice2 = Dice(sides: 9, generator: LinearCongruentialGenerator())

/////Добавление реализации протокола через расширение

protocol TextRepresentable {
    var textualDescription: String {get}
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "Игральная кость с \(sides) гранями"
    }
}
dice1.textualDescription


///Условное соответствие протоколу
var a = ["aaa","bb","ccccc"]
let test = a.map {$0.count}
test
let arrayOfDice = [dice1, dice2]

extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemAsText = arrayOfDice.map {$0.textualDescription}
        return "[" + itemAsText.joined(separator: ", ") + "]"
    }
}
arrayOfDice.textualDescription
