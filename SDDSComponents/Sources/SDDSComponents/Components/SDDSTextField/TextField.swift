import Foundation
import SwiftUI

public struct TextField<IconContent: View, ActionContent: View>: View {
    @Binding public var value: TextFieldValue
    public let title: String
    public let optionalTitle: String
    public let placeholder: String
    public let caption: String
    public let textBefore: String
    public let textAfter: String
    public let disabled: Bool
    public let readOnly: Bool
    public let divider: Bool
    public let secureEntry: Bool
    public let keyboardType: UIKeyboardType
    private let _appearance: TextFieldAppearance?
    public let accessibility: TextFieldAccessibility
    public let actionContent: Action<ActionContent>
    public let iconContent: Action<IconContent>
        
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
        required: Bool = false,
        divider: Bool = true,
        secureEntry: Bool = false,
        keyboardType: UIKeyboardType = .default,
        appearance: TextFieldAppearance? = nil,
        layout: TextFieldLayout = .default,
        accessibility: TextFieldAccessibility = TextFieldAccessibility(),
        iconContent: Action<IconContent> = Action { EmptyView() },
        actionContent: Action<ActionContent> = Action { EmptyView() }
    ) {
        _value = value
        self.caption = caption
        self.textBefore = textBefore
        self.textAfter = textAfter
        self.disabled = disabled
        self.readOnly = readOnly
        self.divider = divider
        self.secureEntry = secureEntry
        self.keyboardType = keyboardType
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder
        self._appearance = appearance
        self.accessibility = accessibility
        self.iconContent = iconContent
        self.actionContent = actionContent
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
            divider: divider,
            secureEntry: secureEntry,
            keyboardType: keyboardType,
            appearance: _appearance,
            layout: .default,
            accessibility: accessibility,
            iconContent: iconContent,
            actionContent: actionContent
        )
    }
}

public extension TextField where IconContent == AnyView, ActionContent == AnyView {
    init(
        value: Binding<TextFieldValue>,
        data: TextFieldData,
        disabled: Bool = false,
        readOnly: Bool = false
    ) {
        self.init(
            value: value,
            title: data.title,
            optionalTitle: data.optionalTitle,
            placeholder: data.placeholder,
            caption: data.caption,
            textBefore: data.textBefore,
            textAfter: data.textAfter,
            disabled: disabled,
            readOnly: readOnly,
            required: data.required,
            divider: data.divider,
            secureEntry: data.secureEntry,
            keyboardType: data.keyboardType,
            appearance: data.appearance,
            layout: data.layout,
            accessibility: data.accessibility,
            iconContent: Action {
                data.iconContent?() ?? AnyView(EmptyView())
            },
            actionContent: Action {
                data.actionContent?() ?? AnyView(EmptyView())
            }
        )
    }
}
