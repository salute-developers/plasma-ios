import Foundation
import SwiftUI
import SDDSThemeCore

public struct ListAppearance: Hashable {
    let id = UUID()
    public var listItemAppearance: ListItemAppearance
    public var dividerAppearance: DividerAppearance
    public var scrollBarAppearance: ScrollbarAppearance
    public var backgroundColor: StatefulFillStyle
    public var size: ListSizeConfiguration
    
    public init(
        listItemAppearance: ListItemAppearance = .defaultValue,
        dividerAppearance: DividerAppearance = .defaultValue,
        scrollBarAppearance: ScrollbarAppearance = .defaultValue,
        backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        size: ListSizeConfiguration = ZeroListSize()
    ) {
        self.listItemAppearance = listItemAppearance
        self.dividerAppearance = dividerAppearance
        self.scrollBarAppearance = scrollBarAppearance
        self.backgroundColor = backgroundColor
        self.size = size
    }

    @available(*, deprecated, message: "ColorToken is deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
    public init(
        listItemAppearance: ListItemAppearance = .defaultValue,
        dividerAppearance: DividerAppearance = .defaultValue,
        scrollBarAppearance: ScrollbarAppearance = .defaultValue,
        backgroundColor: ColorToken = .clearColor,
        size: ListSizeConfiguration = ZeroListSize()
    ) {
        self.init(
            listItemAppearance: listItemAppearance,
            dividerAppearance: dividerAppearance,
            scrollBarAppearance: scrollBarAppearance,
            backgroundColor: backgroundColor.statefulColor.statefulFillStyle,
            size: size
        )
    }
    
    public static func == (lhs: ListAppearance, rhs: ListAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.scrollBarAppearance == rhs.scrollBarAppearance &&
        lhs.dividerAppearance == rhs.dividerAppearance &&
        lhs.listItemAppearance == rhs.listItemAppearance &&
        lhs.backgroundColor == rhs.backgroundColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension ListAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        ListAppearance(listItemAppearance: .defaultValue)
    }
} 
