import Foundation

// the point of errors and exceptions are to tell the caller of the code that something has gone wrong
// errors and exceptions referred to as errors in swift

struct Person {
    let firstName: String?
    let lastName: String?
    
    enum PersonErrors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNamesAreNil
    }
    
    func getFullName() throws -> String? {
        switch (firstName, lastName) {
        case (.none, .none):
            throw PersonErrors.bothNamesAreNil
        case (.some, .none):
            throw PersonErrors.lastNameIsNil
        case (.none, .some):
            throw PersonErrors.firstNameIsNil
        case let (.some(firstName), .some(lastName)):
            return "\(firstName) \(lastName)"
        }
    }
}

let foo = Person(firstName: "Foo", lastName: nil)

do {
    let fooName = try foo.getFullName()
} catch {
    "Error: \(error)"
}

// catching specific errors

do {
    let fooName = try foo.getFullName()
// pattern matching on catch
} catch is Person.PersonErrors {
    "Got a person error"
}

do {
    let fooName = try foo.getFullName()
} catch Person.PersonErrors.firstNameIsNil {
    "First Name is nil"
} catch Person.PersonErrors.lastNameIsNil {
    "Last name is nil"
} catch Person.PersonErrors.bothNamesAreNil {
    "Both names are nil"
} catch {
    "Some other error was thrown"
}

// throwing initializers/constructors

struct Car {
    let manufacturer: String
    enum CarErrors: Error {
        case invalidManufacturer
    }
    init(
        manufacturer: String
    ) throws {
        if manufacturer.isEmpty {
            throw CarErrors.invalidManufacturer
        }
        self.manufacturer = manufacturer
    }
    
}

do {
    let myCar = try Car(manufacturer: "")
} catch Car.CarErrors.invalidManufacturer {
    "Manufacturer is invalid"
} catch {
    "Some other error"
}

// if function is successful, grab value

if let yourCar = try? Car(manufacturer: "Tesla") {
    "Success, your car was manufactured by \(yourCar.manufacturer)"
} else {
    "Failed to construct and error is not accessible now"
}

// crash the application if function is unsuccessful -> never use this syntax
// let theirCar = try! Car(manufacturer: "")

struct Dog {
    let isInjured: Bool
    let isSleeping: Bool
    
    enum DogErrors: Error {
        case cannotBarkIsSleeping
        case cannotRunIsInjured
    }
    
    func bark() throws {
        if isSleeping {
            throw DogErrors.cannotBarkIsSleeping
        } else {
            "Bark..."
        }
    }
    
    func run() throws {
        if isInjured {
            throw DogErrors.cannotRunIsInjured
        } else {
            "Running..."
        }
    }
    // if you mark your function as throws, you can try things without a do/catch catch. if any function inside throws, this function will throw
    func barkAndRun() throws {
        try bark()
        try run()
    }
}

let myDog = Dog(isInjured: true, isSleeping: true)

do {
    try myDog.barkAndRun()
} catch Dog.DogErrors.cannotBarkIsSleeping, Dog.DogErrors.cannotRunIsInjured {
    "Cannot bark is sleeping or cannot run is injured"
} catch {
    "Some other error"
}

// only first thrown error is caught

do {
    try myDog.barkAndRun()
} catch Dog.DogErrors.cannotBarkIsSleeping {
    "Cannot bark is sleeping"
} catch Dog.DogErrors.cannotRunIsInjured {
    "Cannot run is injured"
} catch {
    "Some other error"
}

// rethrows -> function that internally calls another function that can also throw

func fullName(
    firstName: String?,
    lastName: String?,
    calculator: (String?, String?) throws -> String?
// for a function to be marked rethrows, has to have a closure argument which throws
) rethrows -> String? {
    try calculator(firstName, lastName)
}

enum NameErrors: Error {
    case firstNameIsInvalid
    case lastNameIsInvalid
}

func + (
    firstName: String?,
    lastName: String?
) throws -> String? {
    guard let firstName, !firstName.isEmpty else {
        throw NameErrors.firstNameIsInvalid
    }
    guard let lastName, !lastName.isEmpty else {
        throw NameErrors.lastNameIsInvalid
    }
    return "\(firstName) \(lastName)"
}

do {
    let fooBar = try fullName(firstName: "", lastName: "Bar", calculator: +)
} catch NameErrors.firstNameIsInvalid {
    "First name is invalid"
} catch NameErrors.lastNameIsInvalid {
    "Last name is invalid"
} catch let err {
    "Some other error = \(err)"
}

// Results are related to error handling within API calls (Generally)
// for when a function fails more gracefully, doesn't throw an error but carries an error with it

enum IntegerErrors: Error {
    case noPositiveIntegerBefore(thisValue: Int)
}
func getPreviousPositiveInteger(from int: Int) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return Result.failure(IntegerErrors.noPositiveIntegerBefore(thisValue: int))
    }
    return Result.success(int-1)
}

func performGet(
    forValue value: Int
) {
    switch getPreviousPositiveInteger(from: value) {
    case let .success(previousValue):
        "Previous value is \(previousValue)"
    case let .failure(error):
        switch error {
        case let .noPositiveIntegerBefore(thisValue):
            "No positive values before \(thisValue)"
        }
    }
}

performGet(forValue: 0)
performGet(forValue: 2)
