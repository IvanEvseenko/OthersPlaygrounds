
var numbers = [3,1,12,2,7,11,9]

for number in numbers {
    print(":) \(number)")
}

print(numbers)

for i in 0..<numbers.count {
    let index = (numbers.count - 1) - i
    
    for j in 0..<index {
        var helper: Int
        
        if j == numbers.count-1 {break}
        
        if numbers[j] > numbers[j+1]  {
            helper = numbers[j]
            numbers[j] = numbers[j+1]
            numbers[j+1] = helper
        }
    }
}


/*
for i in 0..<numbers.count {
    var helper: Int
    if i == numbers.count-1 {break}
    if numbers[i] > numbers[i+1]  {
        helper = numbers[i]
        numbers[i] = numbers[i+1]
        numbers[i+1] = helper
    }
}*/
numbers
print(numbers)
