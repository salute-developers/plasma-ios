import Foundation
import SwiftUI

public struct TextFieldClear: View {
    @Binding public var value: TextFieldValue
    public let title: String
    public let optionalTitle: String
    public let placeholder: String
    public let caption: String
    public let textBefore: String
    public let textAfter: String
    public let disabled: Bool
    public let readOnly: Bool
    public let labelPlacement: TextFieldLabelPlacement
    public let required: Bool
    public let divider: Bool
    public let requiredPlacement: TextFieldRequiredPlacement
    public let appearance: TextFieldAppearance
    public let chipGroupAppearance: ChipGroupAppearance
    public let chipGroupGap: ChipGroupGap
    public let accessibility: TextFieldAccessibility
    public let iconViewProvider: ViewProvider?
    public let iconActionViewProvider: ViewProvider?
    
    public init(
        value: Binding<TextFieldValue>,
        title: String = "",
        optionalTitle: String = "",
        placeholder: String = "",
        caption: String = "",
        textBefore: String = "",
        textAfter: String = "",
        disabled: Bool = false,
        readOnly: Bool = false,
        labelPlacement: TextFieldLabelPlacement = .outer,
        required: Bool = false,
        divider: Bool = true,
        requiredPlacement: TextFieldRequiredPlacement = .left,
        appearance: TextFieldAppearance,
        chipGroupAppearance: ChipGroupAppearance,
        chipGroupGap: ChipGroupGap = .dense,
        accessibility: TextFieldAccessibility = TextFieldAccessibility(),
        iconViewProvider: ViewProvider? = nil,
        iconActionViewProvider: ViewProvider? = nil
    ) {
        _value = value
        self.caption = caption
        self.textBefore = textBefore
        self.textAfter = textAfter
        self.disabled = disabled
        self.readOnly = readOnly
        self.labelPlacement = labelPlacement
        self.required = required
        self.divider = divider
        self.requiredPlacement = requiredPlacement
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder
        self.appearance = appearance
        self.chipGroupAppearance = chipGroupAppearance
        self.chipGroupGap = chipGroupGap
        self.accessibility = accessibility
        self.iconViewProvider = iconViewProvider
        self.iconActionViewProvider = iconActionViewProvider
    }
    
    public var body: some View {
        SDDSTextField(
            value: $value,
            title: title,
            optionalTitle: optionalTitle,
            placeholder: placeholder,
            caption: caption,
            textBefore: textBefore,
            textAfter: textAfter,
            disabled: disabled,
            readOnly: readOnly,
            labelPlacement: labelPlacement,
            required: required,
            divider: divider,
            requiredPlacement: requiredPlacement,
            appearance: appearance,
            chipGroupAppearance: chipGroupAppearance,
            chipGroupGap: chipGroupGap,
            layout: .clear,
            accessibility: accessibility,
            iconViewProvider: iconViewProvider,
            iconActionViewProvider: iconActionViewProvider
        )
    }
}
