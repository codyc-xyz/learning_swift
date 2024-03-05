import Foundation

// let cannot be reassigned
// var can be reassigned

let myName = "Foo"
let yourName = "Bar"

var names = [
myName,
yourName
]

names.append("New Name")
print(names)
