import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct RadioboxAppearance: SelectionControlAppearance, Hashable {
    let id = UUID()
    @available(*, deprecated, message: "use 'toggleColor' instead")
    public var color: ColorToken
    public var toggleColor: ColorToken
    public var borderColor: ColorToken
    public var checkedIcon: PathDrawer?
    public var checkedIconColor: ColorToken
    public var toggleIndeterminateIcon: PathDrawer?
    public var toggleIndeterminateIconColor: ColorToken
    public var toggleColorChecked: ColorToken
    public var toggleColorIndeterminate: ColorToken
    public var size: SelectionControlSizeConfiguration
    public var titleTypography: TypographyConfiguration
    public var subtitleTypography: TypographyConfiguration
    public var titleColor: ColorToken
    public var subtitleColor: ColorToken
    public var disabledAlpha: CGFloat
    
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
