import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `IconButtonGroupAppearance` определяет внешний вид компонента IconButtonGroup.
 */
public struct IconButtonGroupAppearance {
    public var buttonAppearance: ButtonAppearance?
    public var size: IconButtonGroupSizeConfiguration
    
    public init(
        buttonAppearance: ButtonAppearance? = nil,
        size: IconButtonGroupSizeConfiguration = IconButtonGroupSize()
    ) {
        self.buttonAppearance = buttonAppearance
        self.size = size
    }
}

// MARK: - Environment Key

extension IconButtonGroupAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        IconButtonGroupAppearance()
    }
}

public extension EnvironmentValues {
    var iconButtonGroupAppearance: IconButtonGroupAppearance {
        get { self[IconButtonGroupAppearance.self] }
        set { self[IconButtonGroupAppearance.self] = newValue }
    }
}
