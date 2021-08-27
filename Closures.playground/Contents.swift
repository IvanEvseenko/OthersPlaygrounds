import UIKit

let numbers = [11,4,3,5,6,3,50,7,10,33,20]


func nonOdd(i: Int) -> Bool {
    return i % 2 == 0
}

func odd(i: Int) -> Bool {
    return i % 2 != 0
}


func filter(array: [Int], f: (Int) -> Bool) -> [Int] {
    
    var filteredArray = [Int]()
    
    for i in array {
        if f(i) {
            filteredArray.append(i)
        }
    }
    return filteredArray
}

filter(array: numbers, f: nonOdd)
filter(array: numbers, f: odd)

///////////// Closure

filter(array: numbers, f: {(i: Int) -> Bool in
    return i % 3 == 0
})
let a = filter(array: numbers) {$0 % 4 == 0}
a


let operation: (Double) -> Double
operation = {-$0}
let result = operation(5)
result


func myFilter(array: [Int], simpleFunc: (Int) -> Int) -> [Int] {
    var outerArray: [Int] = []
    for element in array {
        let c = simpleFunc(element)
        outerArray.append(c)
    }
    return outerArray
}

let newArray = myFilter(array: numbers) {$0 * 2}
newArray
let newArray1 = myFilter(array: numbers) {$0 + 2}
newArray1


 ////////
func simpleFunc(simpleClosure: () -> ()) {
    simpleClosure()
    for i in 1...10 {
        print("Number \(i)")
    }
    simpleClosure()
}
simpleFunc {
    print("Hi! I'm closure")
}


func maxNumber(array: [Int], myClosure: (Int, Int) -> Bool) -> Int {
    var i = 0
    for number in array {
        if myClosure(number, i) {
            i = number
        }
    }
    print(i)
    return i
}
let n = maxNumber(array: numbers) {$0 > $1}
n

func filter(array: [Int], myClosure: (Int?, Int) -> Bool) -> Int {
    
    var number : Int?
    
    for value in array {
        if myClosure(number, value) {
            number = value
        }
    }
    return number!
}

let result1 = filter(array: numbers) {
    $0 == nil || $1 > $0!
}
result1

func filter1(array: [Int], myClosure: (Int, Int?) -> Bool) -> Int {
    
    var halper : Int?
    
    for digit in array {
        if myClosure(digit, halper) {
            halper = digit
        }
    }
    return halper!
}
let result2 = filter1(array: numbers) {
    if $1 == nil || $1! > $0 {
        return true
    }
    return false
}
result2



///////////// sorted method apple's guide
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward (_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

let sortedArray = names.sorted(by: backward)
let sortedArrayReversed = names.sorted() {$0 < $1}
sortedArrayReversed


//////////////////////////////////////  Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы

let stroka = "Hello! How are you? I'm 30 years old."
var myArray : [String] = []
for i in stroka {
    myArray.append(String(i))
}
myArray

func priority(_ string: String) -> Int {
    switch string.lowercased() {
    case "a", "e", "i", "o", "u","y": return 0
    case "a"..."z": return 1
    case "0"..."9": return 2
    default : return 3
    }
}

func compareForSorted(a: String, b: String) -> Bool {
    switch (priority(a),priority(b)) {
    case let(x,y) where x < y: return true
    case let(x,y) where x > y: return false
    default: return a.lowercased() <= b.lowercased()
}
}

    var sorted = myArray.sorted(by: compareForSorted)

