import Foundation
import SwiftUI

public enum CounterViewProvider {
    case `default`(text: String)
    case custom(viewProvider: ViewProvider, widthCalculator: CounterWidthCalculator)
}

public struct SDDSSegmentItemData: Identifiable, Hashable {
    public var id: UUID
    public var title: String
    public var subtitle: String
    public var iconAttributes: ButtonIconAttributes?
    public var isDisabled: Bool
    public var isSelected: Bool
    public var stretch: Bool
    public var counterEnabled: Bool
    public var appearance: SegmentItemAppearance
    public var accessibility: SegmentItemAccessibility
    public var counterViewProvider: CounterViewProvider
    public var counterWidthCalculator: CounterWidthCalculator?
    public var action: () -> Void
    
    public init(
        id: UUID = UUID(),
        title: String,
        subtitle: String,
        iconAttributes: ButtonIconAttributes?,
        isDisabled: Bool = false,
        isSelected: Bool = false,
        stretch: Bool = false,
        counterEnabled: Bool = false,
        appearance: SegmentItemAppearance,
        accessibility: SegmentItemAccessibility = SegmentItemAccessibility(),
        counterViewProvider: CounterViewProvider = .default(text: ""),
        action: @escaping () -> Void
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.isDisabled = isDisabled
        self.isSelected = isSelected
        self.stretch = stretch
        self.counterEnabled = counterEnabled
        self.appearance = appearance
        self.accessibility = accessibility
        self.counterViewProvider = counterViewProvider
        self.action = action
        
        switch counterViewProvider {
        case .default(let text):
            self.counterWidthCalculator = CounterWidthCalculatorImpl(
                counterAppearance: appearance.counterAppearance,
                counterText: text
            )
        case .custom(_, let calculator):
            self.counterWidthCalculator = calculator
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.uuidString)
    }
    
    public static func == (lhs: SDDSSegmentItemData, rhs: SDDSSegmentItemData) -> Bool {
        lhs.id == rhs.id
    }
}
