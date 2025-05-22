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
                    backgrtoundColor: ColorToken.surfaceDefaultAccent,
                    blurRadius: 10
                )
            )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("View without overlay")
        
        basicButton
            .overlay(
                isPresented: .constant(true),
                appearance: OverlayAppearance(
                    backgrtoundColor: ColorToken.clearColor,
                    blurRadius: 2
                )
            )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("View with blur")
        
        basicButton
            .overlay(
                isPresented: .constant(true),
                appearance: OverlayAppearance(
                    backgrtoundColor: ColorToken.textDefaultInfo,
                    blurRadius: 0
                )
            )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("View with backgroundColor")
    }
}
