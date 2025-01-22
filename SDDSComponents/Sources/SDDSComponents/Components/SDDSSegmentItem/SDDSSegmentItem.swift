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
    public let appearance: SegmentItemAppearance
    public let accessibility: SegmentItemAccessibility
    public let counterViewProvider: CounterViewProvider?
    public let counterAppearance: CounterAppearance?
    public var action: () -> Void
    
    public init(item: SDDSSegmentItemData) {
        self.id = item.id
        self.title = item.title
        self.subtitle = item.subtitle
        self.iconAttributes = item.iconAttributes
        self.isSelected = item.isSelected
        self.isDisabled = item.isDisabled
        self.strech = item.stretch
        self.appearance = item.appearance
        self.accessibility = item.accessibility
        self.counterViewProvider = item.counterViewProvider
        self.counterAppearance = item.counterAppearance
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
        appearance: SegmentItemAppearance,
        accessibility: SegmentItemAccessibility = SegmentItemAccessibility(),
        counterViewProvider: CounterViewProvider? = nil,
        counterAppearance: CounterAppearance? = nil,
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
        self.appearance = appearance
        self.accessibility = accessibility
        self.counterViewProvider = counterViewProvider
        self.counterAppearance = counterAppearance
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
            appearance: appearance.buttonAppearance,
            layoutMode: strech ? .fixedWidth(.packed) : .wrapContent,
            counterViewProvider: counterView,
            isSelected: isSelected,
            action: action
        )
    }
}

extension SDDSSegmentItem {
    var hasIconAttributes: Bool {
        iconAttributes != nil
    }
    
    var hasSubtitle: Bool {
        !subtitle.isEmpty
    }
    
    var counterView: ViewProvider? {
        guard let counterViewProvider = counterViewProvider else {
            return nil
        }
        switch counterViewProvider {
        case .default(let text):
            guard let appearance = counterAppearance else {
                return nil
            }
            return ViewProvider(
                SDDSCounter(
                    text: text,
                    appearance: appearance,
                    isAnimating: false,
                    isHighlighted: false,
                    isHovered: false
                )
            )
        case .custom(let viewProvider, _):
            return viewProvider
        }
    }
}
