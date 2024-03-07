import Foundation

// category of storage space in memory - like structures but not value types -> reference types -> allow mutability without prefixing things with "mutating" syntax

class Person {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    func increaseAge() {
        self.age += 1
    }
}

let foo = Person(name: "Foo", age: 22)
foo.increaseAge()
foo.age
