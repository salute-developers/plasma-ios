import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct ListItemAppearance: Hashable {
    let id = UUID()
    public var titleTypography: TypographyConfiguration
    public var titleColor: ColorToken
    public var disclosureIconColor: ColorToken
    public var disclosureIcon: Image?
    public var backgroundColor: ButtonColor
    public var size: ListItemSizeConfiguration
    
    public init(
        titleTypography: TypographyConfiguration = .default,
        titleColor: ColorToken = .clearColor,
        disclosureIconColor: ColorToken = .clearColor,
        disclosureIcon: Image? = nil,
        backgroundColor: ButtonColor = ButtonColor(),
        size: ListItemSizeConfiguration = ZeroListItemSize()
    ) {
        self.titleTypography = titleTypography
        self.titleColor = titleColor
        self.disclosureIconColor = disclosureIconColor
        self.disclosureIcon = disclosureIcon
        self.backgroundColor = backgroundColor
        self.size = size
    }
    
    public static func == (lhs: ListItemAppearance, rhs: ListItemAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.titleColor == rhs.titleColor &&
        lhs.disclosureIconColor == rhs.disclosureIconColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension ListItemAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: ListItemAppearance.self, fallback: ListItemAppearance())
    }
} 