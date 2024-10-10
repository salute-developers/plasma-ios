import SwiftUI
import SDDSThemeCore
import SDDSComponents

// MARK: - Enums and Configurations

/// Определяет возможные стили для текстового поля.
public enum TextAreaStyle: String {
    case `default`
    case error
    case warning
    case success
}

/// Определяет размещение метки текстового поля.
public enum TextAreaLabelPlacement: String {
    case outer
    case inner
    case none
}

/// Определяет размещение обязательного индикатора.
public enum TextAreaRequiredPlacement: String {
    case left
    case right
}

/// Определяет возможные значения текстового поля.
public enum TextAreaValue {
    /// Одиночное текстовое значение.
    case single(String)
    /// Множественное значение с чипсами.
    case multiple(String, [ChipData])
}

// MARK: - SDDSTextArea

/**
 `SDDSTextArea` представляет собой настраиваемое текстовое поле с поддержкой различных стилей, макетов и конфигураций.

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
    - requiredPlacement: Размещение обязательного индикатора (`left`, `right`).
    - appearance: Параметры внешнего вида текстового поля.
    - size: Конфигурация размеров текстового поля.
    - layout: Макет текстового поля (`default`, `clear`).
    - accessibility: Параметры доступности.
    - iconViewProvider: Поставщик левого иконки.
    - iconActionViewProvider: Поставщик правой иконки действия.
 */
public struct SDDSTextArea: View {
    @State var text: String
    public let value: TextAreaValue
    public let title: String
    public let optionalTitle: String
    public let placeholder: String
    public let caption: String
    public let counter: String
    public let disabled: Bool
    public let readOnly: Bool
    public let style: TextAreaStyle
    public let labelPlacement: TextAreaLabelPlacement
    public let required: Bool
    public let requiredPlacement: TextAreaRequiredPlacement
    public let appearance: TextAreaAppearance
    public let size: TextAreaSizeConfiguration
    public let accessibility: TextAreaAccessibility
    public let iconViewProvider: ViewProvider?
    public let iconActionViewProvider: ViewProvider?

    @Environment(\.colorScheme) private var colorScheme
    @State private var isFocused: Bool = false
    @State private var oldText: String
    @State private var textHeight: CGFloat = 40.0
    private let debugConfiguration: TextFieldDebugConfiguration

    public init(
        value: TextAreaValue,
        title: String = "",
        optionalTitle: String = "",
        placeholder: String = "",
        caption: String = "",
        counter: String = "",
        disabled: Bool = false,
        readOnly: Bool = false,
        style: TextAreaStyle = .default,
        labelPlacement: TextAreaLabelPlacement = .outer,
        required: Bool = false,
        requiredPlacement: TextAreaRequiredPlacement = .left,
        appearance: TextAreaAppearance,
        size: TextAreaSizeConfiguration,
        accessibility: TextAreaAccessibility = TextAreaAccessibility(),
        iconViewProvider: ViewProvider? = nil,
        iconActionViewProvider: ViewProvider? = nil
    ) {
        switch value {
        case .single(let text):
            _text = State(wrappedValue: text)
        case .multiple(let text, _):
            _text = State(wrappedValue: text)
        }
        _oldText = _text
        _textHeight = State(wrappedValue: size.fieldHeight)
        
        self.value = value
        self.caption = caption
        self.counter = counter
        self.disabled = disabled
        self.readOnly = readOnly
        self.style = style
        self.labelPlacement = labelPlacement
        self.required = required
        self.requiredPlacement = requiredPlacement
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder
        self.appearance = appearance
        self.size = size
        self.accessibility = accessibility
        self.iconViewProvider = iconViewProvider
        self.iconActionViewProvider = iconActionViewProvider
        self.debugConfiguration = TextFieldDebugConfiguration()
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 0) {
            if showOuterTitleIndicatorForDefaultLayout {
                indicatorWithTrailingPadding
            }
            
            VStack(alignment: .leading, spacing: 0) {
                if labelPlacement == .outer {
                    titleLabel
                        .multilineTextAlignment(appearance.titleTextAlignment)
                        .debug(condition: debugConfiguration.title)
                }

                HStack(spacing: 0) {
                    fieldView
                        .debug(condition: debugConfiguration.fieldView)
                }
                HStack(spacing: 0) {
                    captionLabel
                    Spacer()
                    counterLabel
                }
            }
        }
        .opacity(disabled ? appearance.disabledAlpha : 1)
        .debug(condition: debugConfiguration.textField)
    }

    // MARK: - Subviews

    @ViewBuilder
    private var titleLabel: some View {
        HStack(alignment: .center, spacing: 0) {
            mainTitleView

            if !optionalTitle.isEmpty {
                optionalTitleView
            }
            if shouldShowRequiredIndicatorAfterTitle {
                indicator
            }
        }
        .padding(.bottom, size.titleBottomPadding, debug: debugConfiguration.titleBottomPadding)
    }

    @ViewBuilder
    private var mainTitleView: some View {
        Text(title)
            .typography(titleTypography)
            .foregroundColor(appearance.titleColor.color(for: colorScheme))
            .multilineTextAlignment(appearance.titleTextAlignment)
            .debug(condition: debugConfiguration.title)
    }

    @ViewBuilder
    private var optionalTitleView: some View {
        Text(formattedOptionalTitle)
            .typography(titleTypography)
            .foregroundColor(appearance.optionalTitleColor.color(for: colorScheme))
            .multilineTextAlignment(appearance.titleTextAlignment)
            .debug(condition: debugConfiguration.title)
    }
    
    @ViewBuilder
    private var innerOptionalTitleView: some View {
        if required {
            EmptyView()
        } else {
            Text(formattedOptionalTitle)
                .typography(innerTitleTypography)
                .foregroundColor(appearance.optionalTitleColor.color(for: colorScheme))
                .multilineTextAlignment(appearance.titleTextAlignment)
                .debug(condition: debugConfiguration.title)
        }
    }

    @ViewBuilder
    private var indicator: some View {
        indicatorView
            .offset(y: indicatorYOffset, debug: debugConfiguration.indicatorYOffset)
            .padding(.leading, indicatorPadding, debug: debugConfiguration.indicatorPadding)
    }

    @ViewBuilder
    private var indicatorWithTrailingPadding: some View {
        indicatorView
            .offset(y: indicatorYOffset, debug: debugConfiguration.indicatorYOffset)
            .padding(.trailing, indicatorPadding, debug: debugConfiguration.indicatorPadding)
    }

    @ViewBuilder
    private var contentView: some View {
        ScrollViewReader { proxy in
            switch value {
            case .single:
                textEditor
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
                        .debug(condition: debugConfiguration.fieldView)
                }
                
                textEditor
                    .id(textFieldIdentifier)
                    .padding(.leading, size.chipContainerHorizontalPadding, debug: debugConfiguration.textField)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: chipCornerRadius, style: .continuous))
        .onChange(of: text) { _ in
            proxy.scrollTo(textFieldIdentifier, anchor: .trailing)
        }
    }

    @ViewBuilder
    private var textEditor: some View {
        switch value {
        case .single:
            GeometryReader { proxy in
                VStack(spacing: 0) {
//                    if shouldCenterText {
//                        Spacer()
//                    }
                    PlaceholderTextEditor(
                        text: $text,
                        textHeight: $textHeight,
                        placeholder: placeholder,
                        placeholderColor: placeholderColor,
                        placeholderTypography: textTypography,
                        textTypography: textTypography,
                        textEditorConfiguration: { textEditor in
                            textEditorConfiguration(textEditor: textEditor)
                                .frame(
//                                    width: calculateTextWidth(text: text, placeholder: placeholder, proxy: proxy),
                                    debug: debugConfiguration.textField
                                )
                        }
                    )
                    
//                    if shouldCenterText {
//                        Spacer()
//                    }
                }
            }
        case .multiple:
//            PlaceholderTextField(
//                text: $text,
//                placeholder: placeholder,
//                placeholderColor: placeholderColor,
//                placeholderTypography: textTypography,
//                placeholderBeforeContent: {},
//                placeholderAfterContent: { placeholderIndicator },
//                onEditingChanged: { focused in
//                    isFocused = focused
//                },
//                textFieldConfiguration: { textField in
//                    textFieldConfiguration(textField: textField)
//                        .frame(height: textTypography.lineHeight, debug: debugConfiguration.textField)
//                }
//            )
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func textEditorConfiguration(textEditor: ExpandingTextEditor) -> some View {
        textEditor
            .onChange(of: text) { newValue in
                if readOnly  {
                    self.text = oldText
                } else {
                    self.oldText = newValue
                }
            }
//            .accentColor(appearance.cursorColor.color(for: colorScheme))
//            .typography(textTypography)
//            .foregroundColor(textColor)
//            .multilineTextAlignment(appearance.inputTextAlignment)
//            .padding(size.textInputPaddings, debug: debugConfiguration.textField)
    }
    
    @ViewBuilder
    private var fieldView: some View {
        ZStack(alignment: .leading) {
            backgroundView

            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    iconView

                    VStack(alignment: .leading, spacing: 0) {
                        if shouldShowInnerTitle {
                            innerTitleView
                        }
                        Spacer()
                            .frame(maxWidth: .infinity)
                    }
                    
                    iconActionView
                }
                .padding(.leading, fieldHorizontalPadding, debug: debugConfiguration.fieldHorizontalPadding)
                .padding(.trailing, fieldHorizontalPadding, debug: debugConfiguration.fieldHorizontalPadding)
                .frame(height: size.fieldHeight, debug: debugConfiguration.fieldHeight)
                
                Spacer()
            }
            
            HStack(spacing: 0) {
                iconView.opacity(0)

                VStack {
                    Spacer().frame(height: innerTitleTypography.lineHeight)
                    contentView
                }

                iconActionView.opacity(0)
            }
            .padding(.leading, fieldHorizontalPadding, debug: debugConfiguration.fieldHorizontalPadding)
            .padding(.trailing, fieldHorizontalPadding, debug: debugConfiguration.fieldHorizontalPadding)
            .frame(height: textHeight, debug: debugConfiguration.fieldHeight)
            
            if shouldShowIndicatorForInnerLabelDefaultLayout {
                indicatorOverlayView
            }
        }
        .frame(height: totalHeight, debug: debugConfiguration.fieldHeight)
    }

    @ViewBuilder
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: size.cornerRadius)
            .strokeBorder(appearance.borderColor(for: style).color(for: colorScheme), lineWidth: size.borderWidth)
            .background(
                RoundedRectangle(cornerRadius: size.cornerRadius)
                    .fill(appearance.backgroundColor(for: style, isFocused: isFocused).color(for: colorScheme))
            )
            .frame(height: totalHeight, debug: debugConfiguration.fieldView)
    }
    
    private var totalHeight: CGFloat {
        var result = textHeight
        result += (size.textInputPaddings.top + size.textInputPaddings.bottom)
        if shouldShowInnerTitle {
            result += 2 * size.titleInnerPadding
            result += innerTitleTypography.lineHeight
        }
        return max(result, size.fieldHeight)
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
    
    private var captionColor: Color {
        return appearance.captionColor(for: isFocused ? .default : style).color(for: colorScheme)
    }
    
    private var counterColor: Color {
        return appearance.counterColor(for: isFocused ? .default : style).color(for: colorScheme)
    }
    
    private var placeholderColor: Color {
        return appearance.placeholderColor.color(for: colorScheme)
    }
    
    private var textColor: Color {
        return appearance.textColor.color(for: colorScheme)
    }

    @ViewBuilder
    private var iconView: some View {
        if let leftView = iconViewProvider?.view {
            leftView
                .foregroundColor(textColor)
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
    private var counterLabel: some View {
        Text(caption)
            .typography(counterTypography)
            .multilineTextAlignment(appearance.counterTextAlignment)
            .foregroundColor(counterColor)
            .padding(.top, size.captionTopPadding, debug: debugConfiguration.captionTopPadding)
    }

    @ViewBuilder
    private var indicatorView: some View {
        Circle()
            .fill(appearance.requiredIndicatorColor.color(for: colorScheme))
            .frame(width: size.indicatorSize.width, height: size.indicatorSize.height, debug: debugConfiguration.indicatorView)
    }

    @ViewBuilder
    private var placeholderIndicator: some View {
        if showNoneTitleIndicatorForClearLayout {
            indicator
        } else {
            EmptyView()
        }
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
        let textSize = (text as NSString).size(withAttributes: [NSAttributedString.Key.font: textTypography.uiFont])
        if displayChips {
            if !text.isEmpty {
                return textSize.width + size.textHorizontalPadding
            } else {
                let placeholderSize = (placeholder as NSString).size(withAttributes: [NSAttributedString.Key.font: textTypography.uiFont])
                return placeholderSize.width
            }
        }
        
        var maxWidth = proxy.size.width
        maxWidth -= size.textInputPaddings.leading + size.textInputPaddings.trailing
        
        return min(
            textSize.width + size.textHorizontalPadding,
            maxWidth
        )
    }
    
    private var iconActionViewWidth: CGFloat {
        min(size.iconActionSize.width, size.fieldHeight)
    }
    
    private var iconViewWidth: CGFloat {
        min(size.iconSize.width, size.fieldHeight)
    }

    private var indicatorYOffset: CGFloat {
        size.indicatorYOffset(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement)
    }

    private var indicatorPadding: CGFloat {
        size.indicatorPadding(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement)
    }

    private var shouldShowInnerTitle: Bool {
        labelPlacement == .inner &&
        !displayChips &&
        appearance.innerTitleTypography.typography(with: size) != nil
    }

    private var shouldShowIndicatorForInnerLabelDefaultLayout: Bool {
        labelPlacement == .inner &&
        required
    }

    private var shouldShowRequiredIndicatorAfterTitle: Bool {
        required &&
        requiredPlacement == .right
    }

    private var showOuterTitleIndicatorForDefaultLayout: Bool {
        labelPlacement == .outer &&
        required &&
        requiredPlacement == .left
    }

    private var showNoneTitleIndicatorForClearLayout: Bool {
        labelPlacement == .none &&
        required &&
        requiredPlacement == .right &&
        !isFocused
    }
    
    private var shouldCenterText: Bool {
        return labelPlacement == .outer || labelPlacement == .none || !shouldShowInnerTitle
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
            guard let chipSize = chips.first?.size else {
                return 0
            }
            switch chipSize.borderStyle {
            case .default(let radius):
                return radius
            case .rounded:
                return chipSize.height / 2
            }
        }
    }

    private let textFieldIdentifier = "TextArea"

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
    
    private var counterTypography: TypographyToken {
        guard let typography = appearance.counterTypography.typography(with: size) else {
            fatalError("Undefined Counter Typography for size \(size).")
        }
        return typography
    }

    private var textTypography: TypographyToken {
        guard let typography = appearance.textTypography.typography(with: size) else {
            fatalError("Undefined Text Typography for size \(size).")
        }
        return typography
    }

    private var fieldHorizontalPadding: CGFloat {
        size.fieldHorizontalPadding
    }
}

#Preview {
    SDDSTextAreaPreview.previews
}
