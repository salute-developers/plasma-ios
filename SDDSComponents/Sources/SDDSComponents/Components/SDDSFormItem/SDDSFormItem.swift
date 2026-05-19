import SwiftUI
import SDDSThemeCore

public struct SDDSFormItem<Content: View>: View {
    @Environment(\.formItemAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme

    private let _appearance: FormItemAppearance?
    private let hintBuilder: (() -> AnyView)?
    private let titleBuilder: (() -> AnyView)?
    private let optionalBuilder: (() -> AnyView)?
    private let titleCaptionBuilder: (() -> AnyView)?
    private let captionBuilder: (() -> AnyView)?
    private let counterBuilder: (() -> AnyView)?
    private let enabled: Bool
    private let hasBuiltInHint: Bool
    private let onHintPressed: (() -> Void)?
    private let content: () -> Content

    public init<Hint: View, Title: View, OptionalContent: View, TitleCaption: View, Caption: View, Counter: View>(
        appearance: FormItemAppearance? = nil,
        hint: (() -> Hint)? = nil,
        title: (() -> Title)? = nil,
        optional: (() -> OptionalContent)? = nil,
        titleCaption: (() -> TitleCaption)? = nil,
        caption: (() -> Caption)? = nil,
        counter: (() -> Counter)? = nil,
        enabled: Bool = true,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._appearance = appearance
        self.hintBuilder = hint.map { hint in { AnyView(hint()) } }
        self.titleBuilder = title.map { title in { AnyView(title()) } }
        self.optionalBuilder = optional.map { optional in { AnyView(optional()) } }
        self.titleCaptionBuilder = titleCaption.map { titleCaption in { AnyView(titleCaption()) } }
        self.captionBuilder = caption.map { caption in { AnyView(caption()) } }
        self.counterBuilder = counter.map { counter in { AnyView(counter()) } }
        self.enabled = enabled
        self.hasBuiltInHint = false
        self.onHintPressed = nil
        self.content = content
    }

    public init<Title: View, OptionalContent: View, TitleCaption: View, Caption: View, Counter: View>(
        appearance: FormItemAppearance? = nil,
        title: (() -> Title)? = nil,
        optional: (() -> OptionalContent)? = nil,
        titleCaption: (() -> TitleCaption)? = nil,
        caption: (() -> Caption)? = nil,
        counter: (() -> Counter)? = nil,
        hasHint: Bool = false,
        onHintPressed: (() -> Void)? = nil,
        enabled: Bool = true,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._appearance = appearance
        self.hintBuilder = nil
        self.titleBuilder = title.map { title in { AnyView(title()) } }
        self.optionalBuilder = optional.map { optional in { AnyView(optional()) } }
        self.titleCaptionBuilder = titleCaption.map { titleCaption in { AnyView(titleCaption()) } }
        self.captionBuilder = caption.map { caption in { AnyView(caption()) } }
        self.counterBuilder = counter.map { counter in { AnyView(counter()) } }
        self.enabled = enabled
        self.hasBuiltInHint = hasHint
        self.onHintPressed = onHintPressed
        self.content = content
    }

    public var body: some View {
        FormItemLayout(
            topTextAlignment: appearance.topTextAlignment,
            bottomTextAlignment: appearance.bottomTextAlignment,
            startTitle: startTitle,
            endTitle: endTitle,
            topTitle: topTitle,
            titleCaption: titleCaptionView,
            caption: captionView,
            counter: counterView,
            content: AnyView(contentView)
        )
    }
}

private extension SDDSFormItem {
    var appearance: FormItemAppearance {
        _appearance ?? environmentAppearance
    }

    var activeStates: Set<InteractiveState> {
        enabled ? [] : [.readonly]
    }

    var topTitle: AnyView? {
        guard appearance.titlePlacement == .top, titleBuilder != nil || resolvedHint != nil else { return nil }
        return AnyView(
            titleHintOptional
                .padding(.bottom, appearance.size.titleBlockPadding)
        )
    }

    var startTitle: AnyView? {
        guard appearance.titlePlacement == .start, titleBuilder != nil || resolvedHint != nil else { return nil }
        return AnyView(
            titleHintOptional
                .padding(.trailing, appearance.size.titleBlockPadding)
        )
    }

    var endTitle: AnyView? {
        guard appearance.titlePlacement == .none, resolvedHint != nil else { return nil }
        return AnyView(
            endHintOnly
                .padding(.leading, appearance.size.titleBlockPadding)
                .padding(.top, endHintTopPadding)
        )
    }

    var resolvedHint: AnyView? {
        if hasBuiltInHint, let icon = appearance.hintIcon {
            return AnyView(
                Button(action: { onHintPressed?() }) {
                    icon
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: appearance.size.hintWidth, height: appearance.size.hintHeight)
                }
                .buttonStyle(.plain)
                .foregroundColor(appearance.hintColor.color(for: activeStates, colorScheme: colorScheme, subtheme: subtheme))
            )
        }
        if let hintBuilder {
            return AnyView(
                hintBuilder()
                    .frame(width: appearance.size.hintWidth, height: appearance.size.hintHeight)
                    .foregroundColor(appearance.hintColor.color(for: activeStates, colorScheme: colorScheme, subtheme: subtheme))
            )
        }
        return nil
    }

    var titleHintOptional: some View {
        let width = appearance.size.titleBlockWidth
        let baseRow = HStack(alignment: .center, spacing: appearance.size.titleBlockSpacing) {
            if let titleBuilder {
                titleBuilder()
                    .typography(typography(appearance.titleTypography))
                    .foregroundColor(appearance.titleColor.color(for: activeStates, colorScheme: colorScheme, subtheme: subtheme))
                    .opacity(enabled ? 1 : appearance.disableAlpha)
            }
            if let resolvedHint {
                resolvedHint
            }
            if appearance.formType == .optional, let optionalBuilder {
                optionalBuilder()
                    .typography(typography(appearance.optionalTypography))
                    .foregroundColor(appearance.optionalColor.color(for: activeStates, colorScheme: colorScheme, subtheme: subtheme))
                    .opacity(enabled ? 1 : appearance.disableAlpha)
            }
        }

        let rowWithIndicator: AnyView
        if shouldShowTitleIndicator {
            rowWithIndicator = AnyView(
                baseRow.modifier(
                    FormItemIndicatorOverlay(
                        appearance: appearance,
                        enabled: enabled,
                        horizontalMode: appearance.indicatorAlignmentMode
                    )
                )
            )
        } else {
            rowWithIndicator = AnyView(baseRow)
        }

        if width > 0 {
            return AnyView(rowWithIndicator.frame(width: width, alignment: .leading))
        }
        return rowWithIndicator
    }

    var endHintOnly: some View {
        Group {
            if let resolvedHint {
                resolvedHint
            }
        }
    }

    var endHintTopPadding: CGFloat {
        guard appearance.titlePlacement == .none else { return 0 }
        guard titleCaptionBuilder != nil else { return 0 }
        let titleCaptionLineHeight = typography(appearance.titleCaptionTypography).lineHeight
        return titleCaptionLineHeight + appearance.size.titleCaptionPadding
    }

    var shouldShowTitleIndicator: Bool {
        appearance.titlePlacement != .none && appearance.formType == .required
    }

    var titleCaptionView: AnyView? {
        guard let titleCaptionBuilder else { return nil }
        return AnyView(
            titleCaptionBuilder()
                .typography(typography(appearance.titleCaptionTypography))
                .foregroundColor(appearance.titleCaptionColor.color(for: activeStates, colorScheme: colorScheme, subtheme: subtheme))
                .opacity(enabled ? 1 : appearance.disableAlpha)
                .padding(.bottom, appearance.size.titleCaptionPadding)
        )
    }

    var captionView: AnyView? {
        guard let captionBuilder else { return nil }
        return AnyView(
            captionBuilder()
                .typography(typography(appearance.captionTypography))
                .foregroundColor(appearance.captionColor.color(for: activeStates, colorScheme: colorScheme, subtheme: subtheme))
                .opacity(enabled ? 1 : appearance.disableAlpha)
                .padding(.top, appearance.size.captionPadding)
        )
    }

    var counterView: AnyView? {
        guard let counterBuilder else { return nil }
        return AnyView(
            counterBuilder()
                .typography(typography(appearance.counterTypography))
                .foregroundColor(appearance.counterColor.color(for: activeStates, colorScheme: colorScheme, subtheme: subtheme))
                .opacity(enabled ? 1 : appearance.disableAlpha)
                .padding(.top, appearance.size.counterPadding)
        )
    }

    @ViewBuilder
    var contentView: some View {
        if shouldShowContentIndicator {
            content()
                .opacity(enabled ? 1 : appearance.disableAlpha)
                .modifier(
                    FormItemIndicatorOverlay(
                        appearance: appearance,
                        enabled: enabled,
                        horizontalMode: appearance.indicatorAlignmentMode
                    )
                )
        } else {
            content()
                .opacity(enabled ? 1 : appearance.disableAlpha)
        }
    }

    var shouldShowContentIndicator: Bool {
        appearance.formType == .required && appearance.titlePlacement == .none
    }

    func typography(_ configuration: TypographyConfiguration) -> TypographyToken {
        if let value = configuration.typography(with: appearance.size) {
            return value
        }
        fatalError("Undefined FormItem typography for size \(appearance.size.debugDescription)")
    }
}
