/*:
 ## Session 1: Functional Swift
 ### 1.5 Composition
 */

struct City {
    let name: String
    let country: String
    let population: Int
}

let delhi = City(name: "Delhi", country: "India", population: 4_000)
let gurgaon = City(name: "Gurgaon", country: "India", population: 2_000)
let chandigarh = City(name: "Chandigarh", country: "India", population: 7_000)
let noida = City(name: "Noida", country: "India", population: 10_000)

let cities = [delhi,gurgaon,chandigarh,noida]

let totalPopulation  = cities.reduce(0) {$0 + $1.population}
print(totalPopulation)


let sorted = cities.sorted(by: { $0.population > $1.population})
var sorted1 = sorted.map{$0.name}.reduce("") {"\($0)  \($1)"}
//var sorted2 =
print("sorted1 \(sorted1)")
//print("sorted2 \(sorted2)")

//1. Calculate the total population using reduce
//print(totalPopulation) //23000

//2. Chain operations to sort cities according to population and print string "Noida Chandigarh Delhi Gurgaon"
//print(sorted) //Noida Chandigarh Delhi Gurgaon

