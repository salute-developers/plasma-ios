import SwiftUI
import Foundation

public struct BasicBadge: View {
    @Environment(\.badgeAppearance) private var badgeAppearance
    private let _appearance: BadgeAppearance?
    
    let label: String
    let image: Image?
    let alignment: BadgeAlignment
    let action: (() -> Void)?
    
    public init(
        label: String,
        image: Image?,
        alignment: BadgeAlignment,
        style: BadgeStyle,
        appearance: BadgeAppearance? = nil,
        action: (() -> Void)? = nil
    ) {
        self.label = label
        self.image = image
        self.alignment = alignment
        self.action = action
        self._appearance = appearance
    }
    
    public var body: some View {
        SDDSBadge(
            label: label,
            image: image,
            alignment: alignment,
            style: .basic,
            appearance: appearance
        )
    }
    
    private var appearance: BadgeAppearance {
        _appearance ?? badgeAppearance
    }
}
