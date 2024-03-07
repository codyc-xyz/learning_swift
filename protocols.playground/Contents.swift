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

