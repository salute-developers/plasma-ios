import Foundation
import SDDSComponents
import SwiftUI
import SDDSServTheme

// MARK: - Preview

struct TextFieldClearPreview: PreviewProvider {
    static var previews: some View {
        let chips = (1...3).map { index in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: Image.image("textFieldChipIcon"),
                appearance: EmbeddedChip.l.secondary.appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }
        
        Theme.initialize()
        
        return Group {
            TextFieldClear(
                value: .constant(.single("")),
                title: "Title",
                optionalTitle: "optional",
                placeholder: "Placeholder",
                caption: "caption",
                textBefore: "",
                textAfter: "",
                disabled: false,
                readOnly: false,
                appearance: TextField.l.default.appearance,
                iconViewProvider: ViewProvider(iconView),
                iconActionViewProvider: ViewProvider(iconActionView)
            )
            .previewDisplayName("Outer Label")
            .previewLayout(.sizeThatFits)
            
            TextFieldClear(
                value: .constant(.multiple("", chips)),
                title: "Title",
                optionalTitle: "optional",
                placeholder: "Placeholder",
                caption: "caption",
                disabled: false,
                appearance: TextField.l.default.appearance,
                iconViewProvider: nil,
                iconActionViewProvider: ViewProvider(iconActionView)
            )
            .previewDisplayName("Multiple – Default Label")
            .previewLayout(.sizeThatFits)
        }
    }
    
    @ViewBuilder
    private static var iconView: some View {
        Image.image("textFieldIcon")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    @ViewBuilder
    private static var iconActionView: some View {
        Image.image("textFieldIconAction")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
