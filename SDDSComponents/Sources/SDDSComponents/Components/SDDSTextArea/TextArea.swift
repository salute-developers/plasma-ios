import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSComponents

public struct TextArea: View {
    @Binding public var value: TextAreaValue
    public let title: String
    public let optionalTitle: String
    public let placeholder: String
    public let caption: String
    public let counter: String
    public let disabled: Bool
    public let readOnly: Bool
    public let divider: Bool
    public let dynamicHeight: Bool
    private let _appearance: TextAreaAppearance?
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
        divider: Bool = true,
        dynamicHeight: Bool = false,
        appearance: TextAreaAppearance? = nil,
        accessibility: TextAreaAccessibility = TextAreaAccessibility(),
        iconActionViewProvider: ViewProvider? = nil
    ) {
        _value = value
        self.caption = caption
        self.counter = counter
        self.disabled = disabled
        self.readOnly = readOnly
        self.divider = divider
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder
        self.dynamicHeight = dynamicHeight
        self._appearance = appearance
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
            divider: divider,
            dynamicHeight: dynamicHeight,
            appearance: _appearance,
            layout: .default,
            accessibility: accessibility,
            iconActionViewProvider: iconActionViewProvider
        )
    }
}
