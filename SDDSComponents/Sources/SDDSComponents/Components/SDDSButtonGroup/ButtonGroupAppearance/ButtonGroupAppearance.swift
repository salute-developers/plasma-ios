import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `ButtonGroupAppearance` определяет внешний вид компонента ButtonGroup.
 */
public struct ButtonGroupAppearance {
    public var buttonAppearance: ButtonAppearance?
    public var size: ButtonGroupSizeConfiguration
    
    public init(
        buttonAppearance: ButtonAppearance? = nil,
        size: ButtonGroupSizeConfiguration = ButtonGroupSize()
    ) {
        self.buttonAppearance = buttonAppearance
        self.size = size
    }
}

// MARK: - Environment Key

extension ButtonGroupAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        ButtonGroupAppearance()
    }
}

public extension EnvironmentValues {
    var buttonGroupAppearance: ButtonGroupAppearance {
        get { self[ButtonGroupAppearance.self] }
        set { self[ButtonGroupAppearance.self] = newValue }
    }
}
