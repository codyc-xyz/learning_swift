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
