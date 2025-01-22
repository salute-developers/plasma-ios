import Foundation
import SwiftUI

public enum CounterViewProvider {
    case `default`(text: String)
    case custom(viewProvider: ViewProvider, widthCalculator: CounterWidthCalculator)
}

public struct SDDSSegmentItemData: Identifiable, Hashable {
    public let id: UUID
    public let title: String
    public let subtitle: String
    public let iconAttributes: ButtonIconAttributes?
    public let isDisabled: Bool
    public let isSelected: Bool
    public let stretch: Bool
    public let appearance: SegmentItemAppearance
    public let accessibility: SegmentItemAccessibility
    public let counterViewProvider: CounterViewProvider
    public let counterWidthCalculator: CounterWidthCalculator?
    public let counterAppearance: CounterAppearance?
    public var action: () -> Void
    
    public init(
        id: UUID = UUID(),
        title: String,
        subtitle: String,
        iconAttributes: ButtonIconAttributes?,
        isDisabled: Bool = false,
        isSelected: Bool = false,
        stretch: Bool = false,
        appearance: SegmentItemAppearance,
        accessibility: SegmentItemAccessibility = SegmentItemAccessibility(),
        counterViewProvider: CounterViewProvider = .default(text: ""),
        counterAppearance: CounterAppearance? = nil,
        action: @escaping () -> Void
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.isDisabled = isDisabled
        self.isSelected = isSelected
        self.stretch = stretch
        self.appearance = appearance
        self.accessibility = accessibility
        self.counterViewProvider = counterViewProvider
        self.counterAppearance = counterAppearance
        self.action = action
        
        switch counterViewProvider {
        case .default(let text):
            self.counterWidthCalculator = CounterWidthCalculatorImpl(
                counterAppearance: counterAppearance,
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
