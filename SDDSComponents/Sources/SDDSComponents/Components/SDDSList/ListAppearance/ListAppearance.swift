import Foundation
import SwiftUI
import SDDSThemeCore

public struct ListAppearance: Hashable {
    let id = UUID()
    public var listItemAppearance: ListItemAppearance
    public var size: ListSizeConfiguration
    
    public init(
        listItemAppearance: ListItemAppearance = .defaultValue,
        size: ListSizeConfiguration = ZeroListSize()
    ) {
        self.listItemAppearance = listItemAppearance
        self.size = size
    }
    
    public static func == (lhs: ListAppearance, rhs: ListAppearance) -> Bool {
        lhs.id == rhs.id &&
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
