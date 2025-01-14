import SwiftUI
import SDDSThemeCore
import SDDSComponents

// MARK: - Enums and Configurations

/// Определяет возможные стили для текстового поля.
public enum TextFieldStyle: String, CaseIterable {
    case `default`
    case error
    case warning
    case success
}

/// Определяет возможные макеты для текстового поля.
public enum TextFieldLayout: String, CaseIterable {
    case `default`
    case clear
}

/// Определяет размещение метки текстового поля.
public enum TextFieldLabelPlacement: String, CaseIterable {
    case outer
    case inner
    case none
}

/// Определяет размещение обязательного индикатора.
public enum TextFieldRequiredPlacement: String, CaseIterable {
    case left
    case right
}

/// Определяет возможные значения текстового поля.
public enum TextFieldValue: Equatable {
    /// Одиночное текстовое значение.
    case single(String)
    /// Множественное значение с чипсами.
    case multiple(String, [ChipData])
    
    public static func == (lhs: TextFieldValue, rhs: TextFieldValue) -> Bool {
        switch (lhs, rhs) {
        case (.single(let lhs), .single(let rhs)):
            return lhs == rhs
        case (.multiple(let lhsText, let lhsChips), .multiple(let rhsText, let rhsChips)):
            return lhsText == rhsText && lhsChips == rhsChips
        default:
            return false
        }
    }
    
    public var text: String {
        switch self {
        case .single(let text):
            return text
        case .multiple(let text, _):
            return text
        }
    }
    
    public func updated(with text: String) -> TextFieldValue {
        switch self {
        case .single:
            return .single(text)
        case .multiple(_, let chips):
            return .multiple(text, chips)
        }
    }
}

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
    - style: Стиль текстового поля (`default`, `error`, `warning`, `success`).
    - labelPlacement: Размещение метки (`outer`, `inner`, `none`).
    - required: Флаг, указывающий, является ли поле обязательным.
    - divider: Флаг, указывающий, показывать ли линию разделителя.
    - requiredPlacement: Размещение обязательного индикатора (`left`, `right`).
    - appearance: Параметры внешнего вида текстового поля.
    - size: Конфигурация размеров текстового поля.
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
    public let style: TextFieldStyle
    public let labelPlacement: TextFieldLabelPlacement
    public let required: Bool
    public let divider: Bool
    public let requiredPlacement: TextFieldRequiredPlacement
    public let appearance: TextFieldAppearance
    public let size: TextFieldSizeConfiguration
    public let layout: TextFieldLayout
    public let accessibility: TextFieldAccessibility
    public let iconViewProvider: ViewProvider?
    public let iconActionViewProvider: ViewProvider?

    @Environment(\.colorScheme) private var colorScheme
    @State private var isFocused: Bool = false
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
        style: TextFieldStyle = .default,
        labelPlacement: TextFieldLabelPlacement = .outer,
        required: Bool = false,
        divider: Bool = true,
        requiredPlacement: TextFieldRequiredPlacement = .left,
        appearance: TextFieldAppearance,
        size: TextFieldSizeConfiguration,
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
        self.style = style
        self.labelPlacement = labelPlacement
        self.required = required
        self.divider = divider
        self.requiredPlacement = requiredPlacement
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder
        self.appearance = appearance
        self.size = size
        self.layout = layout
        self.accessibility = accessibility
        self.iconViewProvider = iconViewProvider
        self.iconActionViewProvider = iconActionViewProvider
        self.debugConfiguration = TextFieldDebugConfiguration()
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 0) {
            if showOuterTitleIndicatorForDefaultLayout || showInnerTitleIndicatorForClearLayout {
                indicatorWithTrailingPadding
            }
            
            VStack(alignment: .leading, spacing: 0) {
                if labelPlacement == .outer {
                    titleLabel
                        .multilineTextAlignment(appearance.titleTextAlignment)
                }

                HStack(spacing: 0) {
                    fieldView
                        .onTapGesture {
                            guard !displayChips else {
                                return
                            }
                            isFocused = true
                        }
                        .debug(condition: debugConfiguration.fieldView)
                }
                HStack(spacing: 0) {
                    if showInnerTitleIndicatorForClearLayout {
                        Spacer()
                            .frame(width: size.indicatorSize.width)
                    }
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
        .padding(.bottom, size.titleBottomPadding, debug: debugConfiguration.titleBottomPadding)
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
        Text(optionalTitle)
            .typography(titleTypography)
            .frame(height: titleTypography.lineHeight)
            .foregroundColor(appearance.optionalTitleColor.color(for: colorScheme))
            .multilineTextAlignment(appearance.titleTextAlignment)
            .debug(condition: debugConfiguration.title)
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
                .padding(.leading, size.optionalPadding)
        }
    }

    @ViewBuilder
    private var indicatorWithTrailingPadding: some View {
        indicatorView
            .padding(.trailing, size.indicatorOffset(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout).x)
            .padding(.top, size.indicatorOffset(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout).y)
    }
    
    @ViewBuilder
    private var indicatorWitLeadingPadding: some View {
        indicatorView
            .padding(.leading, size.indicatorOffset(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout).x)
            .padding(.top, size.indicatorOffset(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout).y)
    }

    @ViewBuilder
    private var contentView: some View {
        ScrollViewReader { proxy in
            switch value {
            case .single:
                textField
            case .multiple(_, let chips):
                chipsScrollView(chips: chips, proxy: proxy)
            }
        }
    }

    @ViewBuilder
    private func chipsScrollView(chips: [ChipData], proxy: ScrollViewProxy) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: size.multipleValueHorizontalPadding) {
                ForEach(chips, id: \.self) { chipData in
                    SDDSChip(data: chipData)
                }
                
                textField
                    .id(textFieldIdentifier)
                    .padding(.leading, size.chipContainerHorizontalPadding, debug: debugConfiguration.textField)
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
                                .padding(.leading, size.textBeforeLeadingPadding)
                                .padding(.trailing, size.textBeforeTrailingPadding)
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
                                .padding(.leading, size.textAfterLeadingPadding)
                                .padding(.trailing, size.textAfterTrailingPadding)
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
        if placeholder.isEmpty && labelPlacement == .inner && !displayChips {
            HStack(spacing: 0) {
                if !title.isEmpty {
                    Text(title)
                        .typography(textTypography)
                        .foregroundColor(placeholderColor)
                }
                if !optionalTitle.isEmpty {
                    innerOrNonePlacementOptionalTitleView
                }
            }
        } else {
            HStack(spacing: 0) {
                Text(placeholder)
                    .typography(textTypography)
                    .foregroundColor(placeholderColor)
                if !optionalTitle.isEmpty && labelPlacement == .none {
                    innerOrNonePlacementOptionalTitleView
                }
            }
        }
    }
    
    @ViewBuilder
    private var innerOrNonePlacementOptionalTitleView: some View {
        Text(" \(optionalTitle)")
            .typography(textTypography)
            .foregroundColor(appearance.optionalTitleColor.color(for: colorScheme))
            .padding(.leading, size.optionalPadding)
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
                .frame(height: size.fieldHeight, debug: debugConfiguration.fieldHeight)
                
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
        RoundedRectangle(cornerRadius: size.cornerRadius)
            .strokeBorder(appearance.borderColor(for: style).color(for: colorScheme), lineWidth: size.borderWidth)
            .background(
                RoundedRectangle(cornerRadius: size.cornerRadius)
                    .fill(backgroundColor)
            )
            .frame(height: size.fieldHeight, debug: debugConfiguration.fieldView)
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
        .padding([.top, .bottom], size.titleInnerPadding, debug: debugConfiguration.innerTitle)
    }

    @ViewBuilder
    private var bottomLineView: some View {
        if divider {
            Rectangle()
                .fill(bottomLineColor)
                .frame(height: size.dividerHeight, debug: debugConfiguration.fieldView)
        } else {
            EmptyView()
        }
    }
    
    private var backgroundColor: Color {
        if readOnly {
            return appearance.backgroundColorReadOnly.color(for: colorScheme)
        }
        return appearance.backgroundColor(for: style, isFocused: isFocused, readOnly: readOnly).color(for: colorScheme)
    }
    
    private var captionColor: Color {
        if readOnly {
            return appearance.captionColorReadOnly.color(for: colorScheme)
        }
        return appearance.captionColor(for: isFocused ? .default : style).color(for: colorScheme)
    }
    
    private var placeholderColor: Color {
        if readOnly {
            return appearance.placeholderColorReadOnly.color(for: colorScheme)
        }
        return appearance.placeholderColor(for: isFocused ? .default : style, layout: layout).color(for: colorScheme)
    }
    
    private var textColor: Color {
        if readOnly {
            return appearance.textColorReadOnly.color(for: colorScheme)
        }
        return appearance.textColor(for: isFocused ? .default : style, layout: layout).color(for: colorScheme)
    }
    
    private var bottomLineColor: Color {
        if isFocused {
            return appearance.focusedLineColor(for: style).color(for: colorScheme)
        }
        
        switch style {
        case .error, .success, .warning:
            return appearance.placeholderColor(for: style, layout: layout).color(for: colorScheme)
        case .default:
            return appearance.lineColor.color(for: colorScheme)
        }
    }

    @ViewBuilder
    private var iconView: some View {
        if let leftView = iconViewProvider?.view {
            leftView
                .foregroundColor(appearance.startContentColor.color(for: colorScheme))
                .frame(width: iconViewWidth, height: min(size.iconSize.height, size.fieldHeight), debug: debugConfiguration.icon)
                .padding(.trailing, size.iconPadding, debug: debugConfiguration.icon)
        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    private var iconActionView: some View {
        if let rightView = iconActionViewProvider?.view {
            rightView
                .foregroundColor(appearance.endContentColor.color(for: colorScheme))
                .frame(width: iconActionViewWidth, height: min(size.iconActionSize.height, size.fieldHeight), debug: debugConfiguration.iconAction)
                .padding(.leading, size.iconActionPadding, debug: debugConfiguration.iconAction)
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
            .padding(.top, size.captionTopPadding, debug: debugConfiguration.captionTopPadding)
    }

    @ViewBuilder
    private var indicatorView: some View {
        Circle()
            .fill(appearance.requiredIndicatorColor.color(for: colorScheme))
            .frame(width: size.indicatorSize.width, height: size.indicatorSize.height, debug: debugConfiguration.indicatorView)
    }

    @ViewBuilder
    private var indicatorOverlayView: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                if requiredPlacement == .right {
                    Spacer()
                }
                indicatorView
                    .debug(condition: debugConfiguration.indicatorView)
            }
            Spacer()
        }
        .frame(height: size.fieldHeight, debug: debugConfiguration.fieldHeight)
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
            maxWidth -= (size.textBeforeLeadingPadding + size.textBeforeTrailingPadding)
        }
        if !textAfter.isEmpty && !displayChips {
            let textBeforeSize = (textAfter as NSString).size(withAttributes: [NSAttributedString.Key.font: textAfterTypography.uiFont])
            maxWidth -= (textBeforeSize.width + deltaPadding)
            maxWidth -= (size.textAfterLeadingPadding + size.textAfterTrailingPadding)
        }
        
        return min(
            textSize.width + deltaPadding,
            maxWidth
        )
    }
    
    private var iconActionViewWidth: CGFloat {
        min(size.iconActionSize.width, size.fieldHeight)
    }
    
    private var iconViewWidth: CGFloat {
        min(size.iconSize.width, size.fieldHeight)
    }

    private var shouldShowInnerTitle: Bool {
        labelPlacement == .inner &&
        !displayChips &&
        appearance.innerTitleTypography.typography(with: size) != nil &&
        !placeholder.isEmpty
    }

    private var shouldShowEdgeIndicatorForDefaultLayout: Bool {
        (labelPlacement == .inner || labelPlacement == .none) &&
        required &&
        layout == .default
    }

    private var shouldShowRequiredIndicatorAfterTitle: Bool {
        required &&
        requiredPlacement == .right
    }

    private var showInnerTitleIndicatorForClearLayout: Bool {
        (labelPlacement == .inner || labelPlacement == .none) &&
        required &&
        requiredPlacement == .left &&
        layout == .clear
    }
    
    private var showInnerTitleRightIndicatorForClearLayout: Bool {
        (labelPlacement == .inner || labelPlacement == .none) &&
        required &&
        requiredPlacement == .right &&
        layout == .clear
    }

    private var showOuterTitleIndicatorForDefaultLayout: Bool {
        labelPlacement == .outer &&
        required &&
        requiredPlacement == .left &&
        layout == .default
    }
    
    private var shouldCenterText: Bool {
        return labelPlacement == .outer || labelPlacement == .none || !shouldShowInnerTitle
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

    private var formattedOptionalTitle: String {
        " \(optionalTitle)"
    }

    private var chipCornerRadius: CGFloat {
        switch value {
        case .single:
            return 0
        case .multiple(_, let chips):
            guard let chipAppearance = chips.first?.appearance else {
                return 0
            }
            return chipAppearance.size.cornerRadius(style: chipAppearance.shapeStyle)
        }
    }
    
    private let textFieldIdentifier = "TextField"

    private var titleTypography: TypographyToken {
        guard let typography = appearance.titleTypography.typography(with: size) else {
            fatalError("Undefined Title Typography for size \(size).")
        }
        return typography
    }

    private var innerTitleTypography: TypographyToken {
        guard let typography = appearance.innerTitleTypography.typography(with: size) else {
            fatalError("Undefined Inner Title Typography for size \(size).")
        }
        return typography
    }

    private var captionTypography: TypographyToken {
        guard let typography = appearance.captionTypography.typography(with: size) else {
            fatalError("Undefined Caption Typography for size \(size).")
        }
        return typography
    }

    private var textTypography: TypographyToken {
        guard let typography = appearance.textTypography.typography(with: size) else {
            fatalError("Undefined Text Typography for size \(size).")
        }
        return typography
    }
    
    private var textBeforeTypography: TypographyToken {
        guard let typography = appearance.textBeforeTypography.typography(with: size) else {
            fatalError("Undefined Text Typography for size \(size).")
        }
        return typography
    }
    
    private var textAfterTypography: TypographyToken {
        guard let typography = appearance.textAfterTypography.typography(with: size) else {
            fatalError("Undefined Text Typography for size \(size).")
        }
        return typography
    }
    
    private var boxLeadingPadding: CGFloat {
        if displayChips {
            return size.chipsPadding
        }
        
        return layout == .clear ? 0 : size.boxLeadingPadding
    }
    
    private var boxTrailingPadding: CGFloat {
        layout == .clear ? 0 : size.boxTrailingPadding
    }
}
