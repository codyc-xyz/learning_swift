import Foundation

let myName = "Cody"
let myAge = 26
let yourName = "Foo"
let yourAge = 30

if myName == "Cody" {
    "Your name is \(myName)"
} else {
    "Your name is not \(myName)"
}

if myAge == 26 {
    "My age is \(myAge)"
}
else if myAge == 30 {
    "My age is 30"
}

if myName == "Cody" && myAge == 26 {
    "My name is \(myName) and my age is \(myAge)"
}
else if myAge == 26 {
    "My age is 26, but my name is not Cody"
}
else {
    "My age is not 26 and my name is not Cody"
}

if myName == "Cody" || myAge == 26 {
    "My name is Cody, my age is 26, or both."
}
