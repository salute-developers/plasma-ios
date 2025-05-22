import SwiftUI
import SDDSComponents
import SDDSServTheme

struct SDDSOverlayPreview: PreviewProvider {
    static var basicButton: some View {
        ZStack {
            BasicButton(
                title: "Label",
                subtitle: "Value",
                iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                isDisabled: false,
                isLoading: false,
                spinnerImage: Image.image("spinner"),
                appearance: BasicButton.l.accent.appearance,
                layoutMode: .wrapContent,
                action: {}
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    static var previews: some View {
        basicButton
            .overlay(
                isPresented: .constant(false),
                appearance: OverlayAppearance(
                    backgroundColor: ColorToken.surfaceDefaultAccent,
                    blurRadius: 10
                )
            )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("View without overlay")
        
        basicButton
            .overlay(
                isPresented: .constant(true),
                appearance: OverlayAppearance(
                    backgroundColor: ColorToken.clearColor,
                    blurRadius: 2
                )
            )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("View with blur")
        
        basicButton
            .overlay(
                isPresented: .constant(true),
                appearance: OverlayAppearance(
                    backgroundColor: ColorToken.overlayDefaultSoft,
                    blurRadius: 0
                )
            )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("View with backgroundColor")
        
        basicButton
            .overlay(
                isPresented: .constant(true),
                appearance: Overlay.default.appearance
            )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("View with basic appearance")
    }
}
