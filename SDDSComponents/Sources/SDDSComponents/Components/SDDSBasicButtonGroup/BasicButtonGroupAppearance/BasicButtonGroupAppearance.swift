import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `BasicButtonGroupAppearance` определяет внешний вид компонента BasicButtonGroup.
 */
public struct BasicButtonGroupAppearance {
    public var buttonAppearance: ButtonAppearance?
    public var size: BasicButtonGroupSizeConfiguration
    
    public init(
        buttonAppearance: ButtonAppearance? = nil,
        size: BasicButtonGroupSizeConfiguration = BasicButtonGroupSize()
    ) {
        self.buttonAppearance = buttonAppearance
        self.size = size
    }
}

// MARK: - Environment Key

extension BasicButtonGroupAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        BasicButtonGroupAppearance()
    }
}

public extension EnvironmentValues {
    var basicButtonGroupAppearance: BasicButtonGroupAppearance {
        get { self[BasicButtonGroupAppearance.self] }
        set { self[BasicButtonGroupAppearance.self] = newValue }
    }
}
