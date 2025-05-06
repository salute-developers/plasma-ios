import Foundation
import SwiftUI

public struct TextFieldClear<IconContent: View, ActionContent: View>: View {
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
    private let _appearance: TextFieldAppearance?
    public let accessibility: TextFieldAccessibility
    @available(*, deprecated, message: "Don't use it, public property will be removed")
    public let iconViewProvider: ViewProvider?
    @available(*, deprecated, message: "Don't use it, public property will be removed")
    public let iconActionViewProvider: ViewProvider?
    public let actionContent: Action<ActionContent>
    public let iconContent: Action<IconContent>
    
    @available(*, deprecated, message: "Don't use it, public method will be removed")
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
        divider: Bool = true,
        appearance: TextFieldAppearance? = nil,
        accessibility: TextFieldAccessibility = TextFieldAccessibility(),
        iconViewProvider: ViewProvider? = nil,
        iconActionViewProvider: ViewProvider? = nil,
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
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder
        self._appearance = appearance
        self.accessibility = accessibility
        if let icon = iconViewProvider,
           let castedIcon = AnyViewWrapperView(view: icon.view) as? IconContent {
            self.iconContent = .init { castedIcon }
        } else {
            self.iconContent = iconContent
        }

        if let action = iconActionViewProvider,
           let castedAction = AnyViewWrapperView(view: action.view) as? ActionContent {
            self.actionContent = .init { castedAction }
        } else {
            self.actionContent = actionContent
        }
        self.iconViewProvider = nil
        self.iconActionViewProvider = nil
    }
    
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
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder
        self._appearance = appearance
        self.accessibility = accessibility
        self.iconContent = iconContent
        self.actionContent = actionContent
        self.iconViewProvider = nil
        self.iconActionViewProvider = nil
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
            appearance: _appearance,
            layout: .clear,
            accessibility: accessibility,
            iconViewProvider: nil,
            iconActionViewProvider: nil,
            iconContent: iconContent,
            actionContent: actionContent
        )
    }
}
