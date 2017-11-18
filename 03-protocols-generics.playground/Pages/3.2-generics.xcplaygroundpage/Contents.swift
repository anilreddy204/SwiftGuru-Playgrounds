/*:
 ## Session 3: Protocols and Generics
 ### 3.2 Generics
 */

//1. Generic Functions
//1.1 Non-Generic function
func inspect(_ item: Int) {
    print("The value of item is \(item)")
}
inspect(42)

//1.2 Generic function
func inspect<T>(_ item: T) { // Why not just Any
    print("The value of item is \(item)")
}
inspect("String")

//1.3 Generic Constraints
func square<T: Sequence>(_ value: T) -> [T.Element] where T.Element: Numeric {
    return value.map { $0 * $0 }
}
let ic: [Int] = [9,8,7,6]
square(ic)

//2. Generic Types
//2.1 Non Generic Type
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
var intStack = IntStack()
intStack.push(3)
intStack.push(1)
intStack.push(2)
intStack.pop()
intStack

//2.2 Generic Type
struct GenericTypeName<T> {}

//2.3 Covert IntStack to a generic version of stack and extend it to provide additional functionality like finding a peek and to check if a peak is at a specific value.

struct Stack<T> {
    var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var stringStack = Stack<String>()
stringStack.push("foo")
stringStack.push("bar")
stringStack.push("baz")
stringStack.pop()
stringStack
//

extension Stack {
    func peek() ->T? {
        return items.last
    }
  
}

extension Stack where T : Equatable {
    
    func isPeek(at element:T) -> Bool{
    return items.isEmpty ? false : peek() == element
    }
}

//stringStack.peek()
//stringStack.isPeek(at: "baz")
//stringStack.isPeek(at: "bar")


