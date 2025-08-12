import Foundation
import SwiftUI

public struct TabBarItemData: Identifiable {
    public let id = UUID()
    public let content: AnyView?
    public let selectedContent: AnyView?
    public let text: String
    public let appearance: TabBarItemAppearance?
    public let extra: AnyView?
    public let onTap: (() -> Void)?
    
    public init(
        content: AnyView?,
        selectedContent: AnyView? = nil,
        text: String = "",
        appearance: TabBarItemAppearance? = nil,
        extra: AnyView? = nil,
        onTap: (() -> Void)? = nil
    ) {
        self.content = content
        self.selectedContent = selectedContent
        self.text = text
        self.appearance = appearance
        self.extra = extra
        self.onTap = onTap
    }
}
