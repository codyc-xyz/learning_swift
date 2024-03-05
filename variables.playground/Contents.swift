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

// class instances (e.g. NSMutable Array) differ from structures (let, var)
// the below is mutable even though it is instantiated with let
let oldArray = NSMutableArray(
    array: [
        "Foo",
        "Bar"
    ]
)
oldArray.add("Baz")
print(oldArray)
