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

// if bar = foo, they point to the same thing in memory, this is what is meant by reference type
let bar = foo
bar.increaseAge()
foo.age
bar.age

// check if two references point to the same thing in memory with '==='

if foo === bar {
    "foo and bar point to the same thing in memory"
} else {
    "they don't point to the same thing in memory"
}

// classes, unlike structures, have inheritance

class Vehicle {
    func goVroom() {
        "Vroom Vroom"
    }
}

class Car: Vehicle {
    
}

let car = Car()
car.goVroom()

// classes allow private variables that can only be mutated internally
class Person2 {
    private(set) var age: Int
    init(age: Int) {
        self.age = age
    }
    func increaseAge() {
        self.age+=1
    }
}

let Baz = Person2(age: 30)
// this doesnt work -> Baz.age += 1
