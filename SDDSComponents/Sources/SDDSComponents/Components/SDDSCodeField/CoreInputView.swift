import Foundation
import SwiftUI
import Combine
import SDDSThemeCore

private struct CoreInputAnimation {
    static let shakeDelay: TimeInterval = 0.2
    static let shakeDuration: TimeInterval = 0.35
    static let cursorBlinkDuration: TimeInterval = 0.4
    static let shakeCount: Int = 3
    static let shakeAmount: CGFloat = 2
    static let colorChangeDuration: TimeInterval = 0.1
    static let scaleUpDuration: TimeInterval = 0.2
    static let scaleDownDuration: TimeInterval = 0.2
    static let nanosecondsPerSecond: UInt64 = 1_000_000_000
}

private enum AnimationPhase {
    case idle
    case colorChange
    case scaleUp
    case shaking
    case scaleDown
    case colorReset
}

internal struct CoreInputView: View {
    
    let groups: [CodeFieldGroup]
    let validation: CodeFieldValidation
    let caption: String
    let captionAlignment: CodeFieldAlignment
    let keyboardType: UIKeyboardType
    let isHidden: Bool
    let showBeforeSecure: Bool
    
    let valueColor: FillStyle
    let valueColorError: FillStyle
    let backgroundColor: FillStyle
    let backgroundColorActivated: FillStyle
    let backgroundColorError: FillStyle
    let cursorColor: ColorToken
    let captionColor: FillStyle
    let captionColorError: FillStyle
    let dotColor: FillStyle
    let dotColorError: FillStyle
    let valueTypography: TypographyToken
    let captionTypography: TypographyToken
    
    let strokeColor: FillStyle?
    let strokeColorError: FillStyle?
    let strokeColorFocused: FillStyle?
    let fillColor: FillStyle?
    let fillColorError: FillStyle?
    let strokeWidth: CGFloat?
    
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    let itemSpacing: CGFloat
    let groupSpacing: CGFloat
    let captionSpacing: CGFloat
    let dotSize: CGFloat
    let itemShape: PathDrawer
    let groupShape: PathDrawer
    
    enum InputMode {
        case field
        case input
    }
    let inputMode: InputMode
    
    @Binding private var validationResult: CodeFieldValidationResult
    @Binding private var code: String
    @State private var oldCode: String
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
    @State private var coreInputSize: CGSize = .zero
    @State private var currentInputPosition: Int = -1
    @State private var animationPhase: AnimationPhase = .idle
    @State private var isScaled: Bool = false
    @State private var visibleCharacters: Set<Int> = []
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    init(
        code: Binding<String>,
        groups: [CodeFieldGroup],
        validation: CodeFieldValidation = CodeFieldDisabledValidation(),
        validationResult: Binding<CodeFieldValidationResult>,
        caption: String = "",
        captionAlignment: CodeFieldAlignment = .center,
        keyboardType: UIKeyboardType = .default,
        isFocused: Bool = false,
        isHidden: Bool = false,
        showBeforeSecure: Bool = false,
        isAnimating: Bool = false,
        inputMode: InputMode,
        valueColor: FillStyle,
        valueColorError: FillStyle,
        backgroundColor: FillStyle,
        backgroundColorActivated: FillStyle,
        backgroundColorError: FillStyle,
        cursorColor: ColorToken,
        captionColor: FillStyle,
        captionColorError: FillStyle,
        dotColor: FillStyle,
        dotColorError: FillStyle,
        valueTypography: TypographyToken,
        captionTypography: TypographyToken,
        strokeColor: FillStyle? = nil,
        strokeColorError: FillStyle? = nil,
        strokeColorFocused: FillStyle? = nil,
        fillColor: FillStyle? = nil,
        fillColorError: FillStyle? = nil,
        strokeWidth: CGFloat? = nil,
        itemWidth: CGFloat,
        itemHeight: CGFloat,
        itemSpacing: CGFloat,
        groupSpacing: CGFloat,
        captionSpacing: CGFloat,
        dotSize: CGFloat,
        itemShape: PathDrawer,
        groupShape: PathDrawer
    ) {
        self._code = code
        self.groups = groups
        self.validation = validation
        self._validationResult = validationResult
        self.caption = caption
        self.captionAlignment = captionAlignment
        self.keyboardType = keyboardType
        self.isHidden = isHidden
        self.showBeforeSecure = showBeforeSecure
        self.inputMode = inputMode
        self.valueColor = valueColor
        self.valueColorError = valueColorError
        self.backgroundColor = backgroundColor
        self.backgroundColorActivated = backgroundColorActivated
        self.backgroundColorError = backgroundColorError
        self.cursorColor = cursorColor
        self.captionColor = captionColor
        self.captionColorError = captionColorError
        self.dotColor = dotColor
        self.dotColorError = dotColorError
        self.valueTypography = valueTypography
        self.captionTypography = captionTypography
        self.strokeColor = strokeColor
        self.strokeColorError = strokeColorError
        self.strokeColorFocused = strokeColorFocused
        self.fillColor = fillColor
        self.fillColorError = fillColorError
        self.strokeWidth = strokeWidth
        self.itemWidth = itemWidth
        self.itemHeight = itemHeight
        self.itemSpacing = itemSpacing
        self.groupSpacing = groupSpacing
        self.captionSpacing = captionSpacing
        self.dotSize = dotSize
        self.itemShape = itemShape
        self.groupShape = groupShape
        self.isFocused = isFocused
        self._cursorPosition = State(initialValue: isFocused ? 0 : -1)
        self._oldCode = State(initialValue: code.wrappedValue)
        self._isAnimating = State(initialValue: isAnimating)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                codeGroup
                textField
            }
            .readSize { size in
                self.coreInputSize = size
            }
            .onTapGesture {
                isFocused = true
            }
            
            captionText
                .frame(maxWidth: coreInputSize.width, alignment: captionAlignment.suiAlignment)
        }
        .background(Color.clear)
    }
    
    @ViewBuilder
    private var captionText: some View {
        if !caption.isEmpty {
            Text(caption)
                .multilineTextAlignment(captionAlignment.textAlignment)
                .typography(captionTypography)
                .fillForeground(style: captionColor(isCaptionErrorDisplayed: isCaptionErrorDisplayed))
                .frame(minHeight: captionTypography.lineHeight)
                .padding([.top], captionSpacing)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var codeGroup: some View {
        HStack(spacing: totalGroupSpacing) {
            ForEach(Array(groups.enumerated()), id: \.offset) { groupIndex, group in
                HStack(spacing: itemSpacing) {
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
                .shape(pathDrawer: groupShape)
            }
        }
        .shake(
            amount: CoreInputAnimation.shakeAmount,
            shakes: CoreInputAnimation.shakeCount,
            isShaking: isShaking && isFullError
        )
    }
    
    private var totalGroupSpacing: CGFloat {
        switch inputMode {
        case .field:
            groupSpacing + 2 * itemSpacing
        case .input:
            groupSpacing
        }
    }
    
    @ViewBuilder
    private func item(value: String, isError: Bool, isCurrentPosition: Bool, globalIndex: Int) -> some View {
        switch inputMode {
        case .field:
            fieldItem(value: value, isError: isError, isCurrentPosition: isCurrentPosition, globalIndex: globalIndex)
        case .input:
            inputItem(value: value, isError: isError, isCurrentPosition: isCurrentPosition, globalIndex: globalIndex)
        }
    }
    
    @ViewBuilder
    private func fieldItem(value: String, isError: Bool, isCurrentPosition: Bool, globalIndex: Int) -> some View {
        FillStyleShape(Rectangle(), style: backgroundColor(isError: isError, isCurrentPosition: isCurrentPosition))
            .frame(width: itemWidth, height: itemHeight)
            .overlay(
                Group {
                    if isCurrentPosition {
                        caret
                    } else if !value.isEmpty {
                        symbol(value: value, isError: isError, globalIndex: globalIndex)
                    }
                }
            )
            .shape(pathDrawer: itemShape)
            .shake(
                amount: CoreInputAnimation.shakeAmount,
                shakes: CoreInputAnimation.shakeCount,
                isShaking: isShaking && (globalIndex == errorPosition)
            )
    }
    
    @ViewBuilder
    private func inputItem(value: String, isError: Bool, isCurrentPosition: Bool, globalIndex: Int) -> some View {
        ZStack {
            if !value.isEmpty {
                if isError && !isFullError {
                    if let strokeColor = strokeColor(isError: isError) {
                        dot(style: strokeColor)
                            .scaleEffect(isScaled && (globalIndex == errorPosition) ? 1.5 : 1.0)
                            .animation(.easeInOut(duration: 0.2), value: isScaled)
                    }
                } else {
                    if isHidden {
                        if isFullError {
                            // fillColorError is often .clearColor in themes; fall back so dots stay visible like develop
                            if let fill = fillColor(isError: isError), fill != .color(.clearColor) {
                                dot(style: fill)
                            } else {
                                dot(style: valueColorError)
                            }
                        } else if visibleCharacters.contains(globalIndex) && showBeforeSecure {
                            Text(value)
                                .typography(valueTypography)
                                .fillForeground(style: isError ? valueColorError : valueColor)
                        } else {
                            if let fillColor = fillColor(isError: isError) {
                                dot(style: fillColor)
                            }
                        }
                    } else {
                        Text(value)
                            .typography(valueTypography)
                            .fillForeground(style: isError ? valueColorError : valueColor)
                    }
                }
            } else {
                if let strokeColor = strokeColor(isError: isError),
                   let strokeWidth = strokeWidth {
                    Circle()
                        .stroke(strokeColor.representativeColor(for: colorScheme, subtheme: subtheme), lineWidth: strokeWidth)
                        .frame(width: dotSize, height: dotSize)
                }
            }
        }
        .frame(width: itemWidth, height: itemHeight)
        .shake(
            amount: CoreInputAnimation.shakeAmount,
            shakes: CoreInputAnimation.shakeCount,
            isShaking: isShaking && (globalIndex == errorPosition)
        )
    }
    
    @ViewBuilder
    private func dot(style: FillStyle) -> some View {
        FillStyleShape(Circle(), style: style)
            .frame(width: dotSize, height: dotSize)
    }
    
    @ViewBuilder
    private var caret: some View {
        Rectangle()
            .fill(cursorColor.color(for: colorScheme, subtheme: subtheme))
            .frame(width: 1, height: valueTypography.lineHeight)
            .opacity(isCursorVisible ? 1.0 : 0.0)
            .onAppear {
                if isFocused {
                    withAnimation(.easeInOut(duration: CoreInputAnimation.cursorBlinkDuration).repeatForever(autoreverses: true)) {
                        isCursorVisible.toggle()
                    }
                } else {
                    isCursorVisible = false
                }
            }
    }
    
    @ViewBuilder
    private func symbol(value: String, isError: Bool, globalIndex: Int) -> some View {
        if isHidden {
            if visibleCharacters.contains(globalIndex) && showBeforeSecure {
                Text(value)
                    .typography(valueTypography)
                    .fillForeground(style: isError ? valueColorError : valueColor)
            } else {
                dot(isError: isError)
            }
        } else {
            Text(value)
                .typography(valueTypography)
                .fillForeground(style: isError ? valueColorError : valueColor)
        }
    }
    
    @ViewBuilder
    private func dot(isError: Bool) -> some View {
        FillStyleShape(Circle(), style: isError ? dotColorError : dotColor)
            .frame(width: dotSize, height: dotSize)
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
            enableSelection: !isHidden,
            onShouldChange: { value in
                let nextCode = value.isEmpty ? String(code.dropLast()) : code + value
                let nextSymbol = value.first ?? " "
                let validationResult = self.validation.validate(value: nextCode, nextSymbol: nextSymbol)
                let valid: Bool
                switch validationResult {
                case .failure:
                    self.handleCodeChange(newValue: nextCode, deleting: value.isEmpty)
                    valid = false
                case .success:
                    valid = true
                }
                
                return !isAnimating && (valid || value.isEmpty)
            },
            onEditingChanged: nil
        )
        .frame(width: 1, height: itemHeight)
        .onChange(of: code) { value in
            handleCodeChange(newValue: code, deleting: value.count < oldCode.count && !oldCode.isEmpty)
            oldCode = value
        }
        .onAppear {
            handleCodeChange(newValue: code)
        }
        .onChange(of: isFocused) { focused in
            if !focused {
                cursorPosition = -1
                isCursorVisible = false
                currentInputPosition = -1
            } else {
                cursorPosition = code.count
                isCursorVisible = true
                currentInputPosition = code.count - 1
            }
        }
    }
    
    private func handleCodeChange(newValue: String, deleting: Bool = false) {
        guard !isAnimating else { return }
        
        var finalValidationResult: CodeFieldValidationResult = .success(.initial)
        
        guard let char = newValue.last else {
            cursorPosition = 0
            currentInputPosition = -1
            code = newValue
            return
        }
        
        finalValidationResult = validation.validate(value: newValue, nextSymbol: char)
        let filtered = newValue.filter { validation.validate(value: newValue, nextSymbol: $0) == .success(.next) }
        
        switch finalValidationResult {
        case .success(.next), .success(.initial):
            cursorPosition = filtered.count
            currentInputPosition = filtered.count - 1
            code = filtered
            isCaptionErrorDisplayed = false
            showHiddenSymbol(code: code, deleting: deleting)
        case .success(.validated):
            isFocused = false
            cursorPosition = newValue.count
            currentInputPosition = -1
            isCaptionErrorDisplayed = false
            code = newValue
            showHiddenSymbol(code: code, deleting: deleting)
        case .failure(.inputFailed):
            tempCodeWithError = newValue
            errorPosition = newValue.count - 1
            hasError = true
            isCaptionErrorDisplayed = false
            animateError()
            code = String(newValue.dropLast())
        case .failure(.invalidCode):
            tempCodeWithError = newValue
            isFullError = true
            isCaptionErrorDisplayed = true
            animateFullError()
            code = ""
        }
        
        self.validationResult = finalValidationResult
    }
    
    private func showHiddenSymbol(code: String, deleting: Bool) {
        guard isHidden && !code.isEmpty && !deleting && showBeforeSecure else {
            return
        }
        
        visibleCharacters.removeAll()
        
        let lastIndex = code.count - 1
        visibleCharacters.insert(lastIndex)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            visibleCharacters.remove(lastIndex)
        }
    }
    
    private func backgroundColor(isError: Bool, isCurrentPosition: Bool) -> FillStyle {
        if isError {
            return backgroundColorError
        }
        
        if isFocused && isCurrentPosition {
            return backgroundColorActivated
        } else {
            return backgroundColor
        }
    }
    
    private func captionColor(isCaptionErrorDisplayed: Bool) -> FillStyle {
        if isCaptionErrorDisplayed {
            return captionColorError
        }
        
        return captionColor
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
        animationPhase = .colorChange
        
        var delay = CoreInputAnimation.colorChangeDuration
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.animationPhase = .scaleUp
            self.isScaled = true
        }
        
        delay += CoreInputAnimation.scaleUpDuration
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.animationPhase = .shaking
            self.isShaking = true
        }
        
        delay += CoreInputAnimation.shakeDuration
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.animationPhase = .scaleDown
            self.isShaking = false
            self.isScaled = false
        }
        
        delay += CoreInputAnimation.scaleDownDuration
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.hasError = false
            self.errorPosition = -1
            self.tempCodeWithError = ""
            self.cursorPosition = self.code.count
            self.currentInputPosition = self.code.count - 1
            self.isAnimating = false
            self.animationPhase = .idle
        }
    }
    
    private func animateFullError() {
        isAnimating = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + CoreInputAnimation.shakeDelay) {
            self.isShaking = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + CoreInputAnimation.shakeDelay + CoreInputAnimation.shakeDuration) {
            self.isFullError = false
            self.isShaking = false
            self.errorPosition = -1
            self.tempCodeWithError = ""
            self.cursorPosition = 0
            self.currentInputPosition = -1
            self.isAnimating = false
        }
    }
}

extension CoreInputView {
    private func strokeColor(isError: Bool) -> FillStyle? {
        if isError {
            if animationPhase == .colorChange || animationPhase == .scaleUp || animationPhase == .shaking {
                return strokeColorError
            }
            return strokeColorError
        }
        
        if isFocused {
            return strokeColorFocused
        } else {
            return strokeColor
        }
    }
    
    private func fillColor(isError: Bool) -> FillStyle? {
        if isError {
            return fillColorError
        } else {
            return fillColor
        }
    }
}
