import SwiftUI
import SDDSThemeCore

public struct DividerAppearance: Hashable {
    let id = UUID()
    public var shape: PathDrawer
    public var thickness: CGFloat
    public var backgroundColor: ColorToken
    public var size: DividerSizeConfiguration
    
    public init(shape: PathDrawer = DefaultPathDrawer(), thickness: CGFloat = 0, backgroundColor: ColorToken = .clearColor, size: DividerSizeConfiguration = ZeroDividerSizeConfiguration()) {
        self.shape = shape
        self.thickness = thickness
        self.backgroundColor = backgroundColor
        self.size = size
    }
    
    public static func == (lhs: DividerAppearance, rhs: DividerAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.thickness == rhs.thickness &&
        lhs.backgroundColor == rhs.backgroundColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension DividerAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: DividerAppearance.self, fallback: DividerAppearance())
    }
}
