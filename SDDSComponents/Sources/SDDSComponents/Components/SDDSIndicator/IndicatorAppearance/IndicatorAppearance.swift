import SwiftUI
import Foundation
import SDDSThemeCore

// sdds:apiInfo
public struct IndicatorAppearance {
    public var size: IndicatorSizeConfiguration = DefaultIndicatorSize()
    public var backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
    
    public init() {}
}

extension IndicatorAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: IndicatorAppearance.self, fallback: IndicatorAppearance())
    }
}
