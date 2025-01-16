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
                appearance: EmbeddedChip.secondary.large.appearance,
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
                labelPlacement: .inner,
                required: false,
                requiredPlacement: .left,
                dynamicHeight: true,
                appearance: TextAreaClear.default.large.appearance,
                chipGroupAppearance: SDDSChipGroup.large.appearance,
                iconActionViewProvider: ViewProvider(iconActionView)
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
                labelPlacement: .inner,
                required: true,
                requiredPlacement: .right,
                dynamicHeight: true,
                appearance: TextAreaClear.default.large.appearance,
                chipGroupAppearance: SDDSChipGroup.large.appearance,
                iconActionViewProvider: ViewProvider(iconActionView)
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
