import Foundation
import SwiftUI
import Combine
@_exported import SDDSThemeCore

public struct SDDSCodeField: View {
    let groups: [CodeFieldGroup]
    let validation: CodeFieldValidation
    let caption: String
    let captionAlignment: CodeFieldAlignment
    let keyboardType: UIKeyboardType
    let isHidden: Bool
    let onCodeChanged: (String) -> Void
    
    private var _appearance: CodeFieldAppearance?
    @Environment(\.codeFieldAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @Binding private var validationResult: CodeFieldValidationResult
    @Binding private var code: String
    @State private var isFocused: Bool
    @State private var isAnimating: Bool = false
    
    public init(
        code: Binding<String>,
        groups: [CodeFieldGroup],
        validation: CodeFieldValidation = CodeFieldDisabledValidation(),
        validationResult: Binding<CodeFieldValidationResult>,
        caption: String = "",
        captionAlignment: CodeFieldAlignment = .center,
        keyboardType: UIKeyboardType = .default,
        isFocused: Bool = false,
        isHidden: Bool = false,
        appearance: CodeFieldAppearance? = nil,
        isAnimating: Bool = false,
        onCodeChanged: @escaping (String) -> Void
    ) {
        self._code = code
        self.groups = groups
        self.validation = validation
        self._validationResult = validationResult
        self.caption = caption
        self.captionAlignment = captionAlignment
        self.keyboardType = keyboardType
        self.isHidden = isHidden
        self._appearance = appearance
        self.onCodeChanged = onCodeChanged
        self.isFocused = isFocused
        self._isAnimating = State(initialValue: isAnimating)
    }
    
    public var body: some View {
        CoreInputView(
            code: $code,
            groups: groups,
            validation: validation,
            validationResult: $validationResult,
            caption: caption,
            captionAlignment: captionAlignment,
            keyboardType: keyboardType,
            isFocused: isFocused,
            isHidden: isHidden,
            isAnimating: isAnimating,
            inputMode: .field,
            valueColor: appearance.valueColor,
            valueColorError: appearance.valueColorError,
            backgroundColor: appearance.backgroundColor,
            backgroundColorActivated: appearance.backgroundColorActivated,
            backgroundColorError: appearance.backgroundColorError,
            cursorColor: appearance.cursorColor,
            captionColor: appearance.captionColor,
            captionColorError: appearance.captionColorError,
            dotColor: appearance.dotColor,
            dotColorError: appearance.dotColorError,
            valueTypography: appearance.valueTypography.typography(with: appearance.size) ?? .undefined,
            captionTypography: appearance.captionTypography.typography(with: appearance.size) ?? .undefined,
            // Size parameters
            itemWidth: appearance.size.width,
            itemHeight: appearance.size.height,
            itemSpacing: appearance.size.itemSpacing,
            groupSpacing: appearance.size.groupSpacing,
            captionSpacing: appearance.size.captionSpacing,
            dotSize: appearance.size.dotSize,
            itemShape: appearance.size.itemShape,
            groupShape: appearance.size.groupShape
        )
    }
    
    private var appearance: CodeFieldAppearance {
        _appearance ?? environmentAppearance
    }
}
