import Foundation

public protocol AppearanceProvider {
    associatedtype Appearance
    
    static var defaultValue: Appearance { get }
}
