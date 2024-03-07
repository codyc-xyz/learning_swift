import Foundation

// Protocols are a special kind of object -> similar to interfaces/mixins
// You create a set of rules that objects which conform to a protocol have to follow

protocol canBreathe {
    func breathe()
}

// structs allow inheritance from protocols
struct Animal: canBreathe {
    func breathe() {
        "Animal breathing..."
    }
}

struct Person: canBreathe {
    func breathe() {
        "Person breathing..."
    }
}
