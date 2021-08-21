import Foundation

let myWallet = [1, 2, 5, 1, 2, 10, 20, 20, 50, 100, 100]

func calculateMoney(_ wallet: [Int]) {
    var sum = 0
    for banknot in wallet {
        sum += banknot
    }
    print("In wallet $\(sum)")
}

calculateMoney(myWallet)
 

//// function with return
func calculateMoneyWithReturn(_ wallet: [Int]) -> Int {
    var sum = 0
    for banknot in wallet {
        sum += banknot
    }
    return sum
}
let walletHas = calculateMoneyWithReturn(myWallet)

////////////
func calculateBanknot(_ wallet: [Int], _ interstedBanknot: Int) -> (Int, Int) {
    
   var sumOfBanknot = 0
   var numbersOfBanknot = 0
    
    for banknot in wallet {
        if banknot == interstedBanknot {
            sumOfBanknot += banknot
            numbersOfBanknot += 1
        }
    }
    return (sumOfBanknot, numbersOfBanknot)
}
let (sumAndNumbersOfInterestBanknot) = calculateBanknot(myWallet, 20)

let (sumOfInterestedBanknot, numberOfInterestedBanknot) = calculateBanknot(myWallet, 100)
sumOfInterestedBanknot
numberOfInterestedBanknot

///Universal function. The function which can calculate total amount in wallet and only banknots which interested for us.

func universalCalculatingMoney(inWallet wallet: [Int], _ banknot: Int? = nil) -> (Int, Int) {
    var sum = 0
    var bankotsCount = 0
    
    if let value = banknot {
        for value in wallet {
            if value == banknot! {
            sum += value
            bankotsCount += 1
            }
        }
    } else {
        for value in wallet {
            sum += value
        }
    }
    return (sum, bankotsCount)
}
let a = universalCalculatingMoney(inWallet: myWallet)
let b = universalCalculatingMoney(inWallet: myWallet, 20)



/// Sequence as parameter
func calculate(inRange range: Int...) -> Int {
    var sum = 0
    for element in range {
        sum += element
    }
    return sum
}
calculate(inRange: 2,3,4,1,2,300,43,570,600,790)

/////////

func heart() -> String {
    return "❤️"
}
func men() -> String {
    return "👱‍♂️"
}
func woomen() -> String {
    return "👧"
}
print(men(),heart(),woomen())
print("\(men()) + \(woomen()) = \(heart())")


/////////////////////////////////////
func chess(letter: String, digit: Int) -> String {
    if letter == "a"||letter == "c"||letter=="e"||letter=="g" && digit==1||digit==3||digit==5||digit==7{
        return "black"
    } else {
        return "white"
    }
}

chess(letter: "e", digit: 5)
chess(letter: "b", digit: 6)
chess(letter: "g", digit: 4)

let myChess = chess(letter: "e", digit: 7)
print(myChess)

///////////////////////
let myArray = [1,2,3,4,5,6,7,8,9]
myArray.count

func backFlipArray(array: [Int]) -> [Int] {
    var newArray : [Int] = []
    for element in array {
        newArray.insert(element, at: 0)
    }
    
    return newArray
}
backFlipArray(array: myArray)

//////////////////////

var word = "Hello"

let g = word.replacingOccurrences(of: "e", with: "E")
g
word.replacingOccurrences(of: "H", with: "h")
word


