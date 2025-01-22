import Foundation
import SwiftUI

public struct SDDSSegmentItem: View {
    public let id: UUID
    public let title: String
    public let subtitle: String
    public let iconAttributes: ButtonIconAttributes?
    public let isDisabled: Bool
    public let appearance: SegmentItemAppearance
    public let accessibility: SegmentItemAccessibility
    public let counterAppearance: CounterAppearance?
    public let counterText: String
    public let isSelected: Bool
    public var action: () -> Void
    
    public init(
        id: UUID = UUID(),
        title: String,
        subtitle: String,
        iconAttributes: ButtonIconAttributes?,
        isDisabled: Bool = false,
        appearance: SegmentItemAppearance,
        accessibility: SegmentItemAccessibility = SegmentItemAccessibility(),
        counterAppearance: CounterAppearance? = CounterAppearance(),
        counterText: String,
        isSelected: Bool = false,
        action: @escaping () -> Void
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.isDisabled = isDisabled
        self.appearance = appearance
        self.accessibility = accessibility
        self.counterAppearance = counterAppearance
        self.counterText = counterText
        self.isSelected = isSelected
        self.action = action
    }
    
    @ViewBuilder
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
            counterView: hasCounter ? counterView : nil,
            action: action
        )
    }
}

extension SDDSSegmentItem {
    var hasIconAttributes: Bool {
        iconAttributes != nil
    }
    
    var isIconLeading: Bool {
        if let iconAttributes = iconAttributes, iconAttributes.alignment == .leading {
            return true
        }
        return false
    }
    
    var hasCounter: Bool {
        counterAppearance != nil
    }
    
    var hasTitle: Bool {
        !title.isEmpty
    }
    
    var hasSubtitle: Bool {
        !subtitle.isEmpty
    }
    
    var counterView: SDDSCounter? {
        guard let appearance = counterAppearance else { return nil }
        
        return SDDSCounter(
            text: counterText,
            appearance: appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false
        )
    }
}
