import Foundation

// extensions add functionality to existing types -> extend existing types

extension Int {
    func plusTwo() -> Int {
        return self + 2
    }
}
 let two = 2
two.plusTwo()
two

struct Person {
    let firstName: String
    let lastName: String
}

// gives an additional option for a constructor, not possible if placed in Person struct
extension Person {
    init(fullName: String) {
        let components = fullName.components(separatedBy: " ")
        self.init(firstName: components.first ?? fullName, lastName: components.last ?? fullName)
    }
}

let person = Person(fullName: "Foo Bar")
person.firstName
person.lastName


protocol GoesVroom {
    var vroomValue: String { get }
    func goVroom() -> String
    
}

extension GoesVroom {
    func goVroom() -> String {
        return "\(self.vroomValue) goes Vroom"
    }
}

struct Car {
    let manufacturer: String
    let model: String
}

let modelX = Car(manufacturer: "Tesla", model: "X")

extension Car: GoesVroom {
    var vroomValue: String {
        "\(self.manufacturer) model \(self.model)"
    }
}
modelX.goVroom()
