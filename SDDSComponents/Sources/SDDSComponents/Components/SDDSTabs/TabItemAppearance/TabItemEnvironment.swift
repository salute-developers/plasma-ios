import SwiftUI

extension TabItemAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: TabItemAppearance.self, fallback: TabItemAppearance())
    }
}

public extension EnvironmentValues {
    var tabItemAppearance: TabItemAppearance {
        get { self[TabItemAppearance.self] }
        set { self[TabItemAppearance.self] = newValue }
    }
}
