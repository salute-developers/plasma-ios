import SwiftUI
import SDDSThemeCore
import SDDSComponents

// MARK: - SDDSTextField

/**
 `SDDSTextField` представляет собой настраиваемое текстовое поле с поддержкой различных стилей, макетов и конфигураций.

 - Properties:
    - value: Значение текстового поля (`single` или `multiple`).
    - title: Заголовок текстового поля.
    - optionalTitle: Дополнительный заголовок (например, для опциональных полей).
    - placeholder: Текст placeholder, отображаемый при пустом поле.
    - caption: Подпись под текстовым полем.
    - textBefore: Префикс перед текстом или плейсхолдером.
    - textAfter: Суффикс после текста или плейсхолдера.
    - disabled: Флаг, указывающий, отключено ли поле.
    - readOnly: Флаг, указывающий, включено ли поле только на режим чтения.
    - labelPlacement: Размещение метки (`outer`, `inner`, `none`).
    - divider: Флаг, указывающий, показывать ли линию разделителя.
    - requiredPlacement: Размещение обязательного индикатора (`left`, `right`).
    - appearance: Параметры внешнего вида текстового поля.
    - chipGroupGap: Распределение элементов в ChipGroup.
    - layout: Макет текстового поля (`default`, `clear`).
    - accessibility: Параметры доступности.
    - iconViewProvider: Поставщик левого иконки.
    - iconActionViewProvider: Поставщик правой иконки действия.
 */
public struct SDDSTextField: View {
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
    public let appearance: TextFieldAppearance
    public let layout: TextFieldLayout
    public let accessibility: TextFieldAccessibility
    public let iconViewProvider: ViewProvider?
    public let iconActionViewProvider: ViewProvider?

    @Environment(\.colorScheme) private var colorScheme
    @State private var isFocused: Bool = false
    @State private var chipGroupContentHeight: CGFloat = 0
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
        appearance: TextFieldAppearance,
        layout: TextFieldLayout = .default,
        accessibility: TextFieldAccessibility = TextFieldAccessibility(),
        iconViewProvider: ViewProvider? = nil,
        iconActionViewProvider: ViewProvider? = nil
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
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder
        self.appearance = appearance
        self.layout = layout
        self.accessibility = accessibility
        self.iconViewProvider = iconViewProvider
        self.iconActionViewProvider = iconActionViewProvider
        self.debugConfiguration = TextFieldDebugConfiguration()
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
                        .onTapGesture {
                            guard !displayChips else {
                                return
                            }
                            withAnimation {
                                isFocused = true
                            }
                        }
                        .debug(condition: debugConfiguration.fieldView)
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
        .debug(condition: debugConfiguration.textField)
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
            .foregroundColor(appearance.titleColor.color(for: colorScheme))
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
                .foregroundColor(appearance.optionalTitleColor.color(for: colorScheme))
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
                .foregroundColor(appearance.optionalTitleColor.color(for: colorScheme))
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
                    chipData.appearance = self.appearance.chipAppearance
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
                    height: .constant(appearance.chipAppearance.size.height)
                )
                .frame(height: appearance.chipAppearance.size.height)
                
                textField
                    .id(textFieldIdentifier)
                    .padding(.leading, appearance.size.chipContainerHorizontalPadding, debug: debugConfiguration.textField)
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
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    if shouldCenterText {
                        Spacer()
                    }
                    HStack(spacing: 0) {
                        if showSuffixOrPrefix {
                            textBeforeView
                                .padding(.leading, appearance.size.textBeforeLeadingPadding)
                                .padding(.trailing, appearance.size.textBeforeTrailingPadding)
                        }
                        PlaceholderTextField(
                            text: $text, 
                            isFocused: $isFocused,
                            textColor: textColor,
                            textAlignment: appearance.inputTextAlignment,
                            cursorColor: appearance.cursorColor.color(for: colorScheme),
                            textTypography: textTypography,
                            readOnly: readOnly,
                            placeholderBeforeContent: {
                                textBeforeView
                            },
                            placeholderContent: {
                                placeholderView
                            },
                            placeholderAfterContent: {
                                HStack(spacing: 0) {
                                    textAfterView
                                }
                            },
                            onEditingChanged: { focused in
                                isFocused = focused
                            },
                            textFieldConfiguration: { textField in
                                textFieldConfiguration(textField: textField)
                                    .frame(
                                        width: calculateTextWidth(text: text, placeholder: placeholder, proxy: proxy),
                                        height: textTypography.lineHeight,
                                        debug: debugConfiguration.textField
                                    )
                            }
                        )

                        if showSuffixOrPrefix {
                            textAfterView
                                .padding(.leading, appearance.size.textAfterLeadingPadding)
                                .padding(.trailing, appearance.size.textAfterTrailingPadding)
                        }
                    }
                    
                    if shouldCenterText {
                        Spacer()
                    }
                }
            }
        case .multiple:
            PlaceholderTextField(
                text: $text,
                isFocused: $isFocused,
                textColor: textColor,
                textAlignment: appearance.inputTextAlignment,
                cursorColor: appearance.cursorColor.color(for: colorScheme),
                textTypography: textTypography,
                readOnly: readOnly,
                placeholderBeforeContent: {},
                placeholderContent: { placeholderView },
                placeholderAfterContent: { EmptyView() },
                onEditingChanged: { focused in
                    isFocused = focused
                },
                textFieldConfiguration: { textField in
                    textFieldConfiguration(textField: textField)
                        .frame(height: textTypography.lineHeight, debug: debugConfiguration.textField)
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
                self.text = newValue.text
            }
    }
    
    @ViewBuilder
    private var placeholderView: some View {
        if appearance.labelPlacement == .inner && !displayChips {
            if isFocused {
                Text(placeholder)
                    .typography(textTypography)
                    .foregroundColor(placeholderColor)
            } else {
                HStack(spacing: 0) {
                    if !title.isEmpty {
                        Text(title)
                            .typography(textTypography)
                            .foregroundColor(placeholderColor)
                    } else {
                        Text(placeholder)
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
                Text(placeholder)
                    .typography(textTypography)
                    .foregroundColor(placeholderColor)
                if !optionalTitle.isEmpty && appearance.labelPlacement == .none {
                    innerOrNonePlacementOptionalTitleView
                }
            }
        }
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
                .foregroundColor(appearance.optionalTitleColor.color(for: colorScheme))
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
                .foregroundColor(appearance.textBeforeColor.color(for: colorScheme))
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
                .foregroundColor(appearance.textAfterColor.color(for: colorScheme))
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
                .foregroundColor(appearance.titleColor.color(for: colorScheme))
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
    
    private var endContentColor: Color {
        if readOnly {
            return appearance.endContentColorReadOnly?.color(for: colorScheme) ?? appearance.endContentColor.color(for: colorScheme)
        }
        return appearance.endContentColor.color(for: colorScheme)
    }
    
    private var backgroundColor: Color {
        if readOnly {
            return appearance.backgroundColorReadOnly?.color(for: colorScheme) ?? appearance.backgroundColor.color(for: colorScheme)
        }
        if isFocused {
            return appearance.backgroundColorFocused.color(for: colorScheme)
        }
        return appearance.backgroundColor.color(for: colorScheme)
    }
    
    private var captionColor: Color {
        if readOnly {
            return appearance.captionColorReadOnly.color(for: colorScheme)
        }
        if isFocused {
            return appearance.captionColorFocused.color(for: colorScheme)
        }
        return appearance.captionColor.color(for: colorScheme)
    }
    
    private var placeholderColor: Color {
        if readOnly {
            return appearance.placeholderColorReadOnly?.color(for: colorScheme) ?? appearance.placeholderColor.color(for: colorScheme)
        }
        if isFocused {
            return appearance.placeholderColorFocused.color(for: colorScheme)
        }
        return appearance.placeholderColor.color(for: colorScheme)
    }
    
    private var textColor: Color {
        if readOnly {
            return appearance.textColorReadOnly?.color(for: colorScheme) ?? appearance.textColor.color(for: colorScheme)
        }
        if isFocused {
            return appearance.textColorFocused.color(for: colorScheme)
        }
        return appearance.textColor.color(for: colorScheme)
    }
    
    private var bottomLineColor: Color {
        if readOnly {
            return appearance.lineColorReadOnly.color(for: colorScheme)
        }
        if isFocused {
            return appearance.lineColorFocused.color(for: colorScheme)
        }
        return appearance.lineColor.color(for: colorScheme)
    }
    
    private var iconViewColor: Color {
        if readOnly {
            return appearance.startContentColorReadOnly?.color(for: colorScheme) ?? appearance.startContentColor.color(for: colorScheme)
        }
        if isFocused {
            return appearance.startContentColorFocused.color(for: colorScheme)
        }
        return appearance.startContentColor.color(for: colorScheme)
    }

    @ViewBuilder
    private var iconView: some View {
        if let leftView = iconViewProvider?.view {
            leftView
                .foregroundColor(iconViewColor)
                .frame(width: iconViewWidth, height: min(appearance.size.iconSize.height, appearance.size.fieldHeight), debug: debugConfiguration.icon)
                .padding(.trailing, appearance.size.iconPadding, debug: debugConfiguration.icon)
        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    private var iconActionView: some View {
        if let rightView = iconActionViewProvider?.view {
            rightView
                .foregroundColor(endContentColor)
                .frame(width: iconActionViewWidth, height: min(appearance.size.iconActionSize.height, appearance.size.fieldHeight), debug: debugConfiguration.iconAction)
                .padding(.leading, appearance.size.iconActionPadding, debug: debugConfiguration.iconAction)
        } else {
            EmptyView()
        }
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
            .fill(appearance.requiredIndicatorColor.color(for: colorScheme))
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
    
    private func calculateTextWidth(text: String, placeholder: String, proxy: GeometryProxy) -> CGFloat {
        let deltaPadding: CGFloat = 1.0
        let textSize = (text as NSString).size(withAttributes: [NSAttributedString.Key.font: textTypography.uiFont])
        if displayChips {
            if !text.isEmpty {
                return textSize.width + deltaPadding
            } else {
                let placeholderSize = (placeholder as NSString).size(withAttributes: [NSAttributedString.Key.font: textTypography.uiFont])
                return placeholderSize.width
            }
        }
        
        var maxWidth = proxy.size.width
        if !textBefore.isEmpty && !displayChips {
            let textBeforeSize = (textBefore as NSString).size(withAttributes: [NSAttributedString.Key.font: textBeforeTypography.uiFont])
            maxWidth -= (textBeforeSize.width + deltaPadding)
            maxWidth -= (appearance.size.textBeforeLeadingPadding + appearance.size.textBeforeTrailingPadding)
        }
        if !textAfter.isEmpty && !displayChips {
            let textBeforeSize = (textAfter as NSString).size(withAttributes: [NSAttributedString.Key.font: textAfterTypography.uiFont])
            maxWidth -= (textBeforeSize.width + deltaPadding)
            maxWidth -= (appearance.size.textAfterLeadingPadding + appearance.size.textAfterTrailingPadding)
        }
        
        return min(
            textSize.width + deltaPadding,
            maxWidth
        )
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
        !(title.isEmpty && required)
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
        !text.isEmpty && !displayChips
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
            let chipAppearance = appearance.chipAppearance
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
}
