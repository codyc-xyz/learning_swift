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
