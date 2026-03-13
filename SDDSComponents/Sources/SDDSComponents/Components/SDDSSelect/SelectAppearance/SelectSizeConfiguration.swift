import Foundation
import SwiftUI
import SDDSThemeCore

public protocol SelectSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    // Select is a composite component over TextField and Dropdown
}

public struct ZeroSelectSize: SelectSizeConfiguration {
    public var debugDescription: String {
        "ZeroSelectSize"
    }
    
    public init() {}
}

