import Foundation
import SwiftUI
import SDDSThemeCore

public struct AccordionAppearance: Hashable {
    let id = UUID()
    public var accordionItemAppearance: AccordionItemAppearance
    public var dividerAppearance: DividerAppearance
    public var size: AccordionSizeConfiguration
    
    public init(
        accordionItemAppearance: AccordionItemAppearance = .defaultValue,
        dividerAppearance: DividerAppearance = .defaultValue,
        size: AccordionSizeConfiguration = ZeroAccordionSize()
    ) {
        self.accordionItemAppearance = accordionItemAppearance
        self.dividerAppearance = dividerAppearance
        self.size = size
    }
    
    public static func == (lhs: AccordionAppearance, rhs: AccordionAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.dividerAppearance == rhs.dividerAppearance &&
        lhs.accordionItemAppearance == rhs.accordionItemAppearance
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension AccordionAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        AccordionAppearance(accordionItemAppearance: .defaultValue)
    }
} 