import Foundation
import SwiftUI
import UIKit

public struct TextFieldData {
    public let title: String
    public let optionalTitle: String
    public let placeholder: String
    public let caption: String
    public let textBefore: String
    public let textAfter: String
    public let required: Bool
    public let divider: Bool
    public let mask: TextFieldMask?
    public let maskDisplayMode: MaskDisplayMode
    public let secureEntry: Bool
    public let keyboardType: UIKeyboardType
    public let layout: TextFieldLayout
    public let accessibility: TextFieldAccessibility
    public let appearance: TextFieldAppearance?
    public let iconContent: (() -> AnyView)?
    public let actionContent: (() -> AnyView)?
    public let onMaskComplete: ((Bool) -> Void)?
    
    public init(
        title: String = "",
        optionalTitle: String = "",
        placeholder: String = "",
        caption: String = "",
        textBefore: String = "",
        textAfter: String = "",
        required: Bool = false,
        divider: Bool = true,
        mask: TextFieldMask? = nil,
        maskDisplayMode: MaskDisplayMode = .onInput,
        secureEntry: Bool = false,
        keyboardType: UIKeyboardType = .default,
        layout: TextFieldLayout = .default,
        accessibility: TextFieldAccessibility = TextFieldAccessibility(),
        appearance: TextFieldAppearance? = nil,
        iconContent: (() -> AnyView)? = nil,
        actionContent: (() -> AnyView)? = nil,
        onMaskComplete: ((Bool) -> Void)? = nil
    ) {
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder
        self.caption = caption
        self.textBefore = textBefore
        self.textAfter = textAfter
        self.required = required
        self.divider = divider
        self.mask = mask
        self.maskDisplayMode = maskDisplayMode
        self.secureEntry = secureEntry
        self.keyboardType = keyboardType
        self.layout = layout
        self.accessibility = accessibility
        self.appearance = appearance
        self.iconContent = iconContent
        self.actionContent = actionContent
        self.onMaskComplete = onMaskComplete
    }
}
