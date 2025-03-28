import Foundation

public protocol Modifiable {
    func modify(_ modifyClosure: (Self) -> Self) -> Self
}

public extension Modifiable {
    func modify(_ modifyClosure: (Self) -> Self) -> Self {
        modifyClosure(self)
    }
}
