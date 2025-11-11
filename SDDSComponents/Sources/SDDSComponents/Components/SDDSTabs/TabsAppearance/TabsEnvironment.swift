import SwiftUI

extension TabsAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: TabsAppearance.self, fallback: TabsAppearance())
    }
}

public extension EnvironmentValues {
    var tabsAppearance: TabsAppearance {
        get { self[TabsAppearance.self] }
        set { self[TabsAppearance.self] = newValue }
    }
}
