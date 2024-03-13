import Foundation

// collections are a collection of items (e.g. numbers) -> also called arrays or dicts

// arrays

let numbers: [Int] = [1,2,3,4]
numbers.first
numbers.last
numbers.count
numbers.map(-)

// arrays can be mutated so long as they are 'vars'

var mutatingArray: [Int] = [1,2,3,4]
mutatingArray.append(5)
mutatingArray.insert(0, at: 0)

// can insert an entire array into a prexisting array
mutatingArray.insert(contentsOf: [6,7,8], at: 5)
