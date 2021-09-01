import UIKit


// static var,    lazy var 

class Cat {
    static var maxAge = 20
    let name : String
    var maxWeight = 20
    let color : String
    static var count = 0
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
        Cat.count += 1
        
    }
}

let cat = Cat(name: "Pux", color: "White")

let cat2 = Cat(name: "Pushok", color: "black")
let cat3 = Cat(name: "Milker", color: "white/black")
Cat.count

struct Human {
    static let maxWeight = 200
    let name : String
    
    var weight : Int {
    didSet {
        if weight > Human.maxWeight {
            weight = oldValue
            print("Passed value is incorrect")
        }
        }
    }
    
    lazy var story = "This is a story of my life....."
    
}

var ivan = Human(name: "Ivan", weight: 78)
ivan.weight = 77
print(ivan)
ivan.weight = 201
print(ivan)
Human.maxWeight

ivan.story
