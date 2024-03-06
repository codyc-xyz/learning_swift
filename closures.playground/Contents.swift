import Foundation

// closures are in-line functions

let add: (Int, Int) -> Int 
    = {
        (_ lhs: Int, _ rhs: Int) -> Int in
        return lhs + rhs
    }
