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

let houses: Set<House> = Set([house1, house2])

// you can overwrite how hashing is calculated to make it dependent on some property(s), but not other(s)
struct NumberedHouse: Hashable {
    let number: Int
    let numberOfBedrooms: Int
    
    func hash(into hasher: inout Hasher) {
        // only use number in determining hash
        hasher.combine(number)
    }
    
    // have to overwrite equality as well to complete custom hash equality determination
    static func == (
        lhs: Self, rhs: Self
    ) -> Bool {
        return lhs.number == rhs.number
    }
}

// the numberedHouse struct will now add items to sets depending solely on their number so e.g. two houses with same number will not be added even if rest of properties are different

let house3 = NumberedHouse(number: 123, numberOfBedrooms: 2)
let house4 = NumberedHouse(number: 123, numberOfBedrooms: 4)

let numberedHouses: Set<NumberedHouse> = Set([house3, house4])
print(numberedHouses)

// enums are by default hashable even without raw values

enum CarPart {
    case roof, tire, trunk
}

// the below will only be a set of the three unique parts
let uniqueParts: Set<CarPart> = Set([.roof, .roof, .tire, .trunk, .tire])
print(uniqueParts)

// because there are associated values in the below, those associated values also need to conform to the Hashable protocol
enum HouseType: Hashable {
    case bigHouse(NumberedHouse)
    case smallHouse(NumberedHouse)
}

let bigHouse1 = HouseType.bigHouse(NumberedHouse(number: 1, numberOfBedrooms: 5))
let bigHouse2 = HouseType.bigHouse(NumberedHouse(number: 1, numberOfBedrooms: 3))

bigHouse1.hashValue
bigHouse2.hashValue

let smallHouse1 = HouseType.smallHouse(NumberedHouse(number: 1, numberOfBedrooms: 1))
let smallHouse2 = HouseType.smallHouse(NumberedHouse(number: 1, numberOfBedrooms: 2))
smallHouse1.hashValue
smallHouse2.hashValue

// the below will only count 1 bigHouse and 1 smallHouse as it determines equality by the number as defined in NumberedHouse
let allHouses: Set<HouseType> = Set([bigHouse1, bigHouse2, smallHouse1, smallHouse2])
print(allHouses)
