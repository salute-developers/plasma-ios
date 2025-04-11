import Foundation
import SwiftUI

public struct SDDSSegmentItem: View {
    public let id: UUID
    public let title: String
    public let subtitle: String
    public let iconAttributes: ButtonIconAttributes?
    public let isDisabled: Bool
    public let isSelected: Bool
    public let strech: Bool
    public let counterEnabled: Bool
    private let _appearance: SegmentItemAppearance?
    public let accessibility: SegmentItemAccessibility
    public let counterViewProvider: CounterViewProvider?
    public var action: () -> Void
    
    @Environment(\.segmentItemAppearance) private var environmentAppearance
    
    public init(item: SDDSSegmentItemData) {
        self.id = item.id
        self.title = item.title
        self.subtitle = item.subtitle
        self.iconAttributes = item.iconAttributes
        self.isSelected = item.isSelected
        self.isDisabled = item.isDisabled
        self.strech = item.stretch
        self.counterEnabled = item.counterEnabled
        self._appearance = item.appearance
        self.accessibility = item.accessibility
        self.counterViewProvider = item.counterViewProvider
        self.action = item.action
    }
    
    public init(
        id: UUID = UUID(),
        title: String,
        subtitle: String,
        iconAttributes: ButtonIconAttributes?,
        isDisabled: Bool = false,
        isSelected: Bool,
        strech: Bool = false,
        counterEnabled: Bool = false,
        appearance: SegmentItemAppearance? = nil,
        accessibility: SegmentItemAccessibility = SegmentItemAccessibility(),
        counterViewProvider: CounterViewProvider? = nil,
        counterText: String = "",
        action: @escaping () -> Void = {}
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.isDisabled = isDisabled
        self.isSelected = isSelected
        self.strech = strech
        self.counterEnabled = counterEnabled
        self._appearance = appearance
        self.accessibility = accessibility
        self.counterViewProvider = counterViewProvider
        self.action = action
    }
    
    public var body: some View {
        SDDSButton(
            title: title,
            subtitle: hasSubtitle ? subtitle : "",
            iconAttributes: hasIconAttributes ? iconAttributes : nil,
            isDisabled: isDisabled,
            isLoading: false,
            spinnerImage: nil,
            buttonStyle: .basic,
            appearance: buttonAppearance,
            layoutMode: strech ? .fixedWidth(.packed) : .wrapContent,
            counterViewProvider: counterView,
            isSelected: isSelected,
            action: action
        )
    }
    
    private var buttonAppearance: ButtonAppearance {
        .init(
            size: buttonSize,
            shapeStyle: appearance.shapeStyle,
            titleTypography: OneSizeTypography<ButtonSizeConfiguration>(token: appearance.titleTypography.typography(with: appearance.size)).asContainer,
            titleColor: appearance.titleColor,
            subtitleTypography: OneSizeTypography<ButtonSizeConfiguration>(token: appearance.subtitleTypography.typography(with: appearance.size)).asContainer,
            subtitleColor: appearance.subtitleColor,
            iconColor: iconAttributes?.alignment == .leading ? appearance.startContentColor : appearance.endContentColor,
            backgroundColor: appearance.backgroundColor,
            disabledAlpha: appearance.disabledAlpha
        )
    }
    
    private var buttonSize: ButtonSizeConfiguration {
        var size = DefaultButtonSize()
        size.height = appearance.size.height
        size.cornerRadius = appearance.size.cornerRadius
        size.iconSize = iconAttributes?.alignment == .leading ? appearance.size.startContentSize : appearance.size.endContentSize
        size.counterSize = appearance.counterAppearance.size
        size.iconHorizontalGap = appearance.size.iconHorizontalGap
        size.titleHorizontalGap = appearance.size.titleHorizontalGap
        size.paddings = appearance.size.paddings
        return size
    }
}

extension SDDSSegmentItem {
    private var hasIconAttributes: Bool {
        iconAttributes != nil
    }
    
    private var hasSubtitle: Bool {
        !subtitle.isEmpty
    }
    
    private var counterView: ViewProvider? {
        guard let counterViewProvider = counterViewProvider, counterEnabled else {
            return nil
        }
        switch counterViewProvider {
        case .default(let text):
            return ViewProvider(
                SDDSCounter(
                    text: text,
                    appearance: appearance.counterAppearance,
                    isAnimating: false,
                    isHighlighted: false,
                    isHovered: false,
                    isSelected: isSelected
                )
            )
        case .custom(let viewProvider, _):
            return viewProvider
        }
    }
    
    private var appearance: SegmentItemAppearance {
        _appearance ?? environmentAppearance
    }
}
