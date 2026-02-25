import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct ListItemAppearance: Hashable {
    let id = UUID()
    public var labelTypography: TypographyConfiguration
    public var titleTypography: TypographyConfiguration
    public var subtitleTypography: TypographyConfiguration?
    public var labelColor: ColorToken
    public var titleColor: ColorToken
    public var subtitleColor: ColorToken
    public var disclosureIconColor: ColorToken
    public var disclosureIcon: Image?
    public var backgroundColor: ButtonColor
    public var disabledAlpha: CGFloat
    public var counterAppearance: CounterAppearance?
    public var size: ListItemSizeConfiguration
    
    public init(
        labelTypography: TypographyConfiguration = .default,
        titleTypography: TypographyConfiguration = .default,
        subtitleTypography: TypographyConfiguration? = nil,
        labelColor: ColorToken = .clearColor,
        titleColor: ColorToken = .clearColor,
        subtitleColor: ColorToken = .clearColor,
        disclosureIconColor: ColorToken = .clearColor,
        disclosureIcon: Image? = nil,
        backgroundColor: ButtonColor = ButtonColor(),
        disabledAlpha: CGFloat = 0.4,
        counterAppearance: CounterAppearance? = nil,
        size: ListItemSizeConfiguration = ZeroListItemSize()
    ) {
        self.labelTypography = labelTypography
        self.titleTypography = titleTypography
        self.subtitleTypography = subtitleTypography
        self.labelColor = labelColor
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.disclosureIconColor = disclosureIconColor
        self.disclosureIcon = disclosureIcon
        self.backgroundColor = backgroundColor
        self.disabledAlpha = disabledAlpha
        self.counterAppearance = counterAppearance
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