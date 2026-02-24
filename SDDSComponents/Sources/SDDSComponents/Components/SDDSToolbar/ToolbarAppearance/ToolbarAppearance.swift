import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `ToolbarAppearance` определяет внешний вид компонента Toolbar.
 */
public struct ToolbarAppearance: Hashable {
    private let id = UUID()
    
    public var backgroundColor: ColorToken
    public var shadow: ShadowToken
    public var dividerAppearance: DividerAppearance?
    public var size: ToolbarSizeConfiguration
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        shadow: ShadowToken = ShadowToken(),
        dividerAppearance: DividerAppearance? = nil,
        size: ToolbarSizeConfiguration = ToolbarSize()
    ) {
        self.backgroundColor = backgroundColor
        self.shadow = shadow
        self.dividerAppearance = dividerAppearance
        self.size = size
    }
    
    public static func == (lhs: ToolbarAppearance, rhs: ToolbarAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.backgroundColor == rhs.backgroundColor &&
        lhs.dividerAppearance == rhs.dividerAppearance
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension ToolbarAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        ToolbarAppearance()
    }
}

public extension EnvironmentValues {
    var toolbarAppearance: ToolbarAppearance {
        get { self[ToolbarAppearance.self] }
        set { self[ToolbarAppearance.self] = newValue }
    }
}
