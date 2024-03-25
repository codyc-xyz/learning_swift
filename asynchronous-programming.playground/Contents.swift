import Foundation
import PlaygroundSupport
import _Concurrency

// This line of code configures the playground to allow for asynchronous code to run indefinitely. By default, a Swift Playground executes code in the page and then stops, assuming the execution is complete. This behavior is fine for synchronous code that runs to completion immediately. However, for asynchronous operations (like networking calls, timers, or any operation that completes in the future), you need the playground to keep running so that these async operations have time to complete.
PlaygroundPage
    .current
    .needsIndefiniteExecution = true

// async functions are functions that do not immediately return a result

func calculateFullName(
    firstName: String,
    lastName: String
) async -> String {
    try? await Task.sleep(for: .seconds(1))
    return "\(firstName) \(lastName)"
}

Task {
    let result1 = await calculateFullName(firstName: "Foo", lastName: "Bar")
    // different syntax
    async let result2 = calculateFullName(firstName: "Foo", lastName: "Bar")
    await result2
}

enum Clothe {
    case socks, shirt, trousers
}

func buySocks() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.socks
}
