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
