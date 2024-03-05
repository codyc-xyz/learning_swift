import Foundation

func noArgumentsAndNoReturnValue() {
    "Does Nothing"
}
noArgumentsAndNoReturnValue()

func plusTwo(x: Int) {
    let newValue = x + 2
}
plusTwo(x: 30)

func newPlusTwo(x: Int) -> Int {
    return x + 2
}

newPlusTwo(x: 30)

func customAdd(v1: Int, v2: Int) -> Int {
    return v1 + v2
}

let customAdded = customAdd(v1: 20, v2: 22)

// adding _ arg: removes necessity to name args in function call
func customMinus(_ v1: Int, _ v2: Int) -> Int {
    return v1 - v2
}

let customSubtracted = customMinus(24,22)

// discardable result removes need to assign function result to something
@discardableResult
func myCustomAdd(_ v1: Int, _ v2: Int) -> Int {
    return v1 + v2
}
