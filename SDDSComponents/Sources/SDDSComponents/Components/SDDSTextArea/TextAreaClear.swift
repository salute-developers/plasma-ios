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
    public let divider: Bool
    @available(*, deprecated, message: "Don't use dynamicHeight, use heightMode instead.")
    public let dynamicHeight: Bool
    public let heightMode: TextAreaHeightMode
    private let _appearance: TextAreaAppearance?
    public let accessibility: TextAreaAccessibility
    public let iconActionViewProvider: ViewProvider?
    
    @available(*, deprecated, message: "Don't use dynamicHeight, use heightMode instead.")
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
        heightMode: TextAreaHeightMode = .dynamic,
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
        self.dynamicHeight = false
        self.heightMode = heightMode
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
            heightMode: heightMode,
            appearance: _appearance,
            layout: .clear,
            accessibility: accessibility,
            iconActionViewProvider: iconActionViewProvider
        )
    }
}
