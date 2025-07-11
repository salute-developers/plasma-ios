import Foundation
import SwiftUI

public protocol ListSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    // ListSizeConfiguration не имеет специфичных свойств в текущей конфигурации
}

public struct DefaultListSize: ListSizeConfiguration {
    public var debugDescription: String {
        "DefaultListSize"
    }
}

public struct ZeroListSize: ListSizeConfiguration {
    public var debugDescription: String {
        "ZeroListSize"
    }
    
    public init() {}
} 