/*:
 ## Session 3: Protocols and Generics
 ### 3.3 Protocols with Associated Type
 */

//5.1 Create a stackable protocol that has array of items as a property requirement and has mutating method requirements to push and pop an element

protocol Stackable {
    associatedtype Element
    mutating func push(_ item: Element)
    mutating func pop() -> Element?
}

//5.2 Create a generic struct Stack and adopt the Stackable protocol
struct Stack<Element> : Stackable {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element? {
        return items.removeLast()
    }
}

var intStack = Stack<Int>()
intStack.push(3)
intStack.push(2)
intStack.push(1)
intStack.push(0)
intStack.pop()

//5.3 Extending Existing Types
//5.3.1 Array

extension Array : Stackable {
    typealias Item = Element
    mutating func push(_ item: Element) {
        self.append(item)
    }
    mutating func pop() -> Element? {
        return self.removeLast()
    }
}

var arrayStack = Array<Int>()
arrayStack.push(3)
arrayStack.push(2)
arrayStack.push(1)
arrayStack.push(0)
arrayStack.pop()

//5.3.2 LinkedList
extension LinkedList : Stackable {
    typealias Item = Element
    mutating func push(_ item: Element) {
        let node = LinkedListNode(value: item)
        let current = head
        head = node
        node.next = current
    }
    mutating func pop() -> Element? {
        let current = head
        head = head?.next
        return current?.value
    }
}

var llStack = LinkedList<String>()
llStack.push("foooo")
llStack.push("bazz")
llStack.push("bar")
llStack.push("buzzzz")
llStack.pop()

llStack.count


//extension Stackable where Self: Collection,
//Self.Element = Item {
//
//}

//5.4 Extend Stackable to provide additional functionality
//5.4.1 Find the peek
//arrayStack.peek() //3
//llStack.peek() //bar

//5.4.2 Check if isPeak at a given element
//arrayStack.isPeek(at: 3) //true
//arrayStack.isPeek(at: 1) //false
//llStack.isPeek(at: "bar") //true

//5.4.2 Find the largest item
//arrayStack.largest() //3
//llStack.largest() //foooo
