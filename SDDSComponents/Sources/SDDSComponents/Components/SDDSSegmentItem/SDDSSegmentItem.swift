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
    
    @Environment(\.segmentItemAppearance) private var segmentItemAppearance
    
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
        appearance: SegmentItemAppearance,
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
                    isHovered: false
                )
            )
        case .custom(let viewProvider, _):
            return viewProvider
        }
    }
    
    private var appearance: SegmentItemAppearance {
        _appearance ?? segmentItemAppearance
    }
}
