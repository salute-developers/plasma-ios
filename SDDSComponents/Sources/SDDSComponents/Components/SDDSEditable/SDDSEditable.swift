import SwiftUI
@_exported import SDDSThemeCore

public struct SDDSEditable<IconContent: View>: View {
    @Binding private var text: String
    
    private let enabled: Bool
    private let readOnly: Bool
    private let singleLine: Bool
    private let textAlign: TextAlignment
    private let iconPlacement: EditableIconPlacement
    private let _appearance: EditableAppearance?
    private let iconContent: Action<IconContent>
    
    @Environment(\.editableAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    
    @State private var isFocused: Bool = false
    @State private var textHeight: CGFloat = 0
    @State private var availableWidth: CGFloat = 0
    @FocusState private var isMultilineTextEditorFocused: Bool
    
    public init(
        text: Binding<String>,
        enabled: Bool = true,
        readOnly: Bool = false,
        singleLine: Bool = false,
        textAlign: TextAlignment = .leading,
        iconPlacement: EditableIconPlacement = .absolute,
        appearance: EditableAppearance? = nil,
        iconContent: Action<IconContent> = Action { EmptyView() }
    ) {
        self._text = text
        self.enabled = enabled
        self.readOnly = readOnly
        self.singleLine = singleLine
        self.textAlign = textAlign
        self.iconPlacement = iconPlacement
        self._appearance = appearance
        self.iconContent = iconContent
    }
    
    public var body: some View {
        Group {
            switch iconPlacement {
            case .relative:
                HStack(spacing: 0) {
                    field
                    iconWithMargin
                }
                .offset(x: -multilineRelativeHorizontalOffset)
            case .absolute:
                field
                    .overlay(alignment: .trailing) {
                        iconWithMargin
                            .offset(x: iconContainerWidth)
                    }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            GeometryReader { proxy in
                Color.clear
                    .onAppear {
                        availableWidth = max(availableWidth, proxy.size.width)
                    }
                    .onChange(of: proxy.size.width) { width in
                        availableWidth = max(availableWidth, width)
                    }
            }
        )
        .frame(width: editableContainerWidth, alignment: .leading)
        .fixedSize(horizontal: true, vertical: false)
        .opacity(contentOpacity)
        .disabled(!enabled)
        .onAppear {
            ensureReadonlyUnfocused()
        }
        .onChange(of: readOnly) { _ in
            ensureReadonlyUnfocused()
        }
    }
    
    private var field: some View {
        Group {
            if singleLine {
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            PlaceholderTextField(
                                text: $text,
                                isFocused: $isFocused,
                                textColor: textColor.color(for: colorScheme, subtheme: subtheme).opacity(readonlyContentOpacity),
                                textAlignment: textAlign,
                                cursorColor: appearance.cursorColor.color(for: colorScheme, subtheme: subtheme),
                                textTypography: typography,
                                readOnly: readOnly,
                                mask: nil,
                                maskDisplayMode: .onInput,
                                secureEntry: false,
                                keyboardType: .default,
                                placeholderBeforeContent: { EmptyView() },
                                placeholderContent: { EmptyView() },
                                placeholderAfterContent: { EmptyView() },
                                onEditingChanged: { focused in
                                    isFocused = focused
                                },
                                onMaskComplete: nil,
                                textFieldConfiguration: { textField in
                                    textField
                                        .frame(width: visibleFieldWidth)
                                        .frame(height: resolvedLineHeight)
                                        .id(singleLineTextFieldIdentifier)
                                }
                            )
                        }
                    }
                    .onChange(of: text) { _ in
                        scrollToSingleLineTextEnd(with: proxy)
                    }
                    .onChange(of: isFocused) { focused in
                        guard focused else {
                            return
                        }
                        scrollToSingleLineTextEnd(with: proxy)
                    }
                }
            } else {
                TextEditor(text: $text)
                    .focused($isMultilineTextEditorFocused)
                    .font(Font(typography.uiFont))
                    .multilineTextAlignment(textAlign)
                    .foregroundColor(textColor.color(for: colorScheme, subtheme: subtheme).opacity(readonlyContentOpacity))
                    .hideTextEditorScrollBackgroundIfAvailable()
                    .background(Color.clear)
                    .tint(appearance.cursorColor.color(for: colorScheme, subtheme: subtheme))
                    .disabled(readOnly)
                    .frame(width: visibleFieldWidth)
                    .frame(height: max(textHeight, resolvedLineHeight))
                    .transaction { transaction in
                        transaction.animation = nil
                    }
                    .onAppear {
                        updateMultilineTextHeight()
                    }
                    .onChange(of: text) { _ in
                        updateMultilineTextHeight()
                    }
                    .onChange(of: visibleFieldWidth) { _ in
                        updateMultilineTextHeight()
                    }
                    .onChange(of: isFocused) { focused in
                        guard !readOnly else {
                            isMultilineTextEditorFocused = false
                            return
                        }
                        guard focused != isMultilineTextEditorFocused else {
                            return
                        }
                        isMultilineTextEditorFocused = focused
                    }
                    .onChange(of: isMultilineTextEditorFocused) { focused in
                        guard focused != isFocused else {
                            return
                        }
                        isFocused = focused
                    }
            }
        }
    }
    
    @ViewBuilder
    private var iconBase: some View {
        if shouldShowIcon {
            if shouldHandleIconTap {
                Button {
                    isFocused = true
                    if !singleLine {
                        isMultilineTextEditorFocused = true
                    }
                } label: {
                    iconContent
                        .foregroundColor(iconColor.color(for: colorScheme, subtheme: subtheme).opacity(readonlyContentOpacity))
                        .frame(width: iconWidth, height: iconWidth)
                }
                .buttonStyle(.plain)
            } else {
                iconContent
                    .foregroundColor(iconColor.color(for: colorScheme, subtheme: subtheme).opacity(readonlyContentOpacity))
                    .frame(width: iconWidth, height: iconWidth)
                    .allowsHitTesting(false)
            }
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var iconWithMargin: some View {
        if shouldShowIcon {
            iconBase
                .padding(.leading, effectiveIconMargin)
        } else if shouldReserveRelativeIconSpace {
            Color.clear
                .frame(width: iconWidth, height: iconWidth)
                .padding(.leading, effectiveIconMargin)
        } else {
            EmptyView()
        }
    }
    
    private var typography: TypographyToken {
        appearance.textTypography.typography(with: appearance.size) ?? .undefined
    }
    
    private var textWidth: CGFloat {
        let size = (text as NSString).size(withAttributes: [.font: typography.uiFont])
        return ceil(size.width)
    }
    
    private var iconWidth: CGFloat {
        appearance.size.iconSize
    }
    
    private var contentFieldWidth: CGFloat {
        max(defaultMinWidth, textWidth + defaultCursorWidth + textHorizontalInsetsCompensation)
    }

    private var visibleFieldWidth: CGFloat {
        min(contentFieldWidth, availableFieldWidth)
    }

    private var availableFieldWidth: CGFloat {
        let reservedWidthForIcon = iconPlacement == .relative ? iconContainerWidth : 0
        // Fallback to screen width to avoid self-measurement lock.
        let measuredWidth = max(availableWidth, UIScreen.main.bounds.width)
        return max(defaultMinWidth, measuredWidth - reservedWidthForIcon)
    }

    private var editableContainerWidth: CGFloat {
        let iconWidth = iconPlacement == .relative ? iconContainerWidth : 0
        return visibleFieldWidth + iconWidth
    }
    
    private var iconContainerWidth: CGFloat {
        if iconPlacement == .relative {
            return shouldReserveRelativeIconSpace ? (iconWidth + effectiveIconMargin) : 0
        }
        return shouldShowIcon ? (iconWidth + effectiveIconMargin) : 0
    }
    
    private var defaultMinWidth: CGFloat {
        10
    }

    private var defaultCursorWidth: CGFloat {
        4
    }

    private var contentOpacity: CGFloat {
        enabled ? 1 : appearance.disabledAlpha
    }

    private var readonlyContentOpacity: CGFloat {
        readOnly ? appearance.disabledAlpha : 1
    }

    private var shouldHandleIconTap: Bool {
        enabled && !readOnly
    }

    private var shouldShowIcon: Bool {
        hasIconContent && enabled
    }

    private var shouldReserveRelativeIconSpace: Bool {
        iconPlacement == .relative && hasIconContent
    }

    private var hasIconContent: Bool {
        iconWidth > 0 && IconContent.self != EmptyView.self
    }
    
    private var textColor: ColorToken {
        readOnly ? appearance.textColorReadonly : appearance.textColorDefault
    }
    
    private var iconColor: ColorToken {
        readOnly ? appearance.iconColorReadonly : appearance.iconColorDefault
    }

    private var singleLineTextFieldIdentifier: String {
        "editable-single-line-field"
    }

    private func updateMultilineTextHeight() {
        let targetWidth = max(visibleFieldWidth - multilineTextHorizontalInsets, defaultMinWidth)
        guard targetWidth > 0 else {
            return
        }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = textAlign.nsTextAlignment

        let attributes: [NSAttributedString.Key: Any] = [
            .font: typography.uiFont,
            .paragraphStyle: paragraphStyle
        ]

        let measuredRect = (text.isEmpty ? " " : text as NSString).boundingRect(
            with: CGSize(width: targetWidth, height: .greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: attributes,
            context: nil
        )
        let measuredTextHeight = ceil(measuredRect.height)
        let newHeight = max(resolvedLineHeight, measuredTextHeight + multilineTextVerticalInsets)
        if abs(textHeight - newHeight) > 0.5 {
            textHeight = newHeight
        }
    }

    private func scrollToSingleLineTextEnd(with proxy: ScrollViewProxy) {
        DispatchQueue.main.async {
            proxy.scrollTo(singleLineTextFieldIdentifier, anchor: .trailing)
        }
    }

    private func ensureReadonlyUnfocused() {
        guard readOnly else {
            return
        }
        isFocused = false
        isMultilineTextEditorFocused = false
    }

    private var multilineTextHorizontalInsets: CGFloat {
        textViewDefaultLineFragmentPadding * 2
    }

    private var textHorizontalInsetsCompensation: CGFloat {
        singleLine ? 0 : multilineTextHorizontalInsets
    }

    private var effectiveIconMargin: CGFloat {
        guard !singleLine else {
            return appearance.size.iconMargin
        }
        return max(0, appearance.size.iconMargin - textViewDefaultLineFragmentPadding)
    }

    private var multilineRelativeHorizontalOffset: CGFloat {
        guard !singleLine, iconPlacement == .relative else {
            return 0
        }
        return max(0, textViewDefaultLineFragmentPadding - defaultCursorWidth) + 1.5
    }


    private var multilineTextVerticalInsets: CGFloat {
        textViewDefaultTextContainerInset.top + textViewDefaultTextContainerInset.bottom
    }

    private var textViewDefaultLineFragmentPadding: CGFloat {
        let textView = UITextView(frame: .zero)
        return textView.textContainer.lineFragmentPadding
    }

    private var textViewDefaultTextContainerInset: UIEdgeInsets {
        UITextView(frame: .zero).textContainerInset
    }

    private var resolvedLineHeight: CGFloat {
        max(typography.lineHeight, ceil(typography.uiFont.lineHeight))
    }
    
    private var appearance: EditableAppearance {
        _appearance ?? environmentAppearance
    }
}

private extension TextAlignment {
    var nsTextAlignment: NSTextAlignment {
        switch self {
        case .center:
            return .center
        case .leading:
            return .left
        case .trailing:
            return .right
        }
    }
}

private extension View {
    @ViewBuilder
    func hideTextEditorScrollBackgroundIfAvailable() -> some View {
        if #available(iOS 16.0, *) {
            self.scrollContentBackground(.hidden)
        } else {
            self
        }
    }
}

public extension SDDSEditable where IconContent == EmptyView {
    init(
        text: Binding<String>,
        enabled: Bool = true,
        readOnly: Bool = false,
        singleLine: Bool = false,
        textAlign: TextAlignment = .leading,
        iconPlacement: EditableIconPlacement = .absolute,
        appearance: EditableAppearance? = nil
    ) {
        self.init(
            text: text,
            enabled: enabled,
            readOnly: readOnly,
            singleLine: singleLine,
            textAlign: textAlign,
            iconPlacement: iconPlacement,
            appearance: appearance,
            iconContent: Action { EmptyView() }
        )
    }
}
