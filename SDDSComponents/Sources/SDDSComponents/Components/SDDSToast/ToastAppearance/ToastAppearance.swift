import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct ToastAppearance: Hashable {
    let id = UUID()
    public var backgroundColor: ColorToken
    public var textColor: ColorToken?
    public var contentStartColor: ColorToken
    public var contentEndColor: ColorToken
    public var textTypography: TypographyConfiguration?
    public var size: ToastSizeConfiguration
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        contentStartColor: ColorToken = .clearColor,
        contentEndColor: ColorToken = .clearColor,
        textTypography: TypographyConfiguration? = nil,
        size: ToastSizeConfiguration = ZeroToastSize()
    ) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.contentStartColor = contentStartColor
        self.contentEndColor = contentEndColor
        self.textTypography = textTypography
        self.size = size
    }
    
    public static func == (lhs: ToastAppearance, rhs: ToastAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.backgroundColor == rhs.backgroundColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
} 

extension ToastAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: ToastAppearance.self, fallback: ToastAppearance())
    }
}
