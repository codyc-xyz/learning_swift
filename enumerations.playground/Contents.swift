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
    break
case .dog:
    "This is a dog"
    break
case .rabbit:
    "This is a rabbit"
    break
}

// enums in swift can have associated values that are dynamically created at time of creation

enum Shortcut {
    case fileOrFolder(path: URL, name: String), wwwUrl(path: URL), song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(
    path: URL(string: "https://apple.com")!
)

switch wwwApple {
case let .fileOrFolder(path, name):
    path
    name
    break
case let .wwwUrl(path):
    path
    break
case let .song(artist, songName):
    artist
    songName
    break
}

// grab path from instance
if case let .wwwUrl(path) = wwwApple {
    path
}

// can also ignore values in enum cases

let withoutYou = Shortcut.song(artist: "Symphony X", songName: "Without You")

if case let .song(_, songName) = withoutYou {
    songName
}

enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    var manufacturer: String {
        switch self {
            case let .car(manufacturer, _),
                let .bike(manufacturer, _):
                return manufacturer
        }
    }

}

let car = Vehicle.car(manufacturer: "Toyota", model: "X")

let bike = Vehicle.bike(manufacturer: "HD", yearMade: 1986)


car.manufacturer
bike.manufacturer

// can also have enums with raw values

enum FamilyMember: String {
    case father = "Dad", mother = "Mom", brother = "Bro", sister = "Sis"
}

FamilyMember.father.rawValue

// CaseIterable allows you to iterate through all the enum cases

enum FavoriteEmoji: String, CaseIterable {
    case blush = "blush", rocket="rocket", fire="fire"
}

let emojiCases = FavoriteEmoji.allCases.map(\.rawValue)

if let blush = FavoriteEmoji(rawValue: "blush") {
    "Found blush"
    blush
} else {
    "This emoji does not exist"
}

// mutating enum
enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}

var myHeight = Height.medium
myHeight.makeLong()
myHeight

// indirect/recursive enums - an enum that refers to itself

indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freeHand(IntOperation)
    
    func calculateResult(
        of operation: IntOperation? = nil
    ) -> Int {
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .subtract(lhs, rhs):
            return lhs + rhs
        case let .freeHand(operation):
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freeHand(.add(2, 4))
freeHand.calculateResult()
