import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `DrawerAppearance` определяет внешний вид компонента Drawer.
 */
public struct DrawerAppearance: Hashable {
    let id = UUID()
    public var backgroundColor: ColorToken
    public var closeColor: ColorToken
    public var closeIcon: Image?
    public var shadow: ShadowToken?
    public var size: DrawerSizeConfiguration
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        closeColor: ColorToken = .clearColor,
        closeIcon: Image? = nil,
        shadow: ShadowToken? = nil,
        size: DrawerSizeConfiguration = ZeroDrawerSize()
    ) {
        self.backgroundColor = backgroundColor
        self.closeColor = closeColor
        self.closeIcon = closeIcon
        self.shadow = shadow
        self.size = size
    }
    
    public static func == (lhs: DrawerAppearance, rhs: DrawerAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.backgroundColor == rhs.backgroundColor &&
        lhs.closeColor == rhs.closeColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension DrawerAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: DrawerAppearance.self, fallback: DrawerAppearance())
    }
}

public extension EnvironmentValues {
    var drawerAppearance: DrawerAppearance {
        get { self[DrawerAppearance.self] }
        set { self[DrawerAppearance.self] = newValue }
    }
}

