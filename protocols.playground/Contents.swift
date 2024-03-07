import Foundation

// Protocols are a special kind of object -> similar to interfaces/mixins
// You create a set of rules that objects which conform to a protocol have to follow

protocol canBreathe {
    func breathe()
}

// structs allow inheritance from protocols -> if inheritance, any protocol func has to be implemented by struct or raise error
struct Animal: canBreathe {
    func breathe() {
        "Animal breathing..."
    }
}

struct Person: canBreathe {
    func breathe() {
        "Person breathing..."
    }
}

let dog = Animal()
dog.breathe()
let person = Person()
person.breathe()

// cannot create function body within protocol itself
protocol canJump {
    func jump()
}

// use extensions to add implementation of function
extension canJump {
    func jump() {
        "Jumping..."
    }
}

// protocols cannot be instantiated, need to make e.g. a struct
struct Cat: canJump {
    // cat will have jump function by default, but can change it if you want e.g.
//    func jump() {
//       -> your altered jump function
//    }
}

let whiskers = Cat()
whiskers.jump()

protocol hasName {
    // this protocol is saying any object that conforms to hasName, has to have a name var that at least has a getter
    // a getter is just saying the name variable is declared in the inherited object
    var name: String { get }
    // set means it has to be a var because the protocol is saying this variable can be set rather than just get (let -> non-alterable)
    var age: Int { get set }
}

extension hasName {
    func describeMe() {
        // extension can access name and age vars in protocol as they are mandatory
        "Your name is \(name) and you are \(age) years old"
    }
    mutating func increaseAge() {
        self.age += 1
    }
}

struct Dog: hasName {
    let name: String
    var age: Int
}

var woof = Dog(name: "Spot", age: 5)
// because age has a set, you can increase age, because name is just get, you could possible change if the Dog struct was a var, but since it is let, cannot
woof.age += 1
woof.describeMe()


protocol Vehicle {
    var speed: Int {get set}
}

extension Vehicle {
    mutating func increaseSpeed(by value: Int) {
        self.speed += value
    }
}

struct Bike: Vehicle {
    var speed: Int
    init() {
        self.speed = 0
    }
}

var bike = Bike()
bike.speed
bike.increaseSpeed(by: 20)
