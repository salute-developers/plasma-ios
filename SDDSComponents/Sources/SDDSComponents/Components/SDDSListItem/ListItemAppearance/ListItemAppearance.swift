import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct ListItemAppearance: Hashable {
    let id = UUID()
    public var labelTypography: TypographyConfiguration
    public var titleTypography: TypographyConfiguration
    public var subtitleTypography: TypographyConfiguration?
    public var labelColor: StatefulFillStyle
    public var titleColor: StatefulFillStyle
    public var subtitleColor: StatefulFillStyle
    public var disclosureIconColor: StatefulFillStyle
    public var disclosureIcon: Image?
    public var backgroundColor: StatefulFillStyle
    public var disabledAlpha: CGFloat
    public var counterAppearance: CounterAppearance?
    public var size: ListItemSizeConfiguration
    
    public init(
        labelTypography: TypographyConfiguration = .default,
        titleTypography: TypographyConfiguration = .default,
        subtitleTypography: TypographyConfiguration? = nil,
        labelColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        titleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        subtitleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        disclosureIconColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        disclosureIcon: Image? = nil,
        backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
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

    @available(*, deprecated, message: "ColorToken/ButtonColor are deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
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
        self.init(
            labelTypography: labelTypography,
            titleTypography: titleTypography,
            subtitleTypography: subtitleTypography,
            labelColor: labelColor.statefulColor.statefulFillStyle,
            titleColor: titleColor.statefulColor.statefulFillStyle,
            subtitleColor: subtitleColor.statefulColor.statefulFillStyle,
            disclosureIconColor: disclosureIconColor.statefulColor.statefulFillStyle,
            disclosureIcon: disclosureIcon,
            backgroundColor: backgroundColor.statefulColor.statefulFillStyle,
            disabledAlpha: disabledAlpha,
            counterAppearance: counterAppearance,
            size: size
        )
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
