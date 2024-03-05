import Foundation

let myAge = 26
let yourAge = 30

if myAge > yourAge {
    "I am older"
}
else if yourAge > myAge {
    "You are older"
}
else {
    "We are the same age"
}

let myMothersAge = myAge + 30
let doubleMyAge = myAge * 2

// three different types of operators in swift
// 1. Unary Prefix (unary - one val)
let foo = !true
// 2. Unary Postfix
// Optional can contain either no val or a val
let name = Optional("Mike")
type(of: name)
// the unary Postfix operator went inside the optional and grabbed the val out
let unaryPostfix = name!
type(of: unaryPostfix)
// 3. Binary Infix (binary - 2 vals)
