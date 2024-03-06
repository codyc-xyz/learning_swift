import Foundation

// structures are a way to group data together
// they are value types - when you assign an instance of a structure to another variable, the data inside gets copied over. It is not the same reference
// constructors are implicitly created for structures in swift -> many devs prefer structs over classes

struct Person {
    let name: String
    let age: Int
}

let foo = Person(name: "Foo", age: 20)

foo.name
foo.age

// init properties (can also assign directly)
struct CommodoreComputer {
    let name: String
    let manufacturer: String
    init (name: String) {
        self.name = name
        self.manufacturer = "Commodore"
    }
}

let c64 = CommodoreComputer(name: "c64")

// computed properties

struct Person2 {
    let firstName: String
    let lastName: String
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
