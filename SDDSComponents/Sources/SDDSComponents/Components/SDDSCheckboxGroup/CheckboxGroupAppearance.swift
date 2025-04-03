import Foundation
import SwiftUI

public struct CheckboxGroupAppearance {
    public var size: CheckboxGroupSizeConfiguration
    public var checkboxAppearance: CheckboxAppearance
    
    public init(
        size: CheckboxGroupSizeConfiguration = ZeroCheckboxGruopSize(),
        checkboxAppearance: CheckboxAppearance = CheckboxAppearance()
    ) {
        self.size = size
        self.checkboxAppearance = checkboxAppearance
    }
}

extension CheckboxGroupAppearance: EnvironmentKey {
    public static var defaultValue: CheckboxGroupAppearance {
        EnvironmentValueProvider.shared.value(forKey: CheckboxGroupAppearance.self, fallback: CheckboxGroupAppearance())
    }
}

public struct ZeroCheckboxGruopSize: CheckboxGroupSizeConfiguration {
    public var horizontalIndent: CGFloat { 0 }
    public var verticalSpacing: CGFloat { 0 }
    public var debugDescription: String {
        "ZeroCheckboxGruopSize"
    }
    
    public init() {}
}
