import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `LoaderAppearance` определяет внешний вид компонента Loader, который может отображать либо Spinner, либо CircularProgressBar.

 - Properties:
    - spinnerAppearance: Стиль компонента Spinner.
    - circularProgressAppearance: Стиль компонента CircularProgressBar.
 */
public struct LoaderAppearance: Hashable {
    let id = UUID()
    public var spinnerAppearance: SpinnerAppearance?
    public var circularProgressAppearance: CircularProgressBarAppearance?
    public var size: LoaderSizeConfiguration
    
    public init(
        spinnerAppearance: SpinnerAppearance? = nil,
        circularProgressAppearance: CircularProgressBarAppearance? = nil,
        size: LoaderSizeConfiguration = DefaultLoaderSizeConfiguration()
    ) {
        self.spinnerAppearance = spinnerAppearance
        self.circularProgressAppearance = circularProgressAppearance
        self.size = size
    }
    
    public static func == (lhs: LoaderAppearance, rhs: LoaderAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.spinnerAppearance == rhs.spinnerAppearance &&
        lhs.circularProgressAppearance == rhs.circularProgressAppearance
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension LoaderAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: LoaderAppearance.self, fallback: LoaderAppearance())
    }
}
