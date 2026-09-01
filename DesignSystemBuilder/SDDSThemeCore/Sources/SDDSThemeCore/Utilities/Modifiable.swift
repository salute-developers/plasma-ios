import Foundation

public protocol Modifiable {
    associatedtype ModifiableType
    
    func modify(_ value: ModifiableType) -> ModifiableType
}
