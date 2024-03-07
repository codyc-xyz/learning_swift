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


// convenience initializers vs designated initializers

// designated initializers goal is to ensure that all property values are set and the internal validity of the structure holds up
// convenience initializers add some logic to the constructor/initializer -> they designate the initialization to a designated initializer

class Tesla {
    let manufacturer: String = "Tesla"
    let model: String
    let year: Int
    //this is a designated initializer
    // designated initializers cannot designate their work to another designated initializer
    init() {
        self.model = "Y"
        self.year = 2023
    }
    init(
        model: String,
        year: Int
    ) {
        self.model = model
        self.year = year
    }
    // this convenience init designates the initializing to self.init (above)
    convenience init(model: String) {
        self.init(model: model, year: 2023)
    }
}

class TeslaModelY: Tesla {
    // override the parent class's init(), cannot call convenience init from inside a designated init
    override init() {
        super.init(model: "Y", year: 2023)
    }
}

let modelY = TeslaModelY()
modelY.model
modelY.year
modelY.manufacturer

let fooBar = Person2(age: 40)
fooBar.age

// classes are reference types -> by calling this function on the reference, you increase the age of the reference which is reflected in anything that points to that reference
func doSomething(with person: Person2) {
    person.increaseAge()
}

doSomething(with: fooBar)
fooBar.age

