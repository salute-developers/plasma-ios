import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct AccordionItemAppearance: Hashable {
    let id = UUID()
    public var titleTypography: TypographyConfiguration
    public var contentTextTypography: TypographyConfiguration
    public var titleColor: ColorToken
    public var contentTextColor: ColorToken
    public var closedIcon: Image?
    public var openedIcon: Image?
    public var backgroundColor: ColorToken
    public var size: AccordionItemSizeConfiguration
    
    public init(
        titleTypography: TypographyConfiguration = .default,
        contentTextTypography: TypographyConfiguration = .default,
        titleColor: ColorToken = .clearColor,
        contentTextColor: ColorToken = .clearColor,
        closedIcon: Image? = nil,
        openedIcon: Image? = nil,
        backgroundColor: ColorToken = .clearColor,
        size: AccordionItemSizeConfiguration = ZeroAccordionItemSize()
    ) {
        self.titleTypography = titleTypography
        self.contentTextTypography = contentTextTypography
        self.titleColor = titleColor
        self.contentTextColor = contentTextColor
        self.closedIcon = closedIcon
        self.openedIcon = openedIcon
        self.backgroundColor = backgroundColor
        self.size = size
    }
    
    public static func == (lhs: AccordionItemAppearance, rhs: AccordionItemAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.titleColor == rhs.titleColor &&
        lhs.contentTextColor == rhs.contentTextColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension AccordionItemAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: AccordionItemAppearance.self, fallback: AccordionItemAppearance())
    }
} 
