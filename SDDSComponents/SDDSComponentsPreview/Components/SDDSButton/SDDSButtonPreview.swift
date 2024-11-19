import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

// MARK: - Preview

struct SDDSButtonPreview: PreviewProvider {
    static var previews: some View {
        BasicButton(
            title: "Label",
            subtitle: "Value",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: BasicButton.large.accent.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Basic Button")
        
        LinkButton(
            title: "Label",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: LinkButton.large.accent.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Link Button")
        
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.large.accent.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Icon Button")
        
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.large.accent.pilled.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Icon Button – Pilled")
    }
    
}
