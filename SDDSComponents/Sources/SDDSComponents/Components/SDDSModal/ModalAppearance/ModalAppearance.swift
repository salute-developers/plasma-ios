import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct ModalAppearance: Hashable {
    let id = UUID()
    public var backgroundColor: ColorToken
    public var closeColor: ColorToken
    public var size: ModalSizeConfiguration
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        closeColor: ColorToken = .clearColor,
        size: ModalSizeConfiguration = ZeroModalSize()
    ) {
        self.backgroundColor = backgroundColor
        self.closeColor = closeColor
        self.size = size
    }
    
    public static func == (lhs: ModalAppearance, rhs: ModalAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.backgroundColor == rhs.backgroundColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension ModalAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: ModalAppearance.self, fallback: ModalAppearance())
    }
} 