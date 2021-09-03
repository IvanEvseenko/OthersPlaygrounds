//1. Создайте базовый класс артист с "именем", "фамилией" и методом "выступление". У каждого дочернего класса свой метод "выступление" (актер - играет, клоун - развлекает, танцор - танцует), включающее в себя представление участника, в каком жанре выступление и действие (можно просто вывод строки). Создайте дочерний класс "художник", который не хочет, чтобы его называли вы и всегда ставит другое имя, когда вы пытаетесь его назвать. Положить все экземпляры в один массив и пройдясь по нему вызвать у всех выступление.


class Artist {
    
    var name : String
    var lastName : String
    var fullName : String {
        return name + " " + lastName
    }
    
    func perfomance() -> String {
        return ""
    }
    
    
    init(name: String, lastName: String) {
        self.name = name
        self.lastName = lastName
    }
    
}

class Actor : Artist {
    override func perfomance() -> String {
        return "Hello! I'm \(self.name) \(self.lastName). I will give you a performance!"
    }
}

class Clown : Artist {
    override func perfomance() -> String {
        return "Hello! I'm \(self.name) \(self.lastName). I'm a clown and it's my performance!"
    }
}

class Dancer : Artist {
    override func perfomance() -> String {
        return "Hello! I'm \(self.name) \(self.lastName). I'm dancer. It's my dance!"
    }
    override var fullName: String {
        return name + " " + lastName + " are Dancer!"
    }
}

class Painter : Artist {
    override var name: String {
        set {
            super.name = "Maestro"
        }
        get {
            return super.name
        }
        
    }
    override func perfomance() -> String {
        return "Hello! I'm \(name) \(lastName). I'm painter!"
    }
    
}

let actor = Actor(name: "Vitaliy", lastName: "Volkov")
let clown = Clown(name: "Andrey", lastName: "Pupkin")
let dancer = Dancer(name: "Ruslan", lastName: "Evseenko")
let painter = Painter(name: "Dmitro", lastName: "Shirayev")



actor.perfomance()
clown.perfomance()
dancer.perfomance()
actor.fullName
dancer.fullName
painter.name
painter.name = "Ivan"
painter.name
painter.perfomance()

let artists = [actor, clown, dancer, painter]

for artist in artists {
    print(artist.perfomance())
}


//2. Базовый класс - "транспортное средство"; свойства - скорость, вместимость, стоимость одной перевозки (все computed properties). Несколько дочерних классов (самолет, корабль, вертолет, машина, поезд) с переопределенными свойствами (для каждого своя скорость вместимость и стоимость). Создать по одному объекту каждому дочернему классу. У всех есть метод, который что-то расчитывает (скорость, расстояние, количество пассажиров), конкретно сколько уйдет денег и времени, чтобы перевести определенное количество человек из пункта А в пункт В. При перевозке 100 и 1000 человек ответить на следующие вопросы:
//-Как быстро мы сможем это сделать и каким транспортом?
//-Стоимость всех перевозок и количество?
//-Какой транспорт быстрее справится и какой более выгодный?

class Vehicle {
    var name = ""
    var speed : Int {
        return 0
    }
    var costOfOneTrip: Int {
        return 0
    }
    var capacity : Int {
        return 0
    }
    var price : Int {
        return 0
    }
    func totalTimeAndCost(passengers: Int, distance: Int) -> (totalTime: Int, totalCost: Int, numbersOfTrip: Int) {
        let numbersOfTrips = passengers/capacity
        let timeOfTrip = distance/speed
        let totalTime = timeOfTrip * numbersOfTrips
        let totalCost =  numbersOfTrips * price
        return (totalTime, totalCost, numbersOfTrips)
    }
    init(name: String) {
        self.name = name
    }
}

class Airplaine : Vehicle {
    override var name: String {
        didSet {
            super.name = name
        }
    }
    override var speed: Int {
        return 1000
    }
    override var capacity: Int {
        return 200
    }
    override var price: Int {
        return 5000
    }
   
}

class Ship : Vehicle {
    override var speed: Int {
        return 50
    }
    override var capacity: Int {
        return 1000
    }
    override var price: Int {
        return 2000
    }
    
}

class Train : Vehicle {
    override var speed: Int {
        return 100
    }
    override var capacity: Int {
        return 400
    }
    override var price: Int {
        return 200
    }
}
let distance = 10000
let passengers = 2000

let airplaine = Airplaine(name: "Самолёт")
let ship = Ship(name: "Корабль")
let train = Train(name: "Поезд")


let vehicles = [airplaine, ship, train]

for vehicle in vehicles {
    var rezult = vehicle.totalTimeAndCost(passengers: passengers, distance: distance)
    print("Для транспортировки \(passengers) пассажиров, на расстояние \(distance) с помощью \(vehicle.name) - потребуется \(rezult.totalTime) часов, нужно совершить \(rezult.numbersOfTrip) отправки, общие затраты составят \(rezult.totalCost)")
}



func minTimeAndCost(arrayOfVehicles: [Vehicle], passengers: Int, distance: Int) {
    
    var minCost = arrayOfVehicles[0].totalTimeAndCost(passengers: passengers, distance: distance).totalCost
    var minTime = arrayOfVehicles[0].totalTimeAndCost(passengers: passengers, distance: distance).totalTime
    
    var bestCost = ""
    var bestTime = ""
    for vehicle in arrayOfVehicles {
        var rezult = vehicle.totalTimeAndCost(passengers: passengers, distance: distance)
        
        if minCost > rezult.totalCost {
            bestCost = vehicle.name
        }
        if minTime > rezult.totalTime {
            bestTime = vehicle.name
        }
    }
    print("Наиболее быстрый способ \(bestTime), наиболее экономный \(bestCost)")
}

minTimeAndCost(arrayOfVehicles: vehicles, passengers: passengers, distance: distance)
