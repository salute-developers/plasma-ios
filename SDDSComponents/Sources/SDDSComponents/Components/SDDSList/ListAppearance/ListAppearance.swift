import Foundation
import SwiftUI
import SDDSThemeCore

public struct ListAppearance: Hashable {
    let id = UUID()
    public var listItemAppearance: ListItemAppearance
    public var dividerAppearance: DividerAppearance
    public var scrollBarAppearance: ScrollbarAppearance
    public var size: ListSizeConfiguration
    
    public init(
        listItemAppearance: ListItemAppearance = .defaultValue,
        dividerAppearance: DividerAppearance = .defaultValue,
        scrollBarAppearance: ScrollbarAppearance = .defaultValue,
        size: ListSizeConfiguration = ZeroListSize()
    ) {
        self.listItemAppearance = listItemAppearance
        self.dividerAppearance = dividerAppearance
        self.scrollBarAppearance = scrollBarAppearance
        self.size = size
    }
    
    public static func == (lhs: ListAppearance, rhs: ListAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.scrollBarAppearance == rhs.scrollBarAppearance &&
        lhs.dividerAppearance == rhs.dividerAppearance &&
        lhs.listItemAppearance == rhs.listItemAppearance
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
