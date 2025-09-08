import Foundation
import SwiftUI

public struct TabBarItemData: Identifiable {
    public let id = UUID()
    public let content: AnyView?
    public let selectedContent: AnyView?
    public let text: String
    public let contentWidth: CGFloat?
    public let allowSelection: Bool
    public let appearance: TabBarItemAppearance?
    public let extra: AnyView?
    public let onTap: (() -> Void)?
    
    public init(
        content: AnyView?,
        selectedContent: AnyView? = nil,
        text: String = "",
        contentWidth: CGFloat? = nil,
        allowSelection: Bool = true,
        appearance: TabBarItemAppearance? = nil,
        extra: AnyView? = nil,
        onTap: (() -> Void)? = nil
    ) {
        self.content = content
        self.selectedContent = selectedContent
        self.text = text
        self.contentWidth = contentWidth
        self.allowSelection = allowSelection
        self.appearance = appearance
        self.extra = extra
        self.onTap = onTap
    }
}
