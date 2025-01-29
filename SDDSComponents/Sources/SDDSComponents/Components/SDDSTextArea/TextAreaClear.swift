import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSComponents

public struct TextAreaClear: View {
    @Binding public var value: TextAreaValue
    public let title: String
    public let optionalTitle: String
    public let placeholder: String
    public let caption: String
    public let counter: String
    public let disabled: Bool
    public let readOnly: Bool
    public let labelPlacement: TextAreaLabelPlacement
    public let required: Bool
    public let divider: Bool
    public let requiredPlacement: TextAreaRequiredPlacement
    public let dynamicHeight: Bool
    public let appearance: TextAreaAppearance
    public let chipGroupAppearance: ChipGroupAppearance
    public let chipGroupGap: ChipGroupGap
    public let accessibility: TextAreaAccessibility
    public let iconActionViewProvider: ViewProvider?
    
    public init(
        value: Binding<TextAreaValue>,
        title: String = "",
        optionalTitle: String = "",
        placeholder: String = "",
        caption: String = "",
        counter: String = "",
        disabled: Bool = false,
        readOnly: Bool = false,
        labelPlacement: TextAreaLabelPlacement = .outer,
        required: Bool = false,
        divider: Bool = true,
        requiredPlacement: TextAreaRequiredPlacement = .left,
        dynamicHeight: Bool = false,
        appearance: TextAreaAppearance,
        chipGroupAppearance: ChipGroupAppearance,
        chipGroupGap: ChipGroupGap = .dense,
        accessibility: TextAreaAccessibility = TextAreaAccessibility(),
        iconActionViewProvider: ViewProvider? = nil
    ) {
        _value = value
        self.labelPlacement = labelPlacement
        self.caption = caption
        self.counter = counter
        self.disabled = disabled
        self.readOnly = readOnly
        self.required = required
        self.divider = divider
        self.requiredPlacement = requiredPlacement
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder
        self.dynamicHeight = dynamicHeight
        self.appearance = appearance
        self.chipGroupAppearance = chipGroupAppearance
        self.chipGroupGap = chipGroupGap
        self.accessibility = accessibility
        self.iconActionViewProvider = iconActionViewProvider
    }
    
    public var body: some View {
        SDDSTextArea(
            value: $value,
            title: title,
            optionalTitle: optionalTitle,
            placeholder: placeholder,
            caption: caption,
            counter: counter,
            disabled: disabled,
            readOnly: readOnly,
            labelPlacement: labelPlacement,
            required: required,
            divider: divider,
            requiredPlacement: requiredPlacement,
            dynamicHeight: dynamicHeight,
            appearance: appearance,
            chipGroupAppearance: chipGroupAppearance,
            chipGroupGap: chipGroupGap,
            layout: .clear,
            accessibility: accessibility,
            iconActionViewProvider: iconActionViewProvider
        )
    }
    
}
