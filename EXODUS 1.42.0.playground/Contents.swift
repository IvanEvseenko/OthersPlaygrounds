//1
class Music {
    let notes: [String]
    
    init(notes: [String]) {
        self.notes = notes
    }
    
    func prepared() -> String {
        return notes.joined(separator: " ")
    }
    
}

class Instrument {
    //2
    let brand: String
    //3
    init(brand: String) {
        //4
        self.brand = brand
    }
    func tune() -> String {
        fatalError("Implement this method \(brand)")
    }
    func play(_ music: Music) -> String {
        return music.prepared()
    }
}

var myArray1 = ["Producer: ", "Owner: ", "Idea: "]
var a = myArray1
var b = myArray1.joined(separator: "Ivan Evseenko, ")
print(b)
