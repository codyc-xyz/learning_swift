import Foundation

// structures are a way to group data together
// they are value types - when you assign an instance of a structure to another variable, the data inside gets copied over. It is not the same reference

struct person {
    let name: String
    let age: Int
}

let foo = person(name: "Foo", age: 20)

foo.name
foo.age
