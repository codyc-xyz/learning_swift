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

// discardable result removes need to use function result to do something
@discardableResult
func myCustomAdd(_ v1: Int, _ v2: Int) -> Int {
    return v1 + v2
}

// functions can contain their own functions
// with is external value label
func doSomethingComplicated(with value: Int) -> Int {
    func mainLogic(value: Int) -> Int {
        return value + 2
    }
    return mainLogic(value: value + 3)
}

doSomethingComplicated(with: 30)

func getFullName(
    firstName: String = "Foo",
    lastName: String = "Bar"
) -> String {
    return "\(firstName) \(lastName)"
}

getFullName()
