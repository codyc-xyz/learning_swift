import Foundation

// optionals indicate a value that may or may not be present

func multiplyByTwo(_ value: Int? = nil) -> Int {
    if let value {
        return value * 2
    }
    else {
        return 0
    }
}
multiplyByTwo()

let age: Int? = nil

// the below two conditionals work the same
if age != nil {
    "Age is not nil"
} else {
    "Age is nil"
}

if let age {
    "Age is not nil"
} else {
    "Age is nil"
}

func checkAge() {
    // the below two are the same, but the latter is better syntax and can unwrap vals through guard let
//    if age == nil {
//        "Age is nil"
//    }
    // if age is necessary to the function working, use guard as below
    guard age != nil else {
        "Age is nil"
        return
    }
    // however, age is still considered an optional here due to lack of use of guard let
    "Age is not nil"
    
}

let age2: Int? = 0

func checkAge2() {
    guard let age2 else {
        return
    }
    // age2 is no longer optional here due to guard let
    let xxx = age2;
}

// just like you can switch on enumerations, you can switch on optionals

switch age {
    
case .none:
    "Age is nil"
case let .some(value):
    "Age is \(value)"
}

// the below two if statements have the same effect, but the latter is better syntax for optionals

if age2 == 0 {
    "Age2 is 0"
} else {
    "Age2 is not 0"
}

if age2 == .some(0) {
    "Age2 is 0"
} else {
    "Age2 is not 0"
}

// optional chaining
struct Person {
    let name: String
    let address: Address?
    struct Address {
        let firstLine: String?
    }
}

let foo: Person = Person(name: "Foo", address: nil)

if let fooFirstAddressLine = foo.address?.firstLine {
    fooFirstAddressLine
} else {
    "Foo has no first address Line"
}

let bar: Person? = Person(name: "Bar", address: Person.Address(firstLine: nil))

if bar?.name == "Bar", bar?.address?.firstLine == nil {
    "bar's first name is Bar, Bar does not have a first line address"
} else {
    "Either bar's name isn't bar, or bar has a first line address"
}

let baz: Person? = Person(name: "Baz", address: Person.Address(firstLine: "First Line"))

// switching on nested optional

switch baz?.address?.firstLine {
case .none:
    "Baz has no first line address"
    break
case let .some(value) where value.starts(with: "Baz"):
    "Baz's first line address starts with Baz"
case let .some(value):
    "Baz has a first line address that does not start with Baz"

}

func getFullName(
    firstName: String,
    lastName: String?
) -> String? {
    if let lastName {
        return "\(firstName) \(lastName)"
    } else {
        return nil
    }
}
