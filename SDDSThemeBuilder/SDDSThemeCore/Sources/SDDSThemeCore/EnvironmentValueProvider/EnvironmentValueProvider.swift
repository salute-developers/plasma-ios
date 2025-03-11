import Foundation
import SwiftUI

public final class EnvironmentValueProvider {

    public static let shared = EnvironmentValueProvider()
    
    private var values: [String: Any] = [:]

    public func set<Value>(value: Value, forKey key: any EnvironmentKey.Type) {
        print("Set values in \(self)")
        values[String(describing: key)] = value
    }

    public func value<Value>(forKey key: any EnvironmentKey.Type) -> Value {
        print("values: \(values.count)")
        if let value = values[String(describing: key)] as? Value {
            print("VALUE: \(value)")
            return value
        } else {
            if let value = key.defaultValue as? Value {
                print("KEY: \(value)")
                return value
            }
            fatalError()
        }
    }
}
