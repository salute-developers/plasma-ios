import Foundation
import SwiftUI
import Combine
@_exported import SDDSThemeCore

public struct SDDSCodeInput: View {
    let groups: [CodeFieldGroup]
    let validation: CodeFieldValidation
    let caption: String
    let captionAlignment: CodeFieldAlignment
    let keyboardType: UIKeyboardType
    let isHidden: Bool
    
    private var _appearance: CodeInputAppearance?
    @Environment(\.codeInputAppearance) private var environmentAppearance
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
        appearance: CodeInputAppearance? = nil,
        isAnimating: Bool = false
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
            inputMode: .input,
            valueColor: appearance.codeColor,
            valueColorError: appearance.codeColorError,
            backgroundColor: .clearColor,
            backgroundColorActivated: .clearColor,
            backgroundColorError: .clearColor,
            cursorColor: .clearColor,
            captionColor: appearance.captionColor,
            captionColorError: appearance.captionColorError,
            dotColor: .clearColor,
            dotColorError: .clearColor,
            valueTypography: appearance.codeTypography.typography(with: appearance.size) ?? .undefined,
            captionTypography: appearance.captionTypography.typography(with: appearance.size) ?? .undefined,
            strokeColor: appearance.strokeColor,
            strokeColorError: appearance.strokeColorError,
            strokeColorFocused: appearance.strokeColor,
            fillColor: appearance.fillColor,
            fillColorError: appearance.fillColorError,
            strokeWidth: appearance.size.strokeWidth,
            // Size parameters
            itemWidth: appearance.size.itemWidth,
            itemHeight: appearance.size.itemHeight,
            itemSpacing: appearance.size.itemSpacing,
            groupSpacing: appearance.size.groupSpacing,
            captionSpacing: appearance.size.captionPadding,
            dotSize: appearance.size.dotSize,
            itemShape: DefaultPathDrawer(),
            groupShape: DefaultPathDrawer()
        )
    }
    
    private var appearance: CodeInputAppearance {
        _appearance ?? environmentAppearance
    }
}
