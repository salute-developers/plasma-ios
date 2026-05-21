import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct RadioboxAppearance: SelectionControlAppearance, Hashable {
    let id = UUID()
    @available(*, deprecated, message: "use 'toggleColor' instead")
    public var color: StatefulFillStyle
    public var toggleColor: StatefulFillStyle
    public var borderColor: StatefulFillStyle
    public var checkedIcon: PathDrawer?
    public var checkedIconColor: StatefulFillStyle
    public var toggleIndeterminateIcon: PathDrawer?
    public var toggleIndeterminateIconColor: StatefulFillStyle
    public var toggleColorChecked: StatefulFillStyle
    public var toggleColorIndeterminate: StatefulFillStyle
    public var size: SelectionControlSizeConfiguration
    public var titleTypography: TypographyConfiguration
    public var subtitleTypography: TypographyConfiguration
    public var titleColor: StatefulFillStyle
    public var subtitleColor: StatefulFillStyle
    public var disabledAlpha: CGFloat
    
    public init(
        color: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        toggleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        borderColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        toggleColorChecked: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        toggleColorIndeterminate: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        checkedIcon: PathDrawer? = nil,
        checkedIconColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        toggleIndeterminateIcon: PathDrawer? = nil,
        toggleIndeterminateIconColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        size: SelectionControlSizeConfiguration = ZeroSelectionControlSize(),
        titleTypography: TypographyConfiguration = .default,
        subtitleTypography: TypographyConfiguration = .default,
        titleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        subtitleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        disabledAlpha: CGFloat = 0
    ) {
        self.color = color
        self.toggleColor = toggleColor
        self.toggleColorChecked = toggleColorChecked
        self.borderColor = borderColor
        self.checkedIcon = checkedIcon
        self.checkedIconColor = checkedIconColor
        self.toggleColorChecked = toggleColorChecked
        self.toggleColorIndeterminate = toggleColorIndeterminate
        self.toggleIndeterminateIcon = toggleIndeterminateIcon
        self.toggleIndeterminateIconColor = toggleIndeterminateIconColor
        self.size = size
        self.titleTypography = titleTypography
        self.subtitleTypography = subtitleTypography
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.disabledAlpha = disabledAlpha
    }

    @_disfavoredOverload
    @available(*, deprecated, message: "Use StatefulFillStyle init to support gradients and states.")
    public init(
        color: ColorToken = .clearColor,
        toggleColor: ColorToken = .clearColor,
        borderColor: ColorToken = .clearColor,
        toggleColorChecked: ColorToken = .clearColor,
        toggleColorIndeterminate: ColorToken = .clearColor,
        checkedIcon: PathDrawer? = nil,
        checkedIconColor: ColorToken = .clearColor,
        toggleIndeterminateIcon: PathDrawer? = nil,
        toggleIndeterminateIconColor: ColorToken = .clearColor,
        size: SelectionControlSizeConfiguration = ZeroSelectionControlSize(),
        titleTypography: TypographyConfiguration = .default,
        subtitleTypography: TypographyConfiguration = .default,
        titleColor: ColorToken = .clearColor,
        subtitleColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0
    ) {
        self.init(
            color: color.statefulColor.statefulFillStyle,
            toggleColor: toggleColor.statefulColor.statefulFillStyle,
            borderColor: borderColor.statefulColor.statefulFillStyle,
            toggleColorChecked: toggleColorChecked.statefulColor.statefulFillStyle,
            toggleColorIndeterminate: toggleColorIndeterminate.statefulColor.statefulFillStyle,
            checkedIcon: checkedIcon,
            checkedIconColor: checkedIconColor.statefulColor.statefulFillStyle,
            toggleIndeterminateIcon: toggleIndeterminateIcon,
            toggleIndeterminateIconColor: toggleIndeterminateIconColor.statefulColor.statefulFillStyle,
            size: size,
            titleTypography: titleTypography,
            subtitleTypography: subtitleTypography,
            titleColor: titleColor.statefulColor.statefulFillStyle,
            subtitleColor: subtitleColor.statefulColor.statefulFillStyle,
            disabledAlpha: disabledAlpha
        )
    }
    
    public static func == (lhs: RadioboxAppearance, rhs: RadioboxAppearance) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension RadioboxAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: RadioboxAppearance.self, fallback: RadioboxAppearance())
    }
}
