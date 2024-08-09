import Foundation
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
            
            SDDSButton.circleButton(size: .xs)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("XS circle button with icon")
            
            SDDSButton.circleButton(size: .xxs)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("XXS circle button with icon")
        }
    }
}

// MARK: - Extension to Generate Circle Buttons
extension SDDSButton {
    static func circleButton(size: ButtonSize, isLoading: Bool = false, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButton {
        SDDSButton(
            title: "",
            subtitle: "",
            iconAttributes: ButtonIconAttributes(image: Image(systemName: "pencil.circle.fill"), alignment: .left),
            size: size,
            isLoading: isLoading,
            buttonStyle: .circle,
            appearance: .black,
            layoutMode: layoutMode,
            action: {}
        )
    }
}
