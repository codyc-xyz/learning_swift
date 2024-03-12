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
