import Foundation
import SDDSComponents
import SwiftUI
import SDDSServTheme

// MARK: - Preview

struct TextAreaClearPreview: PreviewProvider {
    static var previews: some View {
        let chips = (1...12).map { index in
            ChipData(
                title: "ChipTitle",
                isEnabled: true,
                iconImage: nil,
                buttonImage: Image.image("textFieldChipIcon"),
                appearance: EmbeddedChip.l.secondary.appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }
        
        return Group {
            TextAreaClear(
                value: .constant(.single("Value")),
                title: "Title",
                optionalTitle: "optional",
                placeholder: "Placeholder",
                caption: "caption",
                counter: "counter",
                disabled: false,
                readOnly: false,
                appearance: TextAreaClear.l.default.appearance,
                layout: .clear
            )
            .previewDisplayName("Outer Label")
            .previewLayout(.sizeThatFits)
            .padding()
            
            TextAreaClear(
                value: .constant(.multiple("", chips)),
                title: "Title",
                optionalTitle: "",
                placeholder: "Placeholder",
                caption: "caption",
                counter: "counter",
                disabled: false,
                appearance: TextAreaClear.l.default.appearance,
                layout: .clear
            )
            .previewDisplayName("Multiple – Default Label")
            .previewLayout(.sizeThatFits)
            .padding()
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
