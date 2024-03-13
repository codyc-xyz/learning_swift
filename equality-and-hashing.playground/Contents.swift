import Foundation

// equality in swift is provided via a protocol called Equatable
// any object conforming to this protocol has to be able to handle a static func '==' with two arguments, lhs and rhs with all items of the object (e.g. the properties have to be something that can be equated in swift)

struct Person: Equatable {
    let id: UUID
    let name: String
    let age: Int
}

let foo = Person(id: UUID(), name: "Foo", age: 22)
let bar = Person(id: foo.id, name: "Bar", age: 32)

// even though foo and bar have the same id, they are not considered equal due to the rest of the properties
if foo == bar {
    "Foo and Bar are equal"
} else {
    "Foo and Bar are not equal"
}

// you can define equality yourself in an extension if you want to change this default behavior of '=='
// e.g. in the below, whether two Person objects are equal is now determined by their id property
extension Person {
    static func == 
    (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

// now foo and bar are considered equal due to the above extension
if foo == bar {
    "Foo and Bar are equal"
} else {
    "Foo and Bar are not equal"
}
