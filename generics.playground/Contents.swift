import Foundation

// generics are used to avoid writing the same functions/code multiple times

func perform<N: Numeric>(_ op: (N, N) -> N,
             on lhs: N, and rhs: N
) -> N {
    return op(lhs, rhs)
}

perform(+, on: 10, and: 20)

func performSignatureEnd<N>(_ op: (N, N) -> N,
             on lhs: N, and rhs: N
) -> N where N: Numeric {
    return op(lhs, rhs)
}

performSignatureEnd(+, on: 10, and: 20)

// classes and structs can conform to multiple protocols -> you can use this to create generics that are conformant to multiple types

protocol canJump {
    func jump()
}

protocol canRun {
    func run()
}

struct Person: canJump, canRun {
    func jump() {
        "Jumping"
    }
    func run() {
        "Running"
    }
}

func jumpAndRun<T: canJump & canRun>(val: T) {
    val.jump()
    val.run()
}

let person = Person()
jumpAndRun(val: person)

// extending the data type -> array of strings
extension [String] {
    func longestString() -> String? {
        self.sorted { (lhs: String, rhs: String) -> Bool in
            lhs.count > rhs.count
        }.first
    }
}

let stringArr: [String] = ["a", "aa", "ah8d7ewhd", "b"]
stringArr.longestString()

// associated types in protocols

protocol View {
    func addSubView(_ view: View)
}

extension View {
    func addSubView(_ view: View) {
        // empty
    }
}

struct Button: View {
    // empty
}

struct Person2 {
    let name: String
}

// if you want to turn a protocol into a generic protocol you use keyword 'associatedtype' (adds generic parameter)
protocol PresentableAsView {
    associatedtype ViewType: View
    // making produce view return a viewtype here means e.g. if the viewtype is button, returns button
    func produceView() -> ViewType
    func configure(
        superView: View,
        thisView: ViewType
    )
    func present(
        view: ViewType,
        on superView: View
    )
}

extension PresentableAsView {
    func configure(
        superView: View,
        thisView: ViewType
    ) {
        // empty by default
    }
    func present(
        view: ViewType,
        on superView: View
    ) {
        superView.addSubView(view)
    }
}

struct MyButton: PresentableAsView {
    func produceView() -> Button {
        Button()
    }
}

// conditional extension
extension PresentableAsView where ViewType == Button {
    func doSomethingWithButton() {
        "This is a button"
    }
}

let button = MyButton()
button.doSomethingWithButton()

extension [Int] {
    func average() -> Double {
        Double(self.reduce(0, +)) / Double(self.count)
    }
}

[1, 2, 3, 4].average()

