import SwiftUI

/// Элемент вкладки с идентификатором
public struct TabItem: Identifiable {
    public let id: String
    public let view: AnyView
    public let label: String?
    public let isDisabled: Bool
    
    public init<StartContent: View, ContentRight: View, ActionContent: View>(
        id: String = UUID().uuidString,
        tabItem: SDDSTabItem<StartContent, ContentRight, ActionContent>,
        label: String? = nil,
        isDisabled: Bool = false
    ) {
        self.id = id
        self.view = AnyView(tabItem)
        self.label = label
        self.isDisabled = isDisabled
    }
}

