import Foundation

// generics are used to avoid writing the same functions/code multiple times

func perform<N: Numeric>(_ op: (N, N) -> N,
             on lhs: N, and rhs: N
) -> N {
    return op(lhs, rhs)
}

perform(+, on: 10, and: 20)

func performSignatureEnd<N>(_ op: (N, N) -> N,
             on lhs: N, and rhs: N
) -> N where N: Numeric {
    return op(lhs, rhs)
}

performSignatureEnd(+, on: 10, and: 20)

// classes and structs can conform to multiple protocols -> you can use this to create generics that are conformant to multiple types

protocol canJump {
    func jump()
}

protocol canRun {
    func run()
}

struct Person: canJump, canRun {
    func jump() {
        "Jumping"
    }
    func run() {
        "Running"
    }
}

func jumpAndRun<T: canJump & canRun>(val: T) {
    val.jump()
    val.run()
}

let person = Person()
jumpAndRun(val: person)

// extending the data type -> array of strings
extension [String] {
    func longestString() -> String? {
        self.sorted { (lhs: String, rhs: String) -> Bool in
            lhs.count > rhs.count
        }.first
    }
}

let stringArr: [String] = ["a", "aa", "ah8d7ewhd", "b"]
stringArr.longestString()
