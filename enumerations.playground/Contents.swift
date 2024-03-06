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
