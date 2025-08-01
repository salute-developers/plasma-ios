import Foundation
import SwiftUI
import Combine
import SDDSThemeCore
@_exported import SDDSThemeCore

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
    let captionAlignment: TextAlignment
    let keyboardType: UIKeyboardType
    let onCodeChanged: (String) -> Void
    
    private var _appearance: CodeFieldAppearance?
    @Environment(\.codeFieldAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @State private var code: String = ""
    @State private var isFocused: Bool
    @State private var cursorPosition: Int = 0
    @State private var isCursorVisible: Bool = true
    @State private var isShaking: Bool = false
    @State private var hasError: Bool = false
    @State private var errorPosition: Int = -1
    @State private var tempCodeWithError: String = ""
    
    public init(
        groups: [CodeFieldGroup],
        validation: CodeFieldValidation = CodeFieldOnlyDigitsValidation(),
        caption: String = "",
        captionAlignment: TextAlignment = .center,
        keyboardType: UIKeyboardType = .default,
        isFocused: Bool = false,
        appearance: CodeFieldAppearance? = nil,
        onCodeChanged: @escaping (String) -> Void
    ) {
        self.groups = groups
        self.validation = validation
        self.caption = caption
        self.captionAlignment = captionAlignment
        self.keyboardType = keyboardType
        self._appearance = appearance
        self.onCodeChanged = onCodeChanged
        self.isFocused = isFocused
        self._cursorPosition = State(initialValue: isFocused ? 0 : -1)
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            ZStack {
                codeGroup
                textField
            }
            .onTapGesture {
                isFocused = true
            }
            
            captionText
        }
    }
    
    @ViewBuilder
    private var captionText: some View {
        if !caption.isEmpty {
            Text(caption)
                .typography(appearance.captionTypography.typography(with: appearance.size) ?? .undefined)
                .foregroundColor(appearance.captionColor.color(for: colorScheme))
                .multilineTextAlignment(captionAlignment)
                .padding([.top], appearance.size.captionSpacing)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var codeGroup: some View {
        HStack(spacing: appearance.size.groupSpacing) {
            ForEach(Array(groups.enumerated()), id: \.offset) { groupIndex, group in
                HStack(spacing: appearance.size.itemSpacing) {
                    ForEach(0..<Int(group.count), id: \.self) { itemIndex in
                        let globalIndex = getGlobalIndex(groupIndex: groupIndex, itemIndex: itemIndex, groups: groups)
                        let value = globalIndex < (hasError ? tempCodeWithError.count : code.count) ? 
                            String((hasError ? tempCodeWithError : code)[(hasError ? tempCodeWithError : code).index((hasError ? tempCodeWithError : code).startIndex, offsetBy: globalIndex)]) : ""
                        let isCurrentPosition = globalIndex == cursorPosition && isFocused && !hasError
                        let isErrorItem = globalIndex == errorPosition && hasError
                        
                        Rectangle()
                            .fill(isErrorItem ? appearance.backgroundColorError.color(for: colorScheme) : appearance.backgroundColor.color(for: colorScheme))
                            .frame(width: appearance.size.width, height: appearance.size.height)
                            .overlay(
                                Group {
                                    if isCurrentPosition {
                                        caret
                                    } else if !value.isEmpty {
                                        symbol(value: value, isError: isErrorItem)
                                    }
                                }
                            )
                            .shape(pathDrawer: appearance.size.itemShape)
                            .modifier(ShakeEffect(shakes: isShaking && globalIndex == errorPosition ? 6 : 0))
                            .animation((isShaking && globalIndex == errorPosition) ? .easeInOut(duration: 0.7) : .default, value: isShaking)
                    }
                }
                .shape(pathDrawer: appearance.size.groupShape)
            }
        }
    }
    
    @ViewBuilder
    private var caret: some View {
        Rectangle()
            .fill(appearance.valueColor.color(for: colorScheme))
            .frame(width: 1, height: valueTypography.lineHeight)
            .opacity(isCursorVisible ? 1.0 : 0.0)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.4).repeatForever(autoreverses: true)) {
                    isCursorVisible.toggle()
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
            onEditingChanged: nil
        )
        .frame(height: appearance.size.height)
        .onChange(of: code) { newValue in
            let filtered = newValue.filter { validation.validate(value: newValue, nextSymbol: $0) }
            if filtered != newValue {
                // Сначала показываем символ с ошибкой
                tempCodeWithError = newValue
                errorPosition = newValue.count - 1
                hasError = true
                
                // Запускаем анимацию ошибки через небольшую задержку, чтобы символ успел отобразиться
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    isShaking = true
                    animateError()
                }
                
                // НЕ возвращаем к отфильтрованному коду сразу - оставляем tempCodeWithError для отображения
            } else {
                cursorPosition = filtered.count
                onCodeChanged(filtered)
            }
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

    private var valueTypography: TypographyToken {
        appearance.valueTypography.typography(with: appearance.size) ?? .undefined
    }
    
    private var appearance: CodeFieldAppearance {
        _appearance ?? environmentAppearance
    }
    
    private func getGlobalIndex(groupIndex: Int, itemIndex: Int, groups: [CodeFieldGroup]) -> Int {
        var globalIndex = 0
        for i in 0..<groupIndex {
            globalIndex += Int(groups[i].count)
        }
        return globalIndex + itemIndex
    }
    
    private func animateError() {
        // Анимация уже запущена в onChange, здесь только завершение
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            // Возвращаем к отфильтрованному коду (удаляем символ с ошибкой)
            code = code.filter { validation.validate(value: code, nextSymbol: $0) }
            
            // Сбрасываем состояния ошибки
            hasError = false
            isShaking = false
            errorPosition = -1
            tempCodeWithError = ""
            cursorPosition = code.count
        }
    }
}

struct ShakeEffect: GeometryEffect {
    var amount: CGFloat = 2
    var shakes: Int = 3
    var animatableData: CGFloat
    
    init(shakes: Int) {
        self.shakes = shakes
        self.animatableData = CGFloat(shakes)
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(CGFloat(animatableData) * CGFloat(shakes) * CGFloat.pi * CGFloat(shakes)),
            y: 0))
    }
}
