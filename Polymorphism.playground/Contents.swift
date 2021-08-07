import UIKit

class Electronics {
    
    var color : String
    
    init(color: String) {
        self.color = color
    }
    func turnOn() -> String {
        return "Hello I'm elecronics appliance of \(color) color"
    }
}


class TV : Electronics {
    var diagonal: Int
    
    init (color: String, diagonal: Int) {
        self.diagonal = diagonal
        super.init(color: color)
    }
    override func turnOn() -> String {
        return "Hello i'm a TV of \(color) color"
    }
}



class WashinMachine : Electronics {
    var loadWeight: Int
    
    init (color: String, loadWeight: Int) {
        self.loadWeight = loadWeight
        super.init(color: color)
    }
    override func turnOn() -> String {
        return "Hello I'm a washing machine of \(color) color"
    }
}

let myBlender = Electronics(color: "white")
let myTV = TV(color: "black", diagonal: 32)
let myWashingMachine = WashinMachine(color: "white", loadWeight: 5)

let myElectronics: [Electronics] = [myBlender, myTV, myWashingMachine]

for electronicUnit in myElectronics {
    print(electronicUnit.turnOn())
}


