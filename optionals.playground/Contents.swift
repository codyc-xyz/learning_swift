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
