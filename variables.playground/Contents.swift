import Foundation

// let cannot be reassigned
// var can be reassigned

let myName = "Foo"
let yourName = "Bar"

var names = [
myName,
yourName
]

// a copy made with let is mutable, will not impact old array as it is a structure
var newNames = names
newNames.append("Baz")

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

// altering a copy of a class instance will alter both the new and original class
var newArray = oldArray
newArray.add("Bez")
print(newArray, oldArray)
