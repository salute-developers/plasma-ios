import SwiftUI
import Foundation
import SDDSThemeCore

public struct IndicatorAppearance: EnvironmentKey {
    public static let defaultValue: Self = .init()
    
    public var size: IndicatorSizeConfiguration = DefaultIndicatorSize()
    public var backgroundColor: ColorToken = .clearColor
    
    public init() {}
}
