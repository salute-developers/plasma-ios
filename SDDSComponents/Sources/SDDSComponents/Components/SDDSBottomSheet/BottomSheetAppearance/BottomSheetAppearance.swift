import SwiftUI
import Foundation
import SDDSThemeCore

public struct BottomSheetAppearance {
    public var size: BottomSheetSizeConfiguration
    public var backgroundColor: ColorToken
    public var handleColor: ColorToken
    public var handlePlacement: BottomSheetHandlePlacement
    
    public init(size: BottomSheetSizeConfiguration = DefaultBottomSheetSize(),
                backgroundColor: ColorToken = .clearColor,
                handleColor: ColorToken = .clearColor,
                handlePlacement: BottomSheetHandlePlacement = .none
    ) {
        self.size = size
        self.backgroundColor = backgroundColor
        self.handleColor = handleColor
        self.handlePlacement = handlePlacement
    }
}

extension BottomSheetAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: BottomSheetAppearance.self, fallback: BottomSheetAppearance())
    }
}
