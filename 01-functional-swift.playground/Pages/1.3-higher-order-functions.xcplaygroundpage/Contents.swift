/*:
 ## Session 1: Functional Swift
 ### 1.4 Higher-order Functions
 */

//1. Transform [1,2,3,4,5] into Squares
//1.1 Using For Loop
var transformedArray = [Int]()
for number in (1...5) {
    transformedArray.append(number * number)
}
transformedArray

//1.2 Using Map

let transformed = (1...5).map {$0 * $0}
print(transformed)

let list = (1...5).map { (num) -> Int in
    return num * num
}
print(list)

//2 Convert [[1,2,3],[4,5,6],[7,8,9]] to [1,2,3,4,5,6,7,8,9]
//2.1 Using For Loop
var flatMappedArray = [Int]()
for array in [[1,2,3],[4,5,6],[7,8,9]] {
    for number in array {
        flatMappedArray.append(number)
    }
}
//flatMappedArray
let i : Int? = nil
let j = i.map { "Your Num :\($0)"} ?? "Unknown"

//2.2 Using flatMap

let flatmap = [[1,2,3],[4,5,6],[7,8,9]].flatMap{ $0 }
print(flatmap)

let flattend = ["non nil", nil,"done"].flatMap{ $0 }
print(flattend)

let filtered = (1...10).filter{ $0 % 2 == 0}
print(filtered)

let reduce = (1...3).reduce(0, +) // it will rduce using method
print(reduce)

let reduceminus = (1...3).reduce(0, -) // it will rduce using method
print(reduceminus)

//3. Filter even numbers from [1,2,3,4,5]
//3.1 Using For Loop
var filteredArray = [Int]()
for number in (1...5) {
    if number % 2 == 0 {
        filteredArray.append(number)
    }
}
filteredArray

//3.2 Using Filter

//4. Calculate the sum of [1,2,3,4,5]
//5.1 Using For Loop
var reducedNumber = 0
for number in (1...5) {
    reducedNumber += number
}
reducedNumber

//4.2 Using Reduce

