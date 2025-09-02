import Foundation
import SwiftUI
import SDDSThemeCore

public struct CheckboxAppearance: SelectionControlAppearance, Hashable {
    let id = UUID()
    public var size: SelectionControlSizeConfiguration
    public var titleTypography: TypographyConfiguration
    public var subtitleTypography: TypographyConfiguration
    public var titleColor: ColorToken
    public var subtitleColor: ColorToken
    public var disabledAlpha: CGFloat
    @available(*, deprecated, message: "use 'toggleColor' instead")
    public var color: ColorToken
    public var toggleColor: ColorToken
    public var toggleColorChecked: ColorToken
    public var toggleColorIndeterminate: ColorToken
    public var borderColor: ColorToken
    public var checkedIcon: PathDrawer?
    public var checkedIconColor: ColorToken
    public var toggleIndeterminateIcon: PathDrawer?
    public var toggleIndeterminateIconColor: ColorToken
    
    
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
