import UIKit
import Foundation
 

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
    
    deinit {
        print("Human deinitialized")
    }
    
}


enum Color : Int {
    case Black
    case White
    
    init?(value: Int) {
        switch value {
        case 0:
            self = .Black
        case 1:
            self = .White
        default:
            return nil
        }
    }
}

let color = Color(value: 1)
let a = color!.rawValue
color

//switch color {
//case .Black:
//    print("Hello I'm black")
//case .White:
//    print("Hello I'm white")
//default:
//    "Incorrect value"
//}

struct Size {
    var width: Int
    var height: Int
    
    init?(width: Int, height: Int) {
        self.width = width
        self.height = height
        if width < 0 || height < 0 {
            return nil
        }
    }
}
let size = Size(width: 3, height: 2)
let size1 = Size(width: -3, height: 2)
size?.width
size1?.width


class Friend : Human {
    var name: String!
    
    var skin : Color = { /////////////// инициализация через клоужер
        let random = Int(arc4random_uniform(2))
        return Color(value: random)!
    }()
    
    init?(name: String) {
        self.name = name
        super.init(weight: 0, age: 0)
        if name.isEmpty {
            return nil /// вернуть nil можно только после завершения 1-ой фазы инициализации всех пропертей
    }
}
   required init() {
        name = "My Friend"
        super.init(weight: 0, age: 0)
    }
    
    deinit {
        print("Friend deinitialized")
    }
}

let friend = Friend(name: "Ivan")
let friend2 = Friend(name: "")
friend?.skin
friend?.skin
let friend3 = Friend(name: "Max")
friend3?.skin

class BestFriend : Friend {
    
    override init?(name: String) {
        if name.isEmpty {
            super.init()
        } else {
            super.init(name: name)
            
        }
    }
    
    required init() {
        super.init()
        name = "My Best Friend"
    }
    
    deinit {
        print("Best friend deinitialized")
    }
    
}
let bestFriend = BestFriend(name: "")
bestFriend?.name
let bestFriend2 = BestFriend()
bestFriend2.name


struct Test {
    var bestfirend : BestFriend? = BestFriend(name: "")
}

var test : Test? = Test()
test!.bestfirend = nil

//var f5 = Friend(name: "")
