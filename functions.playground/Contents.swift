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
