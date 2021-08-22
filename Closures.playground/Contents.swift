import UIKit

let numbers = [1,4,3,5,6,3,4,7,10,33,20]


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
