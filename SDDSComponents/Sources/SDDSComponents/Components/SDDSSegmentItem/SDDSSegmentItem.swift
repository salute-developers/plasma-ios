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
    @Binding public var isSelected: Bool
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
        isSelected: Binding<Bool>,
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
        self._isSelected = isSelected
        self.action = action
    }
    
    public init(
        data: SDDSSegmentItemData
    ) {
        self.id = data.id
        self.title = data.title
        self.subtitle = data.subtitle
        self.iconAttributes = data.iconAttributes
        self.isDisabled = data.isDisabled
        self.appearance = data.appearance
        self.accessibility = data.accessibility
        self.counterAppearance = data.counterAppearance
        self.counterText = data.counterText
        self._isSelected = data.isSelected
        self.action = data.action
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
            counterView: hasCounter ? counterView : nil,
            action: action
        )
        .onTapGesture {
            isSelected.toggle()
            print("Item ID: \(id), isSelected: \(isSelected)")
        }
    }
}

extension SDDSSegmentItem {
    var hasIconAttributes: Bool {
        iconAttributes != nil
    }
    
    var hasCounter: Bool {
        counterAppearance != nil
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
