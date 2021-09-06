import UIKit

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

