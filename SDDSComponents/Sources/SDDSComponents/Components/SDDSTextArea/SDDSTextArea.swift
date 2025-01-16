import SwiftUI
import SDDSThemeCore
import SDDSComponents

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
    - labelPlacement: Размещение метки (`outer`, `inner`, `none`).
    - required: Флаг, указывающий, является ли поле обязательным.
    - divider: Флаг, указывающий, показывать ли линию разделителя.
    - requiredPlacement: Размещение обязательного индикатора (`left`, `right`).
    - dynamicHeight: Флаг, указывающий, расширяется ли текстовое поле по высоте в зависимости от высоты текста.
    - appearance: Параметры внешнего вида текстового поля.
    - chipGroupAppearance: Параметры внешнего вида ChipGroup.
    - chipGroupGap: Распределение элементов в ChipGroup.
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
    public let labelPlacement: TextAreaLabelPlacement
    public let required: Bool
    public let divider: Bool
    public let requiredPlacement: TextAreaRequiredPlacement
    public let dynamicHeight: Bool
    public let appearance: TextAreaAppearance
    public let chipGroupAppearance: ChipGroupAppearance
    public let chipGroupGap: ChipGroupGap
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
        labelPlacement: TextAreaLabelPlacement = .outer,
        required: Bool = false,
        divider: Bool = true,
        requiredPlacement: TextAreaRequiredPlacement = .left,
        dynamicHeight: Bool = false,
        appearance: TextAreaAppearance,
        chipGroupAppearance: ChipGroupAppearance,
        chipGroupGap: ChipGroupGap = .dense,
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
        self.required = required
        self.divider = divider
        self.requiredPlacement = requiredPlacement
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder
        self.dynamicHeight = dynamicHeight
        self.appearance = appearance
        self.chipGroupAppearance = chipGroupAppearance
        self.chipGroupGap = chipGroupGap
        self.layout = layout
        self.accessibility = accessibility
        self.iconActionViewProvider = iconActionViewProvider
        self.debugConfiguration = TextFieldDebugConfiguration()
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 0) {
            if showOuterTitleIndicator || showInnerTitleIndicatorForClearLayout {
                indicatorWithTrailingPadding
            }
            
            VStack(alignment: .leading, spacing: 0) {
                if labelPlacement == .outer {
                    titleLabel
                        .multilineTextAlignment(appearance.titleTextAlignment)
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
            
            if showInnerTitleRightIndicatorForClearLayout {
                indicatorWithLeadingPadding
            }
        }
        .opacity(disabled ? appearance.disabledAlpha : 1)
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
                indicatorWithLeadingPadding
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
            .debug(condition: debugConfiguration.title)
    }

    @ViewBuilder
    private var optionalTitleView: some View {
        Text(optionalTitle)
            .typography(titleTypography)
            .frame(height: titleTypography.lineHeight)
            .foregroundColor(appearance.optionalTitleColor.color(for: colorScheme))
            .multilineTextAlignment(appearance.titleTextAlignment)
            .debug(condition: debugConfiguration.title)
            .padding(.leading, appearance.size.optionalPadding)
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
            .padding(.trailing, size.indicatorOffset(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout).x)
            .padding(.top, size.indicatorOffset(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout).y)
    }
    
    @ViewBuilder
    private var indicatorWithLeadingPadding: some View {
        indicatorView
            .padding(.leading, size.indicatorOffset(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout).x)
            .padding(.top, size.indicatorOffset(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout).y)
    }

    @ViewBuilder
    private var contentView: some View {
        switch value {
        case .single:
            ZStack(alignment: .topTrailing) {
                if shouldShowInnerTitle {
                    textEditor(id: textAreaInnerTitleId)
                        .padding(.bottom, size.boxPaddingBottom(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout))
                    
                } else {
                    textEditor(id: textAreaOuterTitleId)
                        .padding(.top, size.boxPaddingTop(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout))
                        .padding(.bottom, size.boxPaddingBottom(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout))
                    
                    iconActionView
                        .opacity(0)
                        .padding(.top, size.boxPaddingTop(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout))
                        .padding(.trailing, boxTrailingPadding)
                }
            }
        case .multiple(_, let chips):
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    ScrollView {
                        SDDSChipGroup(
                            data: chips,
                            gap: chipGroupGap,
                            appearance: chipGroupAppearance,
                            height: $chipGroupContentHeight
                        )
                        .padding(.trailing, iconActionTrailingPadding)
                    }
                    .frame(height: calculatedChipGroupHeight)
                    .padding(.bottom, appearance.size.chipGroupVerticalBottomPadding)
                    .padding(.top, appearance.size.chipGroupVerticalTopPadding)
                    
                    iconActionView
                        .opacity(0)
                        .padding(.top, size.boxPaddingTop(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout))
                        .padding(.trailing, layout == .clear ? size.iconActionClearTrailingPadding : boxTrailingPadding)
                }
                
                textEditor(id: textAreaMultipleId)
                    .padding(.bottom, size.boxPaddingBottom(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout))
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
        hasher.combine(appearance.size.fieldHeight(layout: layout))
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
            Text(optionalTitle)
                .typography(textTypography)
                .foregroundColor(appearance.optionalTitleColor.color(for: colorScheme))
                .padding(.leading, appearance.size.optionalPadding)
        }
    }
    
    @ViewBuilder
    private var fieldView: some View {
        ZStack(alignment: .top) {
            if layout == .default {
                backgroundView
            }

            HStack {
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
                
                iconActionView
                    .padding(.trailing, boxTrailingPadding)
            }
            .frame(height: appearance.size.fieldHeight(layout: layout), debug: debugConfiguration.fieldHeight)
            .padding(.leading, boxLeadingPadding, debug: debugConfiguration.boxLeadingPadding)
            .padding(.trailing, fieldTrailingPadding, debug: debugConfiguration.boxTrailingPadding)
            
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        if shouldShowInnerTitle {
                            Spacer()
                                .frame(height: innerTitleTypography.lineHeight)
                                .padding([.top, .bottom], appearance.size.titleInnerPadding, debug: debugConfiguration.innerTitle)
                        }
                        
                        contentView
                        
                        if layout == .default {
                            Spacer()
                        }
                    }
                    
                    if layout == .default {
                        HStack(alignment: .bottom) {
                            captionLabel
                            Spacer()
                            counterLabel
                        }
                        .padding(.bottom, appearance.size.captionBottomPadding)
                        .padding(.trailing, captionTrailingPadding)
                    }
                }
                .frame(height: totalHeight)
                
                if layout == .clear {
                    bottomLineView
                }
            }
            .padding(.leading, boxLeadingPadding, debug: debugConfiguration.boxLeadingPadding)
            .padding(.trailing, fieldTrailingPadding, debug: debugConfiguration.boxTrailingPadding)
            
            if shouldShowEdgeIndicatorForDefaultLayout || shouldShowIndicatorForNoneLabelDefaultLayout {
                indicatorOverlayView
            }
        }
        .frame(height: totalHeight, debug: debugConfiguration.fieldHeight)
    }
    
    @ViewBuilder
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: appearance.size.cornerRadius)
            .strokeBorder(appearance.borderColor.color(for: colorScheme), lineWidth: appearance.size.borderWidth)
            .background(
                RoundedRectangle(cornerRadius: appearance.size.cornerRadius)
                    .fill(backgroundColor)
            )
            .frame(height: totalHeight, debug: debugConfiguration.fieldView)
    }
    
    private var totalHeight: CGFloat {
        var result = CGFloat(0)
        if shouldShowInnerTitle {
            result += totalInnerTitlePadding
            result += innerTitleTypography.lineHeight
        }
        if displayChips {
            result += appearance.size.chipGroupVerticalBottomPadding
            result += appearance.size.chipGroupVerticalTopPadding
        }
        if layout == .default {
            result += 2 * appearance.size.captionTopPadding
            result += 2 * appearance.size.captionBottomPadding
            result += max(captionTypography.lineHeight, counterTypography.lineHeight)
        }
        result += totalTextHeight
        return max(result, appearance.size.fieldHeight(layout: layout))
    }
    
    private var totalTextHeight: CGFloat {
        var result = CGFloat(0)
        result += textHeight
        
        if displayChips {
            result += calculatedChipGroupHeight
        } else {
            result += size.boxPaddingTop(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout)
        }
        if labelPlacement != .inner {
            result += size.boxPaddingBottom(labelPlacement: labelPlacement, requiredPlacement: requiredPlacement, layout: layout)
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
        .padding([.top, .bottom], appearance.size.titleInnerPadding, debug: debugConfiguration.innerTitle)
    }
    
    private var counterColor: Color {
        if readOnly {
            return appearance.counterColorReadOnly.color(for: colorScheme)
        }
        return appearance.counterColor.color(for: colorScheme)
    }
    
    private var backgroundColor: Color {
        if readOnly {
            return appearance.backgroundColorReadOnly.color(for: colorScheme)
        }
        if isFocused {
            return appearance.backgroundColorFocused.color(for: colorScheme)
        }
        return appearance.backgroundColor.color(for: colorScheme)
    }
    
    private var captionColor: Color {
        if readOnly {
            return appearance.captionColor.color(for: colorScheme)
        }
        if isFocused {
            return appearance.captionColorFocused.color(for: colorScheme)
        }
        return appearance.captionColor.color(for: colorScheme)
    }
    
    private var placeholderColor: Color {
        if readOnly {
            return appearance.placeholderColorReadOnly.color(for: colorScheme)
        }
        if isFocused {
            return appearance.placeholderColorFocused.color(for: colorScheme)
        }
        return appearance.placeholderColor.color(for: colorScheme)
    }
    
    private var textColor: Color {
        if readOnly {
            return appearance.textColorReadOnly.color(for: colorScheme)
        }
        if isFocused {
            return appearance.textColorFocused.color(for: colorScheme)
        }
        return appearance.textColor.color(for: colorScheme)
    }
    
    private var bottomLineColor: Color {
        if isFocused {
            return appearance.lineColorFocused.color(for: colorScheme)
        }
        return appearance.lineColor.color(for: colorScheme)
    }

    @ViewBuilder
    private var iconActionView: some View {
        if let rightView = iconActionViewProvider?.view {
            rightView
                .foregroundColor(appearance.endContentColor.color(for: colorScheme))
                .frame(width: iconActionViewWidth, height: iconActionViewHeight, debug: debugConfiguration.iconAction)
                .padding(.leading, appearance.size.iconActionPadding, debug: debugConfiguration.iconAction)
        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    private var captionLabel: some View {
        Text(caption)
            .typography(captionTypography)
            .multilineTextAlignment(.leading)
            .foregroundColor(captionColor)
            .debug(condition: debugConfiguration.caption)
            .frame(height: captionTypography.lineHeight)
            .padding(.top, size.captionTopPadding, debug: debugConfiguration.captionTopPadding)
            .applyIf(displayChips) { $0.padding(.leading, size.chipsPadding) }
    }
    
    @ViewBuilder
    private var counterLabel: some View {
        Text(counter)
            .typography(counterTypography)
            .multilineTextAlignment(.trailing)
            .foregroundColor(counterColor)
            .frame(height: counterTypography.lineHeight)
            .padding(.top, appearance.size.captionTopPadding, debug: debugConfiguration.captionTopPadding)
    }

    @ViewBuilder
    private var indicatorView: some View {
        Circle()
            .fill(appearance.requiredIndicatorColor.color(for: colorScheme))
            .frame(width: appearance.size.indicatorSize.width, height: appearance.size.indicatorSize.height, debug: debugConfiguration.indicatorView)
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
        if divider {
            Rectangle()
                .fill(bottomLineColor)
                .frame(height: appearance.size.lineWidth, debug: debugConfiguration.fieldView)
        } else {
            EmptyView()
        }
    }

    // MARK: - Computed Properties for Conditions
    
    private var iconActionViewWidth: CGFloat {
        min(appearance.size.iconActionSize.width, appearance.size.fieldHeight(layout: layout))
    }
    
    private var iconActionViewHeight: CGFloat {
        min(appearance.size.iconActionSize.height, appearance.size.fieldHeight(layout: layout))
    }
    
    private var captionTrailingPadding: CGFloat {
        boxTrailingPadding
    }
    
    private var fieldTrailingPadding: CGFloat {
        0
    }
    
    private var totalInnerTitlePadding: CGFloat {
        2 * appearance.size.titleInnerPadding
    }
    
    private var iconActionTrailingPadding: CGFloat {
        if let _ = iconActionViewProvider?.view {
            return iconActionViewWidth + appearance.size.iconActionPadding
        } else {
            return 0
        }
    }

    private var shouldShowInnerTitle: Bool {
        labelPlacement == .inner &&
        !displayChips &&
        appearance.innerTitleTypography.typography(with: appearance.size) != nil &&
        (!text.isEmpty || isFocused)
    }

    private var shouldShowEdgeIndicatorForDefaultLayout: Bool {
        (labelPlacement == .inner || labelPlacement == .none) &&
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

    private var showOuterTitleIndicator: Bool {
        labelPlacement == .outer &&
        required &&
        requiredPlacement == .left
    }

    private var showNoneTitleIndicatorForClearLayout: Bool {
        labelPlacement == .none &&
        required &&
        requiredPlacement == .right &&
        layout == .clear
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
        return min(appearance.size.chipGroupHeight, chipGroupContentHeight)
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

    private let textAreaOuterTitleId = "textAreaOuterTitleId"
    private let textAreaInnerTitleId = "textAreaInnerTitleId"
    private let textAreaMultipleId = "textAreaMultipleId"

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
    
    private var counterTypography: TypographyToken {
        guard let typography = appearance.counterTypography.typography(with: appearance.size) else {
            fatalError("Undefined Counter Typography for appearance.size \(appearance.size).")
        }
        return typography
    }

    private var textTypography: TypographyToken {
        guard let typography = appearance.textTypography.typography(with: appearance.size) else {
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
