import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct CheckboxAppearance: SelectionControlAppearance, Hashable {
    let id = UUID()
    public var size: SelectionControlSizeConfiguration
    public var titleTypography: TypographyConfiguration
    public var subtitleTypography: TypographyConfiguration
    public var titleColor: StatefulFillStyle
    public var subtitleColor: StatefulFillStyle
    public var disabledAlpha: CGFloat
    @available(*, deprecated, message: "use 'toggleColor' instead")
    public var color: StatefulFillStyle
    public var toggleColor: StatefulFillStyle
    public var toggleColorChecked: StatefulFillStyle
    public var toggleColorIndeterminate: StatefulFillStyle
    public var borderColor: StatefulFillStyle
    public var checkedIcon: PathDrawer?
    public var checkedIconColor: StatefulFillStyle
    public var toggleIndeterminateIcon: PathDrawer?
    public var toggleIndeterminateIconColor: StatefulFillStyle
    
    
    public init(
        size: SelectionControlSizeConfiguration = ZeroSelectionControlSize(),
        titleTypography: TypographyConfiguration = .default,
        subtitleTypography: TypographyConfiguration = .default,
        titleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        subtitleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        disabledAlpha: CGFloat = 0,
        color: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        toggleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        toggleColorChecked: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        toggleColorIndeterminate: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        borderColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        checkedIcon: PathDrawer? = nil,
        checkedIconColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        toggleIndeterminateIcon: PathDrawer? = nil,
        toggleIndeterminateIconColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
    ) {
        self.size = size
        self.titleTypography = titleTypography
        self.subtitleTypography = subtitleTypography
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.disabledAlpha = disabledAlpha
        self.color = color
        self.toggleColorChecked = toggleColorChecked
        self.toggleColorIndeterminate = toggleColorIndeterminate
        self.toggleColor = toggleColor
        self.borderColor = borderColor
        self.checkedIcon = checkedIcon
        self.checkedIconColor = checkedIconColor
        self.toggleIndeterminateIcon = toggleIndeterminateIcon
        self.toggleIndeterminateIconColor = toggleIndeterminateIconColor
    }

    @_disfavoredOverload
    @available(*, deprecated, message: "Use StatefulFillStyle init to support gradients and states.")
    public init(
        size: SelectionControlSizeConfiguration = ZeroSelectionControlSize(),
        titleTypography: TypographyConfiguration = .default,
        subtitleTypography: TypographyConfiguration = .default,
        titleColor: ColorToken = .clearColor,
        subtitleColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0,
        color: ColorToken = .clearColor,
        toggleColor: ColorToken = .clearColor,
        toggleColorChecked: ColorToken = .clearColor,
        toggleColorIndeterminate: ColorToken = .clearColor,
        borderColor: ColorToken = .clearColor,
        checkedIcon: PathDrawer? = nil,
        checkedIconColor: ColorToken = .clearColor,
        toggleIndeterminateIcon: PathDrawer? = nil,
        toggleIndeterminateIconColor: ColorToken = .clearColor
    ) {
        self.init(
            size: size,
            titleTypography: titleTypography,
            subtitleTypography: subtitleTypography,
            titleColor: titleColor.statefulColor.statefulFillStyle,
            subtitleColor: subtitleColor.statefulColor.statefulFillStyle,
            disabledAlpha: disabledAlpha,
            color: color.statefulColor.statefulFillStyle,
            toggleColor: toggleColor.statefulColor.statefulFillStyle,
            toggleColorChecked: toggleColorChecked.statefulColor.statefulFillStyle,
            toggleColorIndeterminate: toggleColorIndeterminate.statefulColor.statefulFillStyle,
            borderColor: borderColor.statefulColor.statefulFillStyle,
            checkedIcon: checkedIcon,
            checkedIconColor: checkedIconColor.statefulColor.statefulFillStyle,
            toggleIndeterminateIcon: toggleIndeterminateIcon,
            toggleIndeterminateIconColor: toggleIndeterminateIconColor.statefulColor.statefulFillStyle
        )
    }
    
    public static func == (lhs: CheckboxAppearance, rhs: CheckboxAppearance) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension CheckboxAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: CheckboxAppearance.self, fallback: CheckboxAppearance())
    }
}
