import Foundation
import SwiftUI

public struct SDDSSegmentItemData: Hashable {
    let id: UUID
    public var title: String
    public var subtitle: String
    public var iconAttributes: ButtonIconAttributes?
    public var isDisabled: Bool
    public var appearance: SegmentItemAppearance
    public var accessibility: SegmentItemAccessibility
    public var counterAppearance: CounterAppearance?
    public var counterText: String
    public var isSelected: Bool
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
        isSelected: Bool,
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
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.uuidString)
    }
    
    public static func == (lhs: SDDSSegmentItemData, rhs: SDDSSegmentItemData) -> Bool {
        lhs.id == rhs.id
    }
}
