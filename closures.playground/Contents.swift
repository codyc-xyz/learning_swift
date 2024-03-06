import Foundation

// closures are in-line functions
// useful because you can pass them to another function

let add: (Int, Int) -> Int 
    = {
        (_ lhs: Int, _ rhs: Int) -> Int in
        return lhs + rhs
    }
add(20, 30)

func customAdd(
    _ lhs: Int,
    _ rhs: Int,
    using function: (Int, Int) -> Int
) -> Int {
    return function(lhs, rhs)
}

customAdd(22, 33, using: add)

let ages: [Int] = [22, 23, 30, 19]
ages.sorted(by: {(_ lhs: Int, _ rhs: Int) -> Bool in
        lhs < rhs
})

ages.sorted(by: <)
ages.sorted(by: >)
