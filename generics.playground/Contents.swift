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
