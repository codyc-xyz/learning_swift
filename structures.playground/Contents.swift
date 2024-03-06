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

let fooBar = Person2(firstName: "Foo", lastName: "Bar")
fooBar.fullName

// structs do not inherently allow mutation - all of the above is immutable

// mutable structure

struct Car {
    var currentSpeed: Int
    mutating func drive(speed: Int) {
        "Driving..."
        currentSpeed = speed
    }
}

// does not work if you instantiate instance with let, have to use var e.g.

var myCar = Car(currentSpeed: 10)
myCar.drive(speed: 20)
myCar.currentSpeed

// assigning an instance of a struct to another variable assigns the values, not the struct itself (copy)

let copy = myCar
myCar.drive(speed: 40)
copy.currentSpeed
myCar.currentSpeed

// structures cannot sub-class/inherit from other structures e.g. below does not work

struct LivingThing {
    init() {
        "I am a living thing"
    }
}

/* struct Animal: LivingThing {
 
 }
 */

// what if you want to have custom logic while copying over something to a variable - have to create logic yourself
struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    func copiedWith(currentSpeed: Int) -> Bike {
        Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
}

let bike1 = Bike(manufacturer: "Harley", currentSpeed: 20)

let bike2 = bike1.copiedWith(currentSpeed: 30)
