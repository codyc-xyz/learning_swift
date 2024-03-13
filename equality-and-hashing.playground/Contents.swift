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

// can also implement custom equality on enums
enum AnimalType: Equatable {
    case dog(breed: String)
    case cat(breed: String)
}

let dog = AnimalType.dog(breed: "Retriever")
let dog2 = AnimalType.dog(breed: "Retriever")

// swift equatable looks at the vals of dog and dog2 and determines they are equal because the vals are the same, even if the instance is different
if dog == dog2 {
    "dog and dog2 are identical"
} else {
    "dog and dog2 are not identical"
}

extension AnimalType {
    static func == (
        lhs: Self, rhs: Self
    ) -> Bool {
        switch (lhs, rhs) {
        case let (.dog(lhsBreed), .dog(rhsBreed)),
            let (.cat(lhsBreed), .cat(rhsBreed)):
            return lhsBreed == rhsBreed
        default:
            return false
        }
    }
}

struct Animal: Equatable {
    let name: String
    let type: AnimalType
    // overwrite custom '==' static func with equality determined by AnimalType
    static func == (
        lhs: Self, rhs: Self) -> Bool {
            return lhs.type == rhs.type
        }
}

let cat1 = Animal(name: "Bob", type: AnimalType.cat(breed: "Pom"))
let cat2 = Animal(name: "Rob", type: AnimalType.cat(breed: "Pom"))

if cat1 == cat2 {
    "cat1 and cat2 are the same type of animal"
} else {
    "cat1 and cat2 are not the same type of animal"
}


// hashable also looks at all properties of a structure/class

struct House: Hashable {
    let number: Int
    let numberOfBedrooms: Int
}

let house1 = House(number: 123, numberOfBedrooms: 2)
let house2 = House(number: 123, numberOfBedrooms: 2)

// because house1 and house2 have the exact same properties, they have the same hash value below. If you were to change one property, the hash value would become different
house1.hashValue
house2.hashValue
