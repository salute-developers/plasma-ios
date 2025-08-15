import Foundation
import SwiftUI

public struct SDDSSpinnerData {
    public var isAnimating: Bool
    public var appearance: SpinnerAppearance?
    
    public init(isAnimating: Bool = false, appearance: SpinnerAppearance? = nil) {
        self.isAnimating = isAnimating
        self.appearance = appearance
    }
}

extension SDDSSpinnerData: EnvironmentKey {
    public static var defaultValue: SDDSSpinnerData? = nil
}

public extension EnvironmentValues {
    var spinnerData: SDDSSpinnerData? {
        get { self[SDDSSpinnerData.self] }
        set { self[SDDSSpinnerData.self] = newValue }
    }
}
