import Foundation

// in the below, you cannot add firstName and lastName together because they are both optional values, no built-in default to add optionals

let firstName: String? = "Foo"
let lastName: String? = "Bar"

// this does not work
// let fullName = firstName + lastName

// have to implement it custom as below
func + (
    lhs: String?, rhs: String?) -> String? {
        switch (lhs, rhs) {
        case (.none, .none):
            return ""
        case let (.some(val), .none):
            return val
        case let (.none, .some(val)):
            return val
        case let (.some(val1), .some(val2)):
            return "\(val1) \(val2)"
        }
    }

// now the below works
let fullName = firstName + lastName

let lowercaseName = "foo bar"
// the below '^' will not work until we custom implement the prefix unary operator
// let uppercaseName = ^lowercaseName

prefix operator ^
prefix func ^ (
    value: String
) -> String {
    return value.uppercased()
}

// now the below works
let uppercaseName = ^lowercaseName

// the below will not work until we implement the custom postfix unary operator
// let withStars = lowercaseName*

postfix operator *
postfix func * (
    value: String
) -> String {
    return "*** \(value) ***"
}

// now the below works
let withStars = lowercaseName*

// operators can also work with values of different types

struct Person {
    let name: String
}

struct Family {
    var members: [Person]
}

let mom = Person(name: "Mom")
let dad = Person(name: "Dad")
let son = Person(name: "Son")
let daughter1 = Person(name: "Daughter1")
let daughter2 = Person(name: "Daughter2")

// the below currently does not work because there is no defined operation for '+' between Person objects
// let family = dad + mom

func + (
    lhs: Person,
    rhs: Person
) -> Family {
    return Family(members: [lhs, rhs])
}

// now the below works
let family = dad + mom

// the below will not work because one side is a Family object and one side is a Person object
// let familyWithSon = family + son

func + (
    lhs: Family,
    rhs: Person
) -> Family {
    var newFamily = lhs
    newFamily.members.append(rhs)
    return newFamily
}

// now the below works
let familyWithSon = family + son

// the below will not work because there is no behavior for '+' a family and an array of persons
// let familyWithDaughters = familyWithSon + [daughter1, daughter2]

func + (
    lhs: Family,
    rhs: [Person]
) -> Family {
    var newFamily = lhs
    for p in rhs {
        newFamily.members.append(p)
    }
    return newFamily
}

let familyWithDaughters = familyWithSon + [daughter1, daughter2]
