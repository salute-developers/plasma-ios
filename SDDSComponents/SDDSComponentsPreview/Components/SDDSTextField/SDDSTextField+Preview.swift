import Foundation
import SDDSComponents
import SwiftUI
import SDDSServTheme

// MARK: - Preview

struct SDDSTextFieldPreview: PreviewProvider {
    static var previews: some View {
        let chips = (1...3).map { index in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: Image.image("textFieldChipIcon"),
                appearance: SDDSChip.accent.medium.pilled.appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }
        
        Theme.initialize()
        
        return Group {
            SDDSTextField(
                value: .constant(.single("")),
                title: "Title",
                optionalTitle: "",
                placeholder: "Placeholder",
                caption: "caption",
                textBefore: "",
                textAfter: "",
                disabled: false,
                readOnly: true,
                style: .default,
                labelPlacement: .outer,
                required: true,
                requiredPlacement: .right,
                appearance: .defaultAppearance,
                size: SDDSTextFieldSize.medium,
                layout: .default,
                iconViewProvider: ViewProvider(iconView),
                iconActionViewProvider: ViewProvider(iconActionView)
            )
            .previewDisplayName("Outer Label")
            .previewLayout(.sizeThatFits)
            .padding()
            
            SDDSTextField(
                value: .constant(.single("Sample Text")),
                title: "Title",
                optionalTitle: "optional",
                placeholder: "Placeholder",
                caption: "caption",
                disabled: false,
                style: .default,
                labelPlacement: .none,
                required: true,
                requiredPlacement: .left,
                appearance: .defaultAppearance,
                size: SDDSTextFieldSize.large,
                layout: .clear,
                iconViewProvider: ViewProvider(iconView),
                iconActionViewProvider: ViewProvider(iconActionView)
            )
            .previewDisplayName("Clear – Outer Label")
            .previewLayout(.sizeThatFits)
            .padding()
            
            SDDSTextField(
                value: .constant(.single("Sample Text")),
                title: "Title",
                optionalTitle: "optional",
                placeholder: "Placeholder",
                caption: "caption",
                disabled: false,
                style: .default,
                labelPlacement: .inner,
                required: false,
                requiredPlacement: .left,
                appearance: .defaultAppearance,
                size: SDDSTextFieldSize.large,
                layout: .default,
                iconViewProvider: ViewProvider(iconView),
                iconActionViewProvider: ViewProvider(iconActionView)
            )
            .previewDisplayName("Inner Label")
            .previewLayout(.sizeThatFits)
            .padding()
            
            SDDSTextField(
                value: .constant(.single("Sample Text")),
                title: "Title",
                optionalTitle: "optional",
                placeholder: "Placeholder",
                caption: "caption",
                disabled: false,
                style: .default,
                labelPlacement: .inner,
                required: true,
                requiredPlacement: .left,
                appearance: .defaultAppearance,
                size: SDDSTextFieldSize.large,
                layout: .clear,
                iconViewProvider: ViewProvider(iconView),
                iconActionViewProvider: ViewProvider(iconActionView)
            )
            .previewDisplayName("Clear – Inner Label")
            .previewLayout(.sizeThatFits)
            .padding()
            
            SDDSTextField(
                value: .constant(.single("")),
                title: "Title",
                optionalTitle: "optional",
                placeholder: "Placeholder",
                caption: "caption",
                disabled: false,
                style: .default,
                labelPlacement: .none,
                required: true,
                requiredPlacement: .left,
                appearance: .defaultAppearance,
                size: SDDSTextFieldSize.large,
                layout: .clear,
                iconViewProvider: ViewProvider(iconView),
                iconActionViewProvider: ViewProvider(iconActionView)
            )
            .previewDisplayName("Clear – None Label")
            .previewLayout(.sizeThatFits)
            .padding()
            
            SDDSTextField(
                value: .constant(.multiple("", chips)),
                title: "Title",
                optionalTitle: "optional",
                placeholder: "Placeholder",
                caption: "caption",
                disabled: false,
                style: .default,
                labelPlacement: .outer,
                required: true,
                requiredPlacement: .left,
                appearance: .defaultAppearance,
                size: SDDSTextFieldSize.large,
                layout: .default,
                iconViewProvider: nil,
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
