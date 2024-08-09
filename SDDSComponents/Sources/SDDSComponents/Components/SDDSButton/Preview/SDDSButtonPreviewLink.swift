import Foundation
import SwiftUI

// MARK: - Preview: Link Buttons
struct SDDSButtonPreviewLink: PreviewProvider {
    static var previews: some View {
        Group {
            SDDSButton.linkButton(size: .medium)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Large circle button with icon")
        }
    }
}

// MARK: - Extension to Generate Circle Buttons
extension SDDSButton {
    static func linkButton(size: ButtonSize, isLoading: Bool = false, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButton {
        SDDSButton(
            title: "Label",
            subtitle: "",
            size: size,
            isDisabled: true,
            appearance: .transparent,
            layoutMode: layoutMode,
            action: {}
        )
    }
}
