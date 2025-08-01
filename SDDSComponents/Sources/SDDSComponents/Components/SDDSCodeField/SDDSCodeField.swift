import Foundation
import SwiftUI
import Combine
import SDDSThemeCore
@_exported import SDDSThemeCore

fileprivate struct CodeFieldAnimation {
    static let shakeDelay: TimeInterval = 0.2
    static let shakeDuration: TimeInterval = 0.35
    static let cursorBlinkDuration: TimeInterval = 0.4
    static let shakeCount: Int = 3
    static let shakeAmount: CGFloat = 2
}

/**
 `SDDSCodeField` представляет собой компонент для ввода кода с визуальным отображением цифр в отдельных полях.
 
 - Parameters:
   - groups: Массив групп полей для отображения кода
   - caption: Подпись под полями ввода (опционально)
   - captionAlignment: Выравнивание подписи
   - keyboardType: Тип клавиатуры для ввода
   - appearance: Кастомизация внешнего вида
   - onCodeChanged: Callback при изменении кода

 ## Окружение
 - `codeFieldAppearance`: Стандартные настройки внешнего вида полей кода

 ## Пример использования

 ```swift
 // Поле для ввода 4-значного кода
 SDDSCodeField(
     groups: CodeFieldGroup.four,
     caption: "Введите код из СМС",
     captionAlignment: .center,
     keyboardType: .numberPad,
     appearance: CodeField.l.appearance,
     onCodeChanged: { code in
         print("Введен код: \(code)")
     }
 )

 // Поле для ввода 6-значного кода с группировкой
 SDDSCodeField(
     groups: CodeFieldGroup.six,
     caption: "Код подтверждения",
     captionAlignment: .leading,
     keyboardType: .numberPad,
     appearance: CodeField.m.segmented.appearance,
     onCodeChanged: { code in
         print("Введен код: \(code)")
     }
 )
 ```
 */
public struct SDDSCodeField: View {
    let groups: [CodeFieldGroup]
    let validation: CodeFieldValidation
    let caption: String
    let captionAlignment: CodeFieldAlignment
    let keyboardType: UIKeyboardType
    let onCodeChanged: (String) -> Void
    
    private var _appearance: CodeFieldAppearance?
    @Environment(\.codeFieldAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Binding private var validationResult: CodeFieldValidationResult
    @Binding private var code: String
    @State private var isFocused: Bool
    @State private var cursorPosition: Int = 0
    @State private var isCursorVisible: Bool = true
    @State private var isShaking: Bool = false
    @State private var isCaptionErrorDisplayed: Bool = false
    @State private var isAnimating: Bool = false
    @State private var hasError: Bool = false
    @State private var errorPosition: Int = -1
    @State private var tempCodeWithError: String = ""
    @State private var isFullError: Bool = false
    @State private var codeFieldSize: CGSize = .zero
    
    public init(
        code: Binding<String>,
        groups: [CodeFieldGroup],
        validation: CodeFieldValidation = CodeFieldDisabledValidation(),
        validationResult: Binding<CodeFieldValidationResult>,
        caption: String = "",
        captionAlignment: CodeFieldAlignment = .center,
        keyboardType: UIKeyboardType = .default,
        isFocused: Bool = false,
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
        self._appearance = appearance
        self.onCodeChanged = onCodeChanged
        self.isFocused = isFocused
        self._cursorPosition = State(initialValue: isFocused ? 0 : -1)
        self._isAnimating = State(initialValue: isAnimating)
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            ZStack {
                codeGroup
                textField
            }
            .readSize { size in
                print(codeFieldSize)
                self.codeFieldSize = size
            }
            .onTapGesture {
                isFocused = true
            }
            
            captionText
                .frame(maxWidth: codeFieldSize.width, alignment: captionAlignment.suiAlignment)

        }
    }
    
    @ViewBuilder
    private var captionText: some View {
        if !caption.isEmpty {
            Text(caption)
                .typography(appearance.captionTypography.typography(with: appearance.size) ?? .undefined)
                .foregroundColor(captionColor)
                .padding([.top], appearance.size.captionSpacing)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var codeGroup: some View {
        HStack(spacing: appearance.size.groupSpacing + 2 * appearance.size.itemSpacing) {
            ForEach(Array(groups.enumerated()), id: \.offset) { groupIndex, group in
                HStack(spacing: appearance.size.itemSpacing) {
                    ForEach(0..<Int(group.count), id: \.self) { itemIndex in
                        let globalIndex = globalIndex(groupIndex: groupIndex, itemIndex: itemIndex, groups: groups)
                        let currentCode = hasError || isFullError ? tempCodeWithError : code
                        let value = globalIndex < currentCode.count ? 
                            String(currentCode[currentCode.index(currentCode.startIndex, offsetBy: globalIndex)]) : ""
                        let isCurrentPosition = globalIndex == cursorPosition && isFocused && !hasError && !isFullError
                        let isErrorItem = (globalIndex == errorPosition && hasError) || isFullError
                        
                        item(
                            value: value,
                            isError: isErrorItem,
                            isCurrentPosition: isCurrentPosition,
                            globalIndex: globalIndex
                        )
                    }
                }
                .shape(pathDrawer: appearance.size.groupShape)
            }
        }
        .shake(
            amount: CodeFieldAnimation.shakeAmount,
            shakes: CodeFieldAnimation.shakeCount,
            isShaking: isShaking && isFullError
        )
    }
        
    @ViewBuilder
    private func item(value: String, isError: Bool, isCurrentPosition: Bool, globalIndex: Int) -> some View {
        Rectangle()
            .fill(backgroundColor(isError: isError, isCurrentPosition: isCurrentPosition))
            .frame(width: appearance.size.width, height: appearance.size.height)
            .overlay(
                Group {
                    if isCurrentPosition {
                        caret
                    } else if !value.isEmpty {
                        symbol(value: value, isError: isError)
                    }
                }
            )
            .shape(pathDrawer: appearance.size.itemShape)
            .shake(
                amount: CodeFieldAnimation.shakeAmount,
                shakes: CodeFieldAnimation.shakeCount,
                isShaking: isShaking && (globalIndex == errorPosition)
            )
    }
    
    @ViewBuilder
    private var caret: some View {
        Rectangle()
            .fill(appearance.cursorColor.color(for: colorScheme))
            .frame(width: 1, height: valueTypography.lineHeight)
            .opacity(isCursorVisible ? 1.0 : 0.0)
            .onAppear {
                if isFocused {
                    withAnimation(.easeInOut(duration: CodeFieldAnimation.cursorBlinkDuration).repeatForever(autoreverses: true)) {
                        isCursorVisible.toggle()
                    }
                } else {
                    isCursorVisible = false
                }
            }
    }
    
    @ViewBuilder
    private func symbol(value: String, isError: Bool) -> some View {
        Text(value)
            .typography(valueTypography)
            .foregroundColor(isError ? appearance.valueColorError.color(for: colorScheme) : appearance.valueColor.color(for: colorScheme))
    }
    
    @ViewBuilder
    private var textField: some View {
        FocusableTextField(
            text: $code,
            isFocused: .init(
                get: { isFocused },
                set: { newValue in
                    isFocused = newValue
                }
            ),
            textColor: .clear,
            textAlignment: .leading,
            cursorColor: .clear,
            typography: .undefined,
            readOnly: false,
            keyboardType: keyboardType,
            enableSelection: false,
            onShouldChange: { !isAnimating },
            onEditingChanged: nil
        )
        .frame(width: 1, height: appearance.size.height)
        .onChange(of: code, perform: handleCodeChange)
        .onAppear {
            handleCodeChange(newValue: code)
        }
        .onChange(of: isFocused) { focused in
            if !focused {
                cursorPosition = -1
                isCursorVisible = false
            } else {
                cursorPosition = code.count
                isCursorVisible = true
            }
        }
    }
    
    private func handleCodeChange(newValue: String) {
        guard !isAnimating else {
            return
        }
        
        var finalValidationResult: CodeFieldValidationResult = .success(.initial)
        
        guard let char = newValue.last else {
            cursorPosition = 0
            onCodeChanged(newValue)
            return
        }
        
        finalValidationResult = validation.validate(value: newValue, nextSymbol: char)
        let filtered = newValue.filter { validation.validate(value: newValue, nextSymbol: $0) == .success(.next) }
        
        switch finalValidationResult {
        case .success(.next), .success(.initial):
            cursorPosition = filtered.count
            onCodeChanged(filtered)
            isCaptionErrorDisplayed = false
        case .success(.validated):
            isFocused = false
            cursorPosition = newValue.count
            isCaptionErrorDisplayed = false
        case .failure(.inputFailed):
            tempCodeWithError = newValue
            errorPosition = newValue.count - 1
            hasError = true
            isCaptionErrorDisplayed = false
            animateError()
        case .failure(.invalidCode):
            tempCodeWithError = newValue
            isFullError = true
            isCaptionErrorDisplayed = true
            animateFullError()
        }
        self.validationResult = finalValidationResult
    }
    
    private func backgroundColor(isError: Bool, isCurrentPosition: Bool) -> Color {
        if isError {
            return appearance.backgroundColorError.color(for: colorScheme)
        }
        
        if isFocused && isCurrentPosition {
            return appearance.backgroundColorActivated.color(for: colorScheme)
        } else {
            return appearance.backgroundColor.color(for: colorScheme)
        }
    }
    
    private var captionColor: Color {
        if isCaptionErrorDisplayed {
            return appearance.captionColorError.color(for: colorScheme)
        }
        
        return appearance.captionColor.color(for: colorScheme)
    }

    private var valueTypography: TypographyToken {
        appearance.valueTypography.typography(with: appearance.size) ?? .undefined
    }
    
    private var appearance: CodeFieldAppearance {
        _appearance ?? environmentAppearance
    }
    
    private func globalIndex(groupIndex: Int, itemIndex: Int, groups: [CodeFieldGroup]) -> Int {
        var globalIndex = 0
        for i in 0..<groupIndex {
            globalIndex += Int(groups[i].count)
        }
        return globalIndex + itemIndex
    }
    
    private func animateError() {
        isAnimating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + CodeFieldAnimation.shakeDelay) {
            isShaking = true
            DispatchQueue.main.asyncAfter(deadline: .now() + CodeFieldAnimation.shakeDuration) {
                code = code.filter { validation.validate(value: code, nextSymbol: $0) == .success(.next) }
                hasError = false
                isShaking = false
                errorPosition = -1
                tempCodeWithError = ""
                cursorPosition = code.count
                isAnimating = false
            }
        }
    }
    
    private func animateFullError() {
        isAnimating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + CodeFieldAnimation.shakeDelay) {
            isShaking = true
            DispatchQueue.main.asyncAfter(deadline: .now() + CodeFieldAnimation.shakeDuration) {
                code = ""
                isFullError = false
                isShaking = false
                errorPosition = -1
                tempCodeWithError = ""
                cursorPosition = 0
                isAnimating = false
            }
        }
    }
}
