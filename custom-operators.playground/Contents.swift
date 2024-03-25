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