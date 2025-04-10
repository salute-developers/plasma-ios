import SwiftUI
import Foundation
import SDDSThemeCore

public struct SDDSBadge: View {
    @Environment(\.badgeAppearance) private var environmentAppearance
    private let _appearance: BadgeAppearance?
    
    let label: String
    let image: Image?
    let alignment: BadgeAlignment
    let style: BadgeStyle
    let action: (() -> Void)?
    
    public init(
        label: String,
        image: Image?,
        alignment: BadgeAlignment,
        style: BadgeStyle,
        appearance: BadgeAppearance? = nil,
        action: (() -> Void)? = nil
    ) {
        self.label = label
        self.image = image
        self.alignment = alignment
        self.style = style
        self.action = action
        self._appearance = appearance
    }
    
    public var body: some View {
        SDDSButton(
            title: label,
            subtitle: "",
            iconAttributes: iconAttributes,
            isDisabled: false,
            isLoading: false,
            spinnerImage: nil,
            buttonStyle: style.buttonStyle,
            appearance: buttonAppearance,
            layoutMode: .wrapContent,
            isSelected: false,
            action: { action?() }
        )
    }
    
    private var iconAttributes: ButtonIconAttributes? {
        if let image = image {
            return .init(image: image, alignment: alignment.buttonAlignment)
        }
        return nil
    }
    
    private var buttonAppearance: ButtonAppearance {
        let iconColor: ColorToken
        let iconSize: CGSize
        let iconPadding: CGFloat
        switch alignment {
        case .leading:
            iconColor = appearance.startContentColor
            iconSize = appearance.size.startContentSize
            iconPadding = appearance.size.startContentPadding
        case .trailing:
            iconColor = appearance.endContentColor
            iconSize = appearance.size.endContentSize
            iconPadding = appearance.size.endContentPadding
        }
        return appearance.buttonAppearance(iconColor: iconColor, iconSize: iconSize, iconPadding: iconPadding)
    }
    
    var appearance: BadgeAppearance {
        _appearance ?? environmentAppearance
    }
}
