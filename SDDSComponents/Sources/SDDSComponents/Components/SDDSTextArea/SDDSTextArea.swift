import SwiftUI
import SDDSThemeCore
import SDDSComponents

// MARK: - Enums and Configurations

/// Определяет возможные стили для текстового поля.
public enum TextAreaStyle: String, CaseIterable {
    case `default`
    case error
    case warning
    case success
}

/// Определяет размещение метки текстового поля.
public enum TextAreaLabelPlacement: String, CaseIterable {
    case outer
    case inner
    case none
}

/// Определяет возможные макеты для текстового поля.
public enum TextAreaLayout: String, CaseIterable {
    case `default`
    case clear
}

/// Определяет размещение обязательного индикатора.
public enum TextAreaRequiredPlacement: String, CaseIterable {
    case left
    case right
}

/// Определяет возможные значения текстового поля.
public enum TextAreaValue: Equatable {
    /// Одиночное текстовое значение.
    case single(String)
    /// Множественное значение с чипсами.
    case multiple(String, [ChipData])
    
    public static func == (lhs: TextAreaValue, rhs: TextAreaValue) -> Bool {
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
    
    public func updated(with text: String) -> TextAreaValue {
        switch self {
        case .single:
            return .single(text)
        case .multiple(_, let chips):
            return .multiple(text, chips)
        }
    }
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
    - dynamicHeight: Флаг, указывающий, расширяется ли текстовое поле по высоте в зависимости от высоты текста.
    - appearance: Параметры внешнего вида текстового поля.
    - size: Конфигурация размеров текстового поля.
    - layout: Макет текстового поля (`default`, `clear`).
    - accessibility: Параметры доступности.
    - iconViewProvider: Поставщик левого иконки.
    - iconActionViewProvider: Поставщик правой иконки действия.
 */
public struct SDDSTextArea: View {
    @State var text: String
    @Binding public var value: TextAreaValue
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
    public let dynamicHeight: Bool
    public let appearance: TextAreaAppearance
    public let size: TextAreaSizeConfiguration
    public let chipGroupSize: ChipGroupSizeConfiguration
    public let layout: TextAreaLayout
    public let accessibility: TextAreaAccessibility
    public let iconActionViewProvider: ViewProvider?

    @Environment(\.colorScheme) private var colorScheme
    @State private var isFocused: Bool = false
    @State private var textHeight: CGFloat = 0.0
    @State private var chipGroupContentHeight: CGFloat = 0
    private let debugConfiguration: TextFieldDebugConfiguration

    public init(
        value: Binding<TextAreaValue>,
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
        dynamicHeight: Bool = false,
        appearance: TextAreaAppearance,
        size: TextAreaSizeConfiguration,
        chipGroupSize: ChipGroupSizeConfiguration,
        layout: TextAreaLayout,
        accessibility: TextAreaAccessibility = TextAreaAccessibility(),
        iconActionViewProvider: ViewProvider? = nil
    ) {
        switch value.wrappedValue {
        case .single(let text):
            _text = State(wrappedValue: text)
            
            self.labelPlacement = labelPlacement
        case .multiple(let text, _):
            _text = State(wrappedValue: text)
            
            if labelPlacement == .inner {
                self.labelPlacement = .none
            } else {
                self.labelPlacement = labelPlacement
            }
        }
        _value = value
    
        self.caption = caption
        self.counter = counter
        self.disabled = disabled
        self.readOnly = readOnly
        self.style = style
        self.required = required
        self.requiredPlacement = requiredPlacement
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder
        self.dynamicHeight = dynamicHeight
        self.appearance = appearance
        self.size = size
        self.chipGroupSize = chipGroupSize
        self.layout = layout
        self.accessibility = accessibility
        self.iconActionViewProvider = iconActionViewProvider
        self.debugConfiguration = TextFieldDebugConfiguration()
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 0) {
            if showOuterTitleIndicatorForDefaultLayout || showInnerTitleIndicatorForClearLayout || showNoneTitleLeftIndicatorForClearLayout || showOuterTitleIndicatorForClearLayout {
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
                }
                HStack(spacing: 0) {
                    if layout == .clear {
                        captionLabel
                        Spacer()
                        counterLabel
                    }
                }
            }
            
            if showInnerTitleRightIndicatorForClearLayout || showNoneTitleIndicatorForClearLayout {
                indicator
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

            if !optionalTitle.isEmpty && !required {
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
        switch value {
        case .single:
            ZStack(alignment: .topTrailing) {
                if shouldShowInnerTitle {
                    textEditor(id: textAreaInnerTitleId)
                        .padding(.bottom, size.textInputPaddings.bottom)
                        .padding(.leading, size.textInputPaddings.leading)
                        .padding(.trailing, size.textInputPaddings.trailing)
                    
                    iconActionView
                        .padding(.trailing, fieldHorizontalPadding)
                } else {
                    textEditor(id: textAreaOuterTitleId)
                        .padding(size.textInputPaddings)
                    
                    iconActionView
                        .padding(.top, size.textInputPaddings.top)
                        .padding(.trailing, fieldHorizontalPadding)
                }
            }
        case .multiple(_, let chips):
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    ScrollView {
                        SDDSChipGroup(data: chips, size: chipGroupSize, height: $chipGroupContentHeight)
                            .padding(.trailing, iconActionTrailingPadding)
                    }
                    .frame(height: calculatedChipGroupHeight)
                    .padding(.bottom, size.chipGroupVerticalBottomPadding)
                    .padding(.top, size.chipGroupVerticalTopPadding)
                    
                    iconActionView
                        .padding(.top, size.textInputPaddings.top)
                        .padding(.trailing, layout == .clear ? size.iconActionClearTrailingPadding : fieldHorizontalPadding)
                }
                
                textEditor(id: textAreaMultipleId)
                    .padding(.bottom, size.textInputPaddings.bottom)
            }
        }
    }

    @ViewBuilder
    private func textEditor(id: (any Hashable)? = nil) -> some View {
        PlaceholderTextEditor(
            text: $text,
            textHeight: $textHeight,
            isFocused: $isFocused,
            readOnly: readOnly,
            placeholderContent: { placeholderView },
            textTypography: textTypography,
            appearance: appearance, 
            showsVerticalScrollIndicator: true,
            trailingContentPadding: trailingContentPadding,
            dynamicHeight: dynamicHeight,
            textColor: textColor,
            colorScheme: colorScheme,
            onChange: { newText in
                if newText != self.value.text {
                    self.value = self.value.updated(with: newText)
                }
            }
        )
        .allowsHitTesting(!disabled)
        .id(textEditorId(with: id))
        .onChange(of: value) { newValue in
            guard !readOnly else {
                return
            }
            self.text = newValue.text
        }
        .onChange(of: readOnly) { newValue in
            if newValue {
                isFocused = false
            }
        }
        .onChange(of: disabled) { newValue in
            if newValue {
                isFocused = false
            }
        }
    }
    
    private func textEditorId(with hashable: (any Hashable)? = nil) -> Int {
        var hasher = Hasher()
        hasher.combine(readOnly)
        hasher.combine(size.fieldHeight(layout: layout))
        if let hashable = hashable {
            hasher.combine(hashable)
        }
        return hasher.finalize()
    }
    
    @ViewBuilder
    private var placeholderView: some View {
        if placeholder.isEmpty && labelPlacement == .inner && !displayChips && !isFocused {
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
            if layout == .clear && isFocused && labelPlacement == .inner {
                EmptyView()
            } else {
                HStack(spacing: 0) {
                    Text(placeholder)
                        .typography(textTypography)
                        .foregroundColor(placeholderColor)
                    if !optionalTitle.isEmpty && (labelPlacement == .none || labelPlacement == .inner) {
                        innerOrNonePlacementOptionalTitleView
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var innerOrNonePlacementOptionalTitleView: some View {
        if required {
            EmptyView()
        } else {
            Text(" \(optionalTitle)")
                .typography(textTypography)
                .foregroundColor(appearance.optionalTitleColor.color(for: colorScheme))
        }
    }
    
    @ViewBuilder
    private var fieldView: some View {
        ZStack(alignment: .top) {
            if layout == .default {
                backgroundView
            }

            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    if shouldShowInnerTitle {
                        innerTitleView
                    }
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                }
                
                Spacer()
                    .frame(maxWidth: .infinity)
            }
            .frame(height: size.fieldHeight(layout: layout), debug: debugConfiguration.fieldHeight)
            .padding(.leading, fieldHorizontalPadding, debug: debugConfiguration.fieldHorizontalPadding)
            .padding(.trailing, fieldTrailingPadding, debug: debugConfiguration.fieldHorizontalPadding)
            
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        if shouldShowInnerTitle {
                            Spacer()
                                .frame(height: innerTitleTypography.lineHeight)
                                .padding([.top, .bottom], size.titleInnerPadding, debug: debugConfiguration.innerTitle)
                        }
                        
                        contentView
                                                
                        Spacer()
                    }
                    
                    if layout == .default {
                        HStack(alignment: .bottom) {
                            captionLabel
                            Spacer()
                            counterLabel
                        }
                        .padding(.bottom, size.captionBottomPadding)
                        .padding(.trailing, captionTrailingPadding)
                    }
                }
                .frame(height: totalHeight)
                
                if layout == .clear {
                    bottomLineView
                }
            }
            .padding(.leading, fieldHorizontalPadding, debug: debugConfiguration.fieldHorizontalPadding)
            .padding(.trailing, fieldTrailingPadding, debug: debugConfiguration.fieldHorizontalPadding)
            
            if shouldShowIndicatorForInnerLabelDefaultLayout || shouldShowIndicatorForNoneLabelDefaultLayout {
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
                    .fill(backgroundColor)
            )
            .frame(height: totalHeight, debug: debugConfiguration.fieldView)
    }
    
    private var totalHeight: CGFloat {
        var result = CGFloat(0)
        if shouldShowInnerTitle {
            result += 2 * size.titleInnerPadding
            result += innerTitleTypography.lineHeight
        }
        if displayChips {
            result += size.chipGroupVerticalBottomPadding
            result += size.chipGroupVerticalTopPadding
        }
        if layout == .default {
            result += 2 * size.captionTopPadding
            result += 2 * size.captionBottomPadding
            result += max(captionTypography.lineHeight, counterTypography.lineHeight)
        }
        result += totalTextHeight
        return max(result, size.fieldHeight(layout: layout))
    }
    
    private var totalTextHeight: CGFloat {
        var result = CGFloat(0)
        result += textHeight
        
        if displayChips {
            result += calculatedChipGroupHeight
        } else {
            result += size.textInputPaddings.top
        }
        if labelPlacement != .inner {
            result += size.textInputPaddings.bottom
        }
        if labelPlacement != .outer {
            result += size.textInputBottomPadding
        }
        return result
    }

    @ViewBuilder
    private var innerTitleView: some View {
        HStack(spacing: 0) {
            Text(title)
                .typography(innerTitleTypography)
                .foregroundColor(appearance.titleColor.color(for: colorScheme))
                .multilineTextAlignment(appearance.innerTitleTextAlignment)
                .frame(height: innerTitleTypography.lineHeight)
                .debug(condition: debugConfiguration.innerTitle)
        
            if !optionalTitle.isEmpty {
                innerOptionalTitleView
            }
        }
        .frame(height: innerTitleTypography.lineHeight)
        .padding([.top, .bottom], size.titleInnerPadding, debug: debugConfiguration.innerTitle)
    }
    
    private var counterColor: Color {
        return appearance.counterColorDefault.color(for: colorScheme)
    }
    
    private var backgroundColor: Color {
        if readOnly {
            return appearance.backgroundColorDefault.color(for: colorScheme)
        }
        return appearance.backgroundColor(for: style, isFocused: isFocused).color(for: colorScheme)
    }
    
    private var captionColor: Color {
        if readOnly {
            return appearance.captionColorDefault.color(for: colorScheme)
        }
        return appearance.captionColor(for: isFocused ? .default : style).color(for: colorScheme)
    }
    
    private var placeholderColor: Color {
        return appearance.placeholderColor(for: isFocused ? .default : style, layout: layout).color(for: colorScheme)
    }
    
    private var textColor: Color {
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
    private var iconActionView: some View {
        if let rightView = iconActionViewProvider?.view {
            rightView
                .frame(width: iconActionViewWidth, height: iconActionViewHeight, debug: debugConfiguration.iconAction)
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
            .frame(height: captionTypography.lineHeight)
            .padding(.top, size.captionTopPadding, debug: debugConfiguration.captionTopPadding)
    }
    
    @ViewBuilder
    private var counterLabel: some View {
        Text(counter)
            .typography(counterTypography)
            .multilineTextAlignment(.trailing)
            .foregroundColor(counterColor)
            .frame(height: counterTypography.lineHeight)
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
        VStack {
            HStack(spacing: 0) {
                if requiredPlacement == .right {
                    Spacer()
                }
                indicatorView
                    .debug(condition: debugConfiguration.indicatorView)
                if requiredPlacement == .left {
                    Spacer()
                }
            }
            Spacer()
        }

        .frame(height: totalHeight, debug: debugConfiguration.fieldHeight)
    }
    
    @ViewBuilder
    private var bottomLineView: some View {
        Rectangle()
            .fill(bottomLineColor)
            .frame(height: size.lineWidth, debug: debugConfiguration.fieldView)
    }

    // MARK: - Computed Properties for Conditions
    
    private var iconActionViewWidth: CGFloat {
        min(size.iconActionSize.width, size.fieldHeight(layout: layout))
    }
    
    private var iconActionViewHeight: CGFloat {
        min(size.iconActionSize.height, size.fieldHeight(layout: layout))
    }

    private var indicatorYOffset: CGFloat {
        size.indicatorYOffset(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout)
    }

    private var indicatorPadding: CGFloat {
        size.indicatorPadding(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout)
    }
    
    private var captionTrailingPadding: CGFloat {
        fieldHorizontalPadding
    }
    
    private var fieldTrailingPadding: CGFloat {
        0
    }
    
    private var iconActionTrailingPadding: CGFloat {
        if let _ = iconActionViewProvider?.view {
            return iconActionViewWidth + size.iconActionPadding
        } else {
            return 0
        }
    }

    private var shouldShowInnerTitle: Bool {
        labelPlacement == .inner &&
        !displayChips &&
        appearance.innerTitleTypography.typography(with: size) != nil &&
        (!text.isEmpty || isFocused)
    }

    private var shouldShowIndicatorForInnerLabelDefaultLayout: Bool {
        labelPlacement == .inner &&
        required &&
        layout == .default
    }
    
    private var shouldShowIndicatorForNoneLabelDefaultLayout: Bool {
        labelPlacement == .none &&
        required &&
        layout == .default
    }

    private var shouldShowRequiredIndicatorAfterTitle: Bool {
        required &&
        requiredPlacement == .right
    }

    private var showOuterTitleIndicatorForDefaultLayout: Bool {
        labelPlacement == .outer &&
        required &&
        requiredPlacement == .left &&
        layout == .default
    }

    private var showNoneTitleIndicatorForClearLayout: Bool {
        labelPlacement == .none &&
        required &&
        requiredPlacement == .right &&
        layout == .clear
    }
    
    private var showInnerTitleIndicatorForClearLayout: Bool {
        labelPlacement == .inner &&
        required &&
        requiredPlacement == .left &&
        layout == .clear
    }
    
    private var showOuterTitleIndicatorForClearLayout: Bool {
        labelPlacement == .outer &&
        required &&
        requiredPlacement == .left &&
        layout == .clear
    }
    
    private var showInnerTitleRightIndicatorForClearLayout: Bool {
        labelPlacement == .inner &&
        required &&
        requiredPlacement == .right &&
        layout == .clear
    }
    
    private var showNoneTitleLeftIndicatorForClearLayout: Bool {
        labelPlacement == .none &&
        required &&
        layout == .clear &&
        requiredPlacement == .left
    }
    
    private var trailingContentPadding: CGFloat {
        iconActionViewProvider?.view != nil ? iconActionTrailingPadding : 0
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
    
    private var calculatedChipGroupHeight: CGFloat {
        return min(size.chipGroupHeight, chipGroupContentHeight)
    }

    private var formattedOptionalTitle: String {
        " \(optionalTitle)"
    }

    private var chipCornerRadius: CGFloat {
        switch value {
        case .single:
            return 0
        case .multiple(_, let chips):
            guard let chipSize = chips.first?.appearance.size else {
                return 0
            }
            switch chipSize.borderStyle {
            case .default(let radius):
                return radius
            case .pilled:
                return chipSize.height / 2
            }
        }
    }

    private let textAreaOuterTitleId = "textAreaOuterTitleId"
    private let textAreaInnerTitleId = "textAreaInnerTitleId"
    private let textAreaMultipleId = "textAreaMultipleId"

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
        layout == .clear ? 0 : size.fieldHorizontalPadding
    }

}
