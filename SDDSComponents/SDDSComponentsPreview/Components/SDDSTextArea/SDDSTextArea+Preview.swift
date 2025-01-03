import Foundation
import SDDSComponents
import SwiftUI
import SDDSServTheme

// MARK: - Preview

struct SDDSTextAreaPreview: PreviewProvider {
    static var previews: some View {
        let chips = (1...12).map { index in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: Image.image("textFieldChipIcon"),
                appearance: .textArea,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }
        
        return Group {
            SDDSTextArea(
                value: .constant(.single("hi")),
                title: "Title",
                optionalTitle: "optional",
                placeholder: "Placeholder",
                caption: "caption",
                counter: "counter",
                disabled: false,
                readOnly: false,
                style: .default,
                labelPlacement: .inner,
                required: true,
                requiredPlacement: .left,
                dynamicHeight: true,
                appearance: .defaultAppearance,
                size: SDDSTextAreaSize.large,
                chipGroupSize: SDDSTextAreaSize.large.chipGroupSize,
                layout: .clear,
                iconActionViewProvider: ViewProvider(iconActionView)
            )
            .previewDisplayName("Outer Label")
            .previewLayout(.sizeThatFits)
            .padding()
            
            SDDSTextArea(
                value: .constant(.multiple("", chips)),
                title: "Title",
                optionalTitle: "",
                placeholder: "Placeholder",
                caption: "caption",
                counter: "counter",
                disabled: false,
                style: .default,
                labelPlacement: .inner,
                required: true,
                requiredPlacement: .right,
                dynamicHeight: true,
                appearance: .defaultAppearance,
                size: SDDSTextAreaSize.large,
                chipGroupSize: SDDSTextAreaSize.large.chipGroupSize,
                layout: .clear,
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
