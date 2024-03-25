import Foundation
import PlaygroundSupport
import _Concurrency

// This line of code configures the playground to allow for asynchronous code to run indefinitely. By default, a Swift Playground executes code in the page and then stops, assuming the execution is complete. This behavior is fine for synchronous code that runs to completion immediately. However, for asynchronous operations (like networking calls, timers, or any operation that completes in the future), you need the playground to keep running so that these async operations have time to complete.
PlaygroundPage
    .current
    .needsIndefiniteExecution = true
