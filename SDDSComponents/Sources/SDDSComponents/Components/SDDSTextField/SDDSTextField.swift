import SwiftUI
import SDDSThemeCore
import SDDSComponents

// MARK: - SDDSTextField

/**
 `SDDSTextField` представляет собой настраиваемое текстовое поле с поддержкой различных стилей, макетов и конфигураций.

 - Parameters:
    - value: Значение текстового поля (`single` или `multiple`). ``TextFieldValue``
    - title: Заголовок текстового поля.
    - optionalTitle: Дополнительный заголовок (например, для опциональных полей).
    - placeholder: Текст placeholder, отображаемый при пустом поле.
    - caption: Подпись под текстовым полем.
    - textBefore: Префикс перед текстом или плейсхолдером.
    - textAfter: Суффикс после текста или плейсхолдером.
    - disabled: Флаг, указывающий, отключено ли поле.
    - readOnly: Флаг, указывающий, включено ли поле только на режим чтения.
    - required: Флаг, указывающий, является ли поле обязательным.
    - divider: Флаг, указывающий, показывать ли линию разделителя.
    - appearance: Параметры внешнего вида текстового поля.
    - layout: Макет текстового поля (`default`, `clear`). ``TextFieldLayout``
    - accessibility: Параметры доступности.
    - iconContent: Левая иконка (используйте вместо deprecated iconViewProvider).
    - actionContent: Правая иконка действия (используйте вместо deprecated iconActionViewProvider).

 ## Окружение
 
 - `textFieldAppearance`: Стандартные настройки внешнего вида текстового поля

 ## Пример использования

 ```swift
 // Базовое текстовое поле
 @State private var value = TextFieldValue.single("")
 
  SDDSTextField(
     value: $value,
     title: "Title",
     optionalTitle: "",
     placeholder: "Enter the text",
     caption: "Caption",
     appearance: TextField.m.default.appearance
 )
 ```
 */
public struct SDDSTextField<IconContent: View, ActionContent: View>: View {
    @State var text: String
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
    public let mask: TextFieldMask?
    public let maskDisplayMode: MaskDisplayMode
    private let _appearance: TextFieldAppearance?
    public let layout: TextFieldLayout
    public let accessibility: TextFieldAccessibility
    
    let iconContent: Action<IconContent>
    let actionContent: Action<ActionContent>
    let onMaskComplete: ((Bool) -> Void)?
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @Environment(\.textFieldAppearance) private var environmentAppearance
    @State private var isFocused: Bool = false
    @State private var chipGroupContentHeight: CGFloat = 0
    @State private var isMaskComplete: Bool = false
    private let debugConfiguration: TextFieldDebugConfiguration
    
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
        mask: TextFieldMask? = nil,
        maskDisplayMode: MaskDisplayMode = .onInput,
        appearance: TextFieldAppearance? = nil,
        layout: TextFieldLayout = .default,
        accessibility: TextFieldAccessibility = TextFieldAccessibility(),
        iconContent: Action<IconContent> = Action { EmptyView() },
        actionContent: Action<ActionContent> = Action { EmptyView() },
        onMaskComplete: ((Bool) -> Void)? = nil
    ) {
        switch value.wrappedValue {
        case .single(let text):
            _text = State(wrappedValue: text)
        case .multiple(let text, _):
            _text = State(wrappedValue: text)
        }
    
        _value = value
        self.caption = caption
        self.textBefore = textBefore
        self.textAfter = textAfter
        self.disabled = disabled
        self.readOnly = readOnly
        self.divider = divider
        self.mask = mask
        self.maskDisplayMode = maskDisplayMode
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder.isEmpty && mask != nil ? mask!.placeholder : placeholder
        self._appearance = appearance
        self.layout = layout
        self.accessibility = accessibility
        self.debugConfiguration = TextFieldDebugConfiguration()
        self.iconContent = iconContent
        self.actionContent = actionContent
        self.onMaskComplete = onMaskComplete
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 0) {
            if showOuterTitleIndicator || showInnerTitleIndicatorForClearLayout {
                indicatorWithTrailingPadding
            }
            
            VStack(alignment: .leading, spacing: 0) {
                if appearance.labelPlacement == .outer {
                    titleLabel
                        .multilineTextAlignment(appearance.titleTextAlignment)
                }

                HStack(spacing: 0) {
                    fieldView
                        
                }
                HStack(spacing: 0) {
                    captionLabel
                }
            }
            
            if showInnerTitleRightIndicatorForClearLayout {
                indicatorWitLeadingPadding
            }
        }
        .opacity(disabled ? appearance.disabledAlpha : 1)
        .disabled(disabled)
        .onTapGesture {
            guard !displayChips && !disabled else {
                return
            }
            withAnimation {
                isFocused = true
            }
        }
    }

    // MARK: - Subviews

    @ViewBuilder
    private var titleLabel: some View {
        HStack(alignment: .top, spacing: 0) {
            mainTitleView

            if !optionalTitle.isEmpty && !required {
                optionalTitleView
            }
            if shouldShowRequiredIndicatorAfterTitle {
                indicatorWitLeadingPadding
            }
        }
        .padding(.bottom, appearance.size.titleBottomPadding, debug: debugConfiguration.titleBottomPadding)
    }

    @ViewBuilder
    private var mainTitleView: some View {
        Text(title)
            .typography(titleTypography)
            .frame(height: titleTypography.lineHeight)
            .foregroundColor(appearance.titleColor.color(for: colorScheme, subtheme: subtheme))
            .multilineTextAlignment(appearance.titleTextAlignment)
    }

    @ViewBuilder
    private var optionalTitleView: some View {
        if required {
            EmptyView()
        } else {
            Text(optionalTitle)
                .typography(titleTypography)
                .frame(height: titleTypography.lineHeight)
                .foregroundColor(appearance.optionalTitleColor.color(for: colorScheme, subtheme: subtheme))
                .multilineTextAlignment(appearance.titleTextAlignment)
                .debug(condition: debugConfiguration.title)
                .padding(.leading, appearance.size.optionalPadding)
        }
    }
    
    @ViewBuilder
    private var innerOptionalTitleView: some View {
        if required {
            EmptyView()
        } else {
            Text(optionalTitle)
                .typography(innerTitleTypography)
                .foregroundColor(appearance.optionalTitleColor.color(for: colorScheme, subtheme: subtheme))
                .multilineTextAlignment(appearance.titleTextAlignment)
                .debug(condition: debugConfiguration.title)
                .padding(.leading, appearance.size.optionalPadding)
        }
    }

    @ViewBuilder
    private var indicatorWithTrailingPadding: some View {
        indicatorView
            .padding(.trailing, appearance.size.indicatorOffset.x)
            .padding(.top, appearance.size.indicatorOffset.y)
    }
    
    @ViewBuilder
    private var indicatorWitLeadingPadding: some View {
        indicatorView
            .padding(.leading, appearance.size.indicatorOffset.x)
            .padding(.top, appearance.size.indicatorOffset.y)
    }

    @ViewBuilder
    private var contentView: some View {
        ScrollViewReader { proxy in
            switch value {
            case .single:
                textField
            case .multiple(_, let chips):
                let updatedChips: [ChipData] = chips.map { chipData in
                    var chipData = chipData
                    chipData.appearance = self.appearance.chipGroupAppearance.chipAppearance
                    return chipData
                }
                chipsScrollView(chips: updatedChips, proxy: proxy)
            }
        }
    }

    @ViewBuilder
    private func chipsScrollView(chips: [ChipData], proxy: ScrollViewProxy) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                SDDSChipGroup(
                    data: chips,
                    appearance: appearance.chipGroupAppearance,
                    flat: true,
                    height: .constant(appearance.chipGroupAppearance.chipAppearance.size.height)
                )
                .frame(height: appearance.chipGroupAppearance.chipAppearance.size.height)
                
                textField
                    .padding(.leading, appearance.size.chipContainerHorizontalPadding, debug: debugConfiguration.textField)
                    .id(textFieldIdentifier)
                    .onTapGesture {
                        isFocused = true
                    }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: chipCornerRadius, style: .continuous))
        .onChange(of: text) { _ in
            proxy.scrollTo(textFieldIdentifier, anchor: .trailing)
        }
    }

    @ViewBuilder
    private var textField: some View {
        switch value {
        case .single:
            ScrollViewReader { scrollViewProxy in
                GeometryReader { proxy in
                    VStack(spacing: 0) {
                        if shouldCenterText {
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                if showSuffixOrPrefix {
                                    textBeforeView
                                }
                                PlaceholderTextField(
                                    text: $text,
                                    isFocused: $isFocused,
                                    textColor: textColor,
                                    textAlignment: appearance.inputTextAlignment,
                                    cursorColor: appearance.cursorColor.color(for: colorScheme, subtheme: subtheme),
                                    textTypography: textTypography,
                                    readOnly: readOnly,
                                    mask: mask,
                                    maskDisplayMode: maskDisplayMode,
                                    placeholderBeforeContent: {
                                        EmptyView()
                                    },
                                    placeholderContent: {
                                        placeholderView
                                    },
                                    placeholderAfterContent: {
                                        EmptyView()
                                    },
                                    onEditingChanged: { focused in
                                        isFocused = focused
                                    },
                                    onMaskComplete: { complete in
                                        isMaskComplete = complete
                                        onMaskComplete?(complete)
                                    },
                                    textFieldConfiguration: { textField in
                                        textFieldConfiguration(textField: textField)
                                            .id(textFieldIdentifier)
                                            .frame(
                                                width: calculatedTextSize,
                                                height: textTypography.lineHeight
                                            )
                                    }
                                )
                                if showSuffixOrPrefix {
                                    textAfterView
                                        .id(textAfterIdentifier)
                                }
                            }
                        }
                        .onChange(of: text) { _ in
                            scroll(with: scrollViewProxy)
                        }
                        .onChange(of: textAfter) { _ in
                            scroll(with: scrollViewProxy)
                        }
                        if shouldCenterText {
                            Spacer()
                        }
                    }
                }
            }
        case .multiple:
            PlaceholderTextField(
                text: $text,
                isFocused: $isFocused,
                textColor: textColor,
                textAlignment: appearance.inputTextAlignment,
                cursorColor: appearance.cursorColor.color(for: colorScheme, subtheme: subtheme),
                textTypography: textTypography,
                readOnly: readOnly,
                mask: mask,
                maskDisplayMode: maskDisplayMode,
                placeholderBeforeContent: {},
                placeholderContent: { placeholderView },
                placeholderAfterContent: { EmptyView() },
                onEditingChanged: { focused in
                    isFocused = focused
                },
                onMaskComplete: { complete in
                    isMaskComplete = complete
                    onMaskComplete?(complete)
                },
                textFieldConfiguration: { textField in
                    textFieldConfiguration(textField: textField)
                        .frame(
                            width: calculatedTextSize,
                            height: textTypography.lineHeight,
                            debug: debugConfiguration.textField
                        )
                }
            )
        }
    }
        
    @ViewBuilder
    private func textFieldConfiguration(textField: FocusableTextField) -> some View {
        textField
            .onChange(of: text) { newText in
                guard !readOnly else {
                    return
                }
                if newText != self.value.text {
                    self.value = self.value.updated(with: newText)
                }
            }
            .onChange(of: value) { newValue in
                guard !readOnly else {
                    return
                }
                // Когда маска используется, текст управляется MaskedTextInputListener
                // и не должен обновляться из value, чтобы избежать циклов
                guard mask == nil else {
                    return
                }
                DispatchQueue.main.async {
                    self.text = newValue.text
                }
            }
    }
    
    @ViewBuilder
    private var placeholderView: some View {
        let displayText = maskPlaceholderText
        
        if appearance.labelPlacement == .inner && !displayChips {
            if isFocused {
                Text(displayText)
                    .typography(textTypography)
                    .foregroundColor(placeholderColor)
            } else {
                HStack(spacing: 0) {
                    if !title.isEmpty {
                        Text(title)
                            .typography(textTypography)
                            .foregroundColor(placeholderColor)
                    } else {
                        Text(displayText)
                            .typography(textTypography)
                            .foregroundColor(placeholderColor)
                    }
                    if !optionalTitle.isEmpty {
                        innerOrNonePlacementOptionalTitleView
                    }
                }
            }
        } else {
            HStack(spacing: 0) {
                Text(displayText)
                    .typography(textTypography)
                    .foregroundColor(placeholderColor)
                if !optionalTitle.isEmpty && appearance.labelPlacement == .none {
                    innerOrNonePlacementOptionalTitleView
                }
            }
        }
    }
    
    private var maskPlaceholderText: String {
        // В режиме .always показываем комбинацию введенного текста и placeholder
        if maskDisplayMode == .always, let mask = mask, !text.isEmpty {
            let maskPlaceholder = mask.placeholder
            
            // Если введенный текст короче или равен placeholder
            guard text.count < maskPlaceholder.count else {
                return text
            }
            
            // Комбинируем: берем символы из text, остальное из maskPlaceholder
            var result = Array(maskPlaceholder)
            let textArray = Array(text)
            
            // Заменяем первые N символов из текста
            for (index, char) in textArray.enumerated() where index < result.count {
                result[index] = char
            }
            
            return String(result)
        }
        
        return placeholder
    }
    
    @ViewBuilder
    private var titleOrPlaceholder: some View {
        EmptyView()
    }
    
    @ViewBuilder
    private var innerOrNonePlacementOptionalTitleView: some View {
        if required {
            EmptyView()
        } else {
            Text(optionalTitle)
                .typography(textTypography)
                .foregroundColor(appearance.optionalTitleColor.color(for: colorScheme, subtheme: subtheme))
                .padding(.leading, appearance.size.optionalPadding)
        }
    }
        
    @ViewBuilder
    private var textBeforeView: some View {
        if textBefore.isEmpty || displayChips {
            EmptyView()
        } else {
            Text(textBefore)
                .typography(textBeforeTypography)
                .frame(height: textTypography.lineHeight)
                .foregroundColor(appearance.textBeforeColor.color(for: colorScheme, subtheme: subtheme))
                .padding(.leading, appearance.size.textBeforeLeadingPadding)
                .padding(.trailing, appearance.size.textBeforeTrailingPadding)
        }
    }
    
    @ViewBuilder
    private var textAfterView: some View {
        if textAfter.isEmpty || displayChips {
            EmptyView()
        } else {
            Text(textAfter)
                .typography(textAfterTypography)
                .frame(height: textTypography.lineHeight)
                .foregroundColor(appearance.textAfterColor.color(for: colorScheme, subtheme: subtheme))
                .padding(.leading, appearance.size.textAfterLeadingPadding)
                .padding(.trailing, appearance.size.textAfterTrailingPadding)
        }
    }
    
    @ViewBuilder
    private var fieldView: some View {
        ZStack(alignment: .leading) {
            if layout == .default {
                backgroundView
            }

            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    iconView

                    VStack(alignment: .leading, spacing: 0) {
                        if shouldShowInnerTitle {
                            innerTitleView
                        }
                        contentView
                    }
                    
                    iconActionView
                }
                .padding(.leading, boxLeadingPadding, debug: debugConfiguration.boxLeadingPadding)
                .padding(.trailing, boxTrailingPadding, debug: debugConfiguration.boxTrailingPadding)
                .frame(height: appearance.size.fieldHeight, debug: debugConfiguration.fieldHeight)
                
                if layout == .clear {
                    bottomLineView
                }
            }
            
            if shouldShowEdgeIndicatorForDefaultLayout {
                indicatorOverlayView
            }
        }
    }

    @ViewBuilder
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: appearance.size.cornerRadius)
            .strokeBorder(.clear, lineWidth: 0)
            .background(
                RoundedRectangle(cornerRadius: appearance.size.cornerRadius)
                    .fill(backgroundColor)
            )
            .frame(height: appearance.size.fieldHeight, debug: debugConfiguration.fieldView)
    }

    @ViewBuilder
    private var innerTitleView: some View {
        HStack(spacing: 0) {
            Text(title)
                .typography(innerTitleTypography)
                .foregroundColor(appearance.titleColor.color(for: colorScheme, subtheme: subtheme))
                .multilineTextAlignment(appearance.innerTitleTextAlignment)
                .debug(condition: debugConfiguration.innerTitle)
        
            if !optionalTitle.isEmpty {
                innerOptionalTitleView
            }
        }
        .padding(.top, appearance.size.boxPaddingTop)
        .padding(.bottom, appearance.size.titleInnerPadding)
    }

    @ViewBuilder
    private var bottomLineView: some View {
        if divider {
            Rectangle()
                .fill(bottomLineColor)
                .frame(height: appearance.size.dividerHeight, debug: debugConfiguration.fieldView)
        } else {
            EmptyView()
        }
    }
    
    private func scroll(with proxy: ScrollViewProxy) {
        if !textAfter.isEmpty {
            proxy.scrollTo(textAfterIdentifier, anchor: .trailing)
        } else {
            proxy.scrollTo(textFieldIdentifier, anchor: .trailing)
        }
    }
        
    private var endContentColor: Color {
        if readOnly {
            return appearance.endContentColorReadOnly?.color(for: colorScheme, subtheme: subtheme) ?? appearance.endContentColor.color(for: colorScheme, subtheme: subtheme)
        }
        return appearance.endContentColor.color(for: colorScheme, subtheme: subtheme)
    }
    
    private var backgroundColor: Color {
        if readOnly {
            return appearance.backgroundColorReadOnly?.color(for: colorScheme, subtheme: subtheme) ?? appearance.backgroundColor.color(for: colorScheme, subtheme: subtheme)
        }
        if isFocused {
            return appearance.backgroundColorFocused.color(for: colorScheme, subtheme: subtheme)
        }
        return appearance.backgroundColor.color(for: colorScheme, subtheme: subtheme)
    }
    
    private var captionColor: Color {
        if readOnly {
            return appearance.captionColorReadOnly.color(for: colorScheme, subtheme: subtheme)
        }
        if isFocused {
            return appearance.captionColorFocused.color(for: colorScheme, subtheme: subtheme)
        }
        return appearance.captionColor.color(for: colorScheme, subtheme: subtheme)
    }
    
    private var placeholderColor: Color {
        if readOnly {
            return appearance.placeholderColorReadOnly?.color(for: colorScheme, subtheme: subtheme) ?? appearance.placeholderColor.color(for: colorScheme, subtheme: subtheme)
        }
        if isFocused {
            return appearance.placeholderColorFocused.color(for: colorScheme, subtheme: subtheme)
        }
        return appearance.placeholderColor.color(for: colorScheme, subtheme: subtheme)
    }
    
    private var textColor: Color {
        if readOnly {
            return appearance.textColorReadOnly?.color(for: colorScheme, subtheme: subtheme) ?? appearance.textColor.color(for: colorScheme, subtheme: subtheme)
        }
        if isFocused {
            return appearance.textColorFocused.color(for: colorScheme, subtheme: subtheme)
        }
        return appearance.textColor.color(for: colorScheme, subtheme: subtheme)
    }
    
    private var bottomLineColor: Color {
        if readOnly {
            return appearance.lineColorReadOnly.color(for: colorScheme, subtheme: subtheme)
        }
        if isFocused {
            return appearance.lineColorFocused.color(for: colorScheme, subtheme: subtheme)
        }
        return appearance.lineColor.color(for: colorScheme, subtheme: subtheme)
    }
    
    private var iconViewColor: Color {
        if readOnly {
            return appearance.startContentColorReadOnly?.color(for: colorScheme, subtheme: subtheme) ?? appearance.startContentColor.color(for: colorScheme, subtheme: subtheme)
        }
        if isFocused {
            return appearance.startContentColorFocused.color(for: colorScheme, subtheme: subtheme)
        }
        return appearance.startContentColor.color(for: colorScheme, subtheme: subtheme)
    }

    @ViewBuilder
    private var iconView: some View {
        iconContent
            .foregroundColor(iconViewColor)
            .frame(width: iconViewWidth, height: min(appearance.size.iconSize.height, appearance.size.fieldHeight), debug: debugConfiguration.icon)
            .padding(.trailing, appearance.size.iconPadding, debug: debugConfiguration.icon)
    }

    @ViewBuilder
    private var iconActionView: some View {
        actionContent
            .foregroundColor(endContentColor)
            .frame(width: iconActionViewWidth, height: min(appearance.size.iconActionSize.height, appearance.size.fieldHeight), debug: debugConfiguration.iconAction)
            .padding(.leading, appearance.size.iconActionPadding, debug: debugConfiguration.iconAction)
    }

    @ViewBuilder
    private var captionLabel: some View {
        Text(caption)
            .typography(captionTypography)
            .multilineTextAlignment(appearance.captionTextAlignment)
            .foregroundColor(captionColor)
            .debug(condition: debugConfiguration.caption)
            .padding(.top, appearance.size.captionTopPadding, debug: debugConfiguration.captionTopPadding)
    }

    @ViewBuilder
    private var indicatorView: some View {
        Circle()
            .fill(appearance.requiredIndicatorColor.color(for: colorScheme, subtheme: subtheme))
            .frame(width: indicatorSize.width, height: indicatorSize.height, debug: debugConfiguration.indicatorView)
    }

    @ViewBuilder
    private var indicatorOverlayView: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                if appearance.requiredPlacement == .right {
                    Spacer()
                }
                indicatorView
                    .debug(condition: debugConfiguration.indicatorView)
            }
            Spacer()
        }
        .frame(height: appearance.size.fieldHeight, debug: debugConfiguration.fieldHeight)
    }

    // MARK: - Computed Properties for Conditions
    
    private var calculatedTextSize: CGFloat {
        // Когда маска используется, вычисляем размер на основе placeholder маски
        // для предотвращения проблем с асинхронным обновлением
        let displayText = (mask != nil && !text.isEmpty) ? text : text
        let placeholderText = mask?.placeholder ?? ""
        
        // Используем максимум между текущим текстом и placeholder маски
        let textToMeasure = (mask != nil && displayText.count < placeholderText.count) 
            ? placeholderText 
            : displayText
        
        let textSize = (textToMeasure as NSString).size(withAttributes: [NSAttributedString.Key.font: textTypography.uiFont])
        return max(ceil(textSize.width), 1.0)
    }
    
    private var iconActionViewWidth: CGFloat {
        min(appearance.size.iconActionSize.width, appearance.size.fieldHeight)
    }
    
    private var iconViewWidth: CGFloat {
        min(appearance.size.iconSize.width, appearance.size.fieldHeight)
    }
    
    private var indicatorSize: CGSize {
        return appearance.size.indicatorSize
    }

    private var shouldShowInnerTitle: Bool {
        appearance.labelPlacement == .inner &&
        !displayChips &&
        appearance.innerTitleTypography.typography(with: appearance.size) != nil &&
        (!text.isEmpty || isFocused) &&
        !(title.isEmpty && required) &&
        (!title.isEmpty || !optionalTitle.isEmpty)
    }

    private var shouldShowEdgeIndicatorForDefaultLayout: Bool {
        (appearance.labelPlacement == .inner || appearance.labelPlacement == .none) &&
        required &&
        layout == .default
    }

    private var shouldShowRequiredIndicatorAfterTitle: Bool {
        required &&
        appearance.requiredPlacement == .right
    }

    private var showInnerTitleIndicatorForClearLayout: Bool {
        (appearance.labelPlacement == .inner || appearance.labelPlacement == .none) &&
        required &&
        appearance.requiredPlacement == .left &&
        layout == .clear
    }
    
    private var showInnerTitleRightIndicatorForClearLayout: Bool {
        (appearance.labelPlacement == .inner || appearance.labelPlacement == .none) &&
        required &&
        appearance.requiredPlacement == .right &&
        layout == .clear
    }

    private var showOuterTitleIndicator: Bool {
        appearance.labelPlacement == .outer &&
        required &&
        appearance.requiredPlacement == .left
    }
    
    private var required: Bool {
        appearance.requiredPlacement != .none
    }
    
    private var shouldCenterText: Bool {
        return appearance.labelPlacement == .outer || appearance.labelPlacement == .none || !shouldShowInnerTitle
    }
    
    private var showSuffixOrPrefix: Bool {
        !displayChips
    }

    private var displayChips: Bool {
        switch value {
        case .single:
            return false
        case .multiple:
            return true
        }
    }

    private var chipCornerRadius: CGFloat {
        switch value {
        case .single:
            return 0
        case .multiple:
            let chipAppearance = appearance.chipGroupAppearance.chipAppearance
            return chipAppearance.size.cornerRadius
        }
    }
    
    private var calculatedChipGroupHeight: CGFloat {
        return min(appearance.chipAppearance.size.height, chipGroupContentHeight)
    }
    
    private var textFieldIdentifier: String {
        var hasher = Hasher()
        appearance.hash(into: &hasher)
        return String(hasher.finalize())
    }
    
    private var textAfterIdentifier: String {
        var hasher = Hasher()
        textAfter.hash(into: &hasher)
        return String(hasher.finalize())
    }

    private var titleTypography: TypographyToken {
        guard let typography = appearance.titleTypography.typography(with: appearance.size) else {
            fatalError("Undefined Title Typography for appearance.size \(appearance.size).")
        }
        return typography
    }

    private var innerTitleTypography: TypographyToken {
        guard let typography = appearance.innerTitleTypography.typography(with: appearance.size) else {
            fatalError("Undefined Inner Title Typography for appearance.size \(appearance.size).")
        }
        return typography
    }

    private var captionTypography: TypographyToken {
        guard let typography = appearance.captionTypography.typography(with: appearance.size) else {
            fatalError("Undefined Caption Typography for appearance.size \(appearance.size).")
        }
        return typography
    }

    private var textTypography: TypographyToken {
        guard let typography = appearance.textTypography.typography(with: appearance.size) else {
            fatalError("Undefined Text Typography for appearance.size \(appearance.size).")
        }
        return typography
    }
    
    private var textBeforeTypography: TypographyToken {
        guard let typography = appearance.textBeforeTypography.typography(with: appearance.size) else {
            fatalError("Undefined Text Typography for appearance.size \(appearance.size).")
        }
        return typography
    }
    
    private var textAfterTypography: TypographyToken {
        guard let typography = appearance.textAfterTypography.typography(with: appearance.size) else {
            fatalError("Undefined Text Typography for appearance.size \(appearance.size).")
        }
        return typography
    }
    
    private var boxLeadingPadding: CGFloat {
        if displayChips {
            return appearance.size.chipsPadding
        }
        
        return layout == .clear ? 0 : appearance.size.boxLeadingPadding
    }
    
    private var boxTrailingPadding: CGFloat {
        layout == .clear ? 0 : appearance.size.boxTrailingPadding
    }
    
    var appearance: TextFieldAppearance {
        _appearance ?? environmentAppearance
    }
}
