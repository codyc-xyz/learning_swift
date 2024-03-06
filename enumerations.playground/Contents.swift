import Foundation

enum Animals {
    case cat, dog, rabbit
}

let cat = Animals.cat

if cat == Animals.cat {
    "This is a cat"
} else if cat == Animals.dog {
    "This is not a cat"
} else {
    "This is a rabbit"
}

switch cat {
case .cat:
    "This is a cat"
case .dog:
    "This is a dog"
case .rabbit:
    "This is a rabbit"
}
