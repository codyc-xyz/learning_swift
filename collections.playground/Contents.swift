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
mutatingArray.insert(contentsOf: [6,7,8], at: 6)

for value in mutatingArray {
    // print(value)
}
// can enumerate through items in an array based on pattern matching with 'where' clause

for value in mutatingArray where value % 2 == 0 {
    // print(value)
}

let timesTwo = mutatingArray.map {
    (val: Int) -> Int in
    val * 2
}

let evens = mutatingArray.filter {
    (val: Int) -> Bool in
    val % 2 == 0
}

// compact map is a combination of map and filter -> returns optional string
let compactEvens = mutatingArray.compactMap {
    (val: Int) -> String? in
    val % 2 == 0 ? String(val) : nil
}

// arrays can contain nil
let numbers2: [Int?] = [nil, 1, 2, 3, 4]

// note that filter does not allow you to change the data type from optional
let notNil = numbers2.filter {
    (num: Int?) -> Bool in
    num != nil
}

// to change the data away from optional use compactMap
let arrayOfIntsNotOptional = numbers2.compactMap {
    (num: Int?) -> Int? in
    num
}

// arrays can include different kinds of data-types e.g. ints and strings etc.

let multiArr: [Any] = [0, "1", 2, "3"]

// sets are a special collection that only contain unique vals based on hash values and equality

let uniqueNums: Set<Int> = Set([1,2,3,4,4])
uniqueNums.count
uniqueNums.map(-)

// sets can contain nils and do not guarantee any consistent ordering

let myNums: Set<Int?> = Set([1,1,2,3,4,4,nil,5])

let numsNotNil: [Int] = myNums.compactMap {
    (num: Int?) -> Int? in
    num
}
// print(numsNotNil)

// sets can also contain any type of val via 'AnyHashable' type

let heterogeneousSet: Set<AnyHashable> = [1,2,3,"Vandad"]

let intsInSet: Set<Int> = Set(heterogeneousSet.compactMap {
    (val: Any) -> Int? in
    // checks if val is an int and if so returns it
    val as? Int
})

let stringsInSet: Set<String> = Set(heterogeneousSet.compactMap {
    (val: Any) -> String? in
    val as? String
})
// print(stringsInSet)

// allowing a Person instance to be included in a set -> Use Hashable protocol
// note: Hashable without custom logic will only check to see if the entire item is identical or not. E.g. a duplicate ID will not matter
struct Person: Hashable {
    let id: UUID
    let name: String
    let age: Int
}

let fooID = UUID()
let foo = Person(id: fooID, name: "Foo", age: 22)

let barID = UUID()
let bar = Person(id: barID, name: "Bar", age: 32)

let people: Set<Person> = Set([foo, bar])


// to make a set remove duplicates based off a single val -> eg UUID use func hash which is included in the Hashable protocol
struct Person2: Hashable {
    let id: UUID
    let name: String
    let age: Int
    // now only id is hashed, so if two Persons have the same UUID, only one will be included in the set
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    // necessary to add a custom equality func to define how the hashing determines equality (e.g. make it only count id)
    // after implementing the above and below, two items with the same id will not both be included in a set of Person2s
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.id == rhs.id
    }
}


// dicts in swift
// heterogenous dict
let userInfo: [String:Any] =
    [
        "Name":"Foo",
        "Age": 20,
        "Address": [
            "line1":"Address Line 1",
            "postcode":"12345"
        ]
    ]

//can grab val out of dict via subscript
userInfo["Address"]

// extracting all keys/all vals from dict
let keys = userInfo.keys
let vals = userInfo.values

for (key, val) in userInfo {
    // print(key, val)
}

// pattern matching key/val extraction
for (key, val) in userInfo where key == "Name" {
    print(key, val)
}

for (key, val) in userInfo where val is Int {
    print(key, val)
}

for (key, val) in userInfo where key.count > 2 && val is Int {
    print(key, val)
}

