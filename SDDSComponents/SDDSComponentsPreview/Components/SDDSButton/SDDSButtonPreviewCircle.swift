import Foundation
import SDDSComponents
import SwiftUI

// MARK: - Preview: Circle Buttons
struct SDDSButtonPreviewCircle: PreviewProvider {
    static var previews: some View {
        Group {
            SDDSButton.circleButton(size: .large)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Large circle button with icon")
            
            SDDSButton.circleButton(size: .large, isLoading: true)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Large circle button with icon and loading")
            
            SDDSButton.circleButton(size: .medium)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Medium circle button with icon")
            
            SDDSButton.circleButton(size: .small)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Small circle button with icon")
            
            SDDSButton.circleButton(size: .extraSmall)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("XS circle button with icon")
            
            SDDSButton.circleButton(size: .extraExtraSmall)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("XXS circle button with icon")
        }
    }
}

// MARK: - Extension to Generate Circle Buttons
extension SDDSButton {
    static func circleButton(size: ButtonSize, isLoading: Bool = false, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButton {
        SDDSButton.iconButtonCircle(
            iconImage: Image(systemName: "pencil.circle.fill"),
            size: size,
            style: .default,
            isDisabled: false,
            isLoading: isLoading,
            spinnerStyle: .solid,
            layoutMode: layoutMode,
            action: {}
        )
    }
}
