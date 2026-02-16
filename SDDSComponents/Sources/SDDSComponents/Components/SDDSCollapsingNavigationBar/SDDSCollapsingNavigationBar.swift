import Foundation
import SwiftUI
import UIKit
@_exported import SDDSThemeCore

// MARK: - Height Preference Keys

private struct CollapsedBarHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

private struct ExpandedBarHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

private struct SafeAreaTopKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

private struct CollapsedTitleContentHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

private struct CollapsedDescriptionContentHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

private struct ReportHeightModifier: ViewModifier {
    @Binding var height: CGFloat
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { g in
                Color.clear
                    .id(g.size.height)
                    .onAppear {
                        if g.size.height > 0 { height = g.size.height }
                    }
            }
        )
    }
}

private extension View {
    func reportHeight(to height: Binding<CGFloat>) -> some View {
        modifier(ReportHeightModifier(height: height))
    }
}

// MARK: - CenterAlignmentStrategy

public enum CollapsingNavigationBarCenterAlignmentStrategy {
    case relative
    case absolute
}

// MARK: - SDDSCollapsingNavigationBar

public struct SDDSCollapsingNavigationBar<
    ExpandedTitle: View,
    ExpandedDescription: View,
    CollapsedTitle: View,
    CollapsedDescription: View,
    ActionStart: View,
    ActionEnd: View,
    Content: View
>: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @Environment(\.subthemeBackgroundColor) private var subthemeBackgroundColor
    @ObservedObject private var state: CollapsingNavigationBarState

    private let appearance: CollapsingNavigationBarAppearance
    private let expandedTitle: () -> ExpandedTitle
    private let expandedDescription: () -> ExpandedDescription
    private let collapsedTitle: () -> CollapsedTitle
    private let collapsedDescription: () -> CollapsedDescription
    private let expandedTextAlign: NavigationBarTextAlign
    private let collapsedTextAlign: NavigationBarTextAlign
    private let centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy
    private let actionStart: () -> ActionStart
    private let actionEnd: () -> ActionEnd
    private let backgroundContent: (() -> AnyView)?
    private let middleContent: (() -> AnyView)?
    private let scrollBehavior: CollapsingNavigationBarScrollBehavior
    private let onBackPressed: () -> Void
    private let content: () -> Content

    @State private var scrollContentOffset: CGPoint = .zero
    @State private var previousScrollOffsetY: CGFloat = 0
    @State private var collapsedHeight: CGFloat = 0
    @State private var expandedHeight: CGFloat = 0
    @State private var contentBlockHeight: CGFloat = 0
    @State private var safeAreaTop: CGFloat = 0
    @State private var collapsedTitleContentHeight: CGFloat = -1
    @State private var collapsedDescriptionContentHeight: CGFloat = -1
    @State private var leadingBlockWidth: CGFloat = 0
    @State private var trailingBlockWidth: CGFloat = 0
    @State private var barWidth: CGFloat = 0
    @State private var centerContentFullWidth: CGFloat = 0
    @State private var expandedContentHeight: CGFloat = 0

    public init(
        appearance: CollapsingNavigationBarAppearance,
        expandedTitle: @escaping () -> ExpandedTitle,
        expandedDescription: @escaping () -> ExpandedDescription,
        collapsedTitle: @escaping () -> CollapsedTitle,
        collapsedDescription: @escaping () -> CollapsedDescription,
        expandedTextAlign: NavigationBarTextAlign = .left,
        collapsedTextAlign: NavigationBarTextAlign = .center,
        centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy = .relative,
        actionStart: @escaping () -> ActionStart,
        actionEnd: @escaping () -> ActionEnd,
        backgroundContent: (() -> AnyView)? = nil,
        middleContent: (() -> AnyView)? = nil,
        state: CollapsingNavigationBarState,
        scrollBehavior: CollapsingNavigationBarScrollBehavior,
        onBackPressed: @escaping () -> Void = {},
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.appearance = appearance
        self.expandedTitle = expandedTitle
        self.expandedDescription = expandedDescription
        self.collapsedTitle = collapsedTitle
        self.collapsedDescription = collapsedDescription
        self.expandedTextAlign = expandedTextAlign
        self.collapsedTextAlign = collapsedTextAlign
        self.centerAlignmentStrategy = centerAlignmentStrategy
        self.actionStart = actionStart
        self.actionEnd = actionEnd
        self.backgroundContent = backgroundContent
        self.middleContent = middleContent
        self.state = state
        self.scrollBehavior = scrollBehavior
        self.onBackPressed = onBackPressed
        self.content = content
    }

    @ViewBuilder
    public var body: some View {
        ZStack(alignment: .top) {
            scrollContentView(
                contentHeightBinding: $contentBlockHeight,
                hideContentBlock: expandedHeight > 0 && normalizedScrollY >= expandedHeight
            )
            if expandedHeight > 0, normalizedScrollY > expandedHeight {
                effectiveBackgroundColor
                    .frame(height: effectiveBarHeight)
                    .frame(maxWidth: .infinity)
            }
            edgeStackView
                .reportHeight(to: $collapsedHeight)
            if expandedHeight > 0, normalizedScrollY >= expandedHeight, let middle = middleContent, contentBlockHeight > 0 {
                middle()
                    .frame(height: contentBlockHeight)
                    .frame(maxWidth: .infinity)
                    .padding(.top, effectiveBarHeight)
            }
        }
        .background(effectiveBackgroundColor)
        .padding(.top, safeAreaTop)
        .background(GeometryReader { g in Color.clear.preference(key: SafeAreaTopKey.self, value: g.safeAreaInsets.top) })
        .onPreferenceChange(SafeAreaTopKey.self) { value in
            DispatchQueue.main.async { safeAreaTop = value }
        }
        .onPreferenceChange(CollapsedBarHeightKey.self) { newHeight in
            if newHeight > 0 { DispatchQueue.main.async { collapsedHeight = newHeight } }
        }
        .onChange(of: scrollContentOffset.y) { _ in
            applyScrollFromOffset(clampedY: normalizedScrollY)
        }
        .onAppear { previousScrollOffsetY = normalizedScrollY }
    }

    // MARK: - Edge Stack

    private let edgeStackBackgroundOpacity: Double = 0.82

    private let edgeStackHeightFallback: CGFloat = 56

    private var effectiveBarHeight: CGFloat {
        collapsedHeight > 0 ? collapsedHeight : edgeStackHeightFallback
    }

    private var normalizedScrollY: CGFloat {
        max(0, scrollContentOffset.y + effectiveBarHeight)
    }

    private var edgeStackView: some View {
        collapsedRow
            .shape(pathDrawer: appearance.size.bottomShape)
            .overlay(alignment: .top) {
                topCornerMask(cornerRadius: cornerRadius(from: appearance.size.bottomShape), backgroundColor: barBackgroundColor.opacity(edgeStackBackgroundOpacity))
            }
            .shadow(appearance.shadow)
            .background(
                GeometryReader { g in
                    Color.clear.preference(key: CollapsedBarHeightKey.self, value: g.size.height)
                }
            )
    }

    // MARK: - Collapsed Row

    private var collapsedLeadingBlock: some View {
        HStack(spacing: 0) {
            if let backIcon = appearance.backIcon {
                Button(action: onBackPressed) {
                    backIcon
                        .renderingMode(.template)
                        .foregroundColor(currentColor(for: appearance.backIconColor))
                        .frame(width: 24, height: 24)
                }
                .buttonStyle(.plain)
                .padding(.trailing, appearance.size.backIconMargin)
            }
            actionStart()
        }
        .fixedSize(horizontal: true, vertical: false)
        .padding(.leading, appearance.size.paddingStart)
        .readSize { size in
            print("[CollapsingBar] readSize leadingBlock: \(size)")
            DispatchQueue.main.async { leadingBlockWidth = size.width }
        }
    }

    private var collapsedTrailingBlock: some View {
        HStack(spacing: 0) { actionEnd() }
            .fixedSize(horizontal: true, vertical: false)
            .padding(.trailing, appearance.size.paddingEnd)
            .readSize { size in
                print("[CollapsingBar] readSize trailingBlock: \(size)")
                DispatchQueue.main.async { trailingBlockWidth = size.width }
            }
    }

    private var availableWidthForCenter: CGFloat {
        let value = max(0, barWidth - leadingBlockWidth - trailingBlockWidth)
        print("[CollapsingBar] availableWidthForCenter: \(value) (barWidth: \(barWidth), leading: \(leadingBlockWidth), trailing: \(trailingBlockWidth))")
        return value
    }

    private var absoluteCenteredMaxWidth: CGFloat {
        let side = max(leadingBlockWidth, trailingBlockWidth)
        let value = max(0, barWidth - 2 * side)
        print("[CollapsingBar] absoluteCenteredMaxWidth: \(value) (barWidth: \(barWidth), maxSide: \(side))")
        return value
    }

    private var cappedCenterContentWidth: CGFloat {
        let centeredMax = absoluteCenteredMaxWidth
        let value = min(centerContentFullWidth, centeredMax)
        print("[CollapsingBar] cappedCenterContentWidth: \(value) (centerContentFullWidth: \(centerContentFullWidth), centeredMax: \(centeredMax))")
        return value
    }

    private var effectiveUseAbsolute: Bool {
        let value = centerAlignmentStrategy == .absolute && collapsedTextAlign == .center
        print("[CollapsingBar] effectiveUseAbsolute: \(value) (strategy: \(centerAlignmentStrategy), collapsedTextAlign: \(collapsedTextAlign))")
        return value
    }

    private var centerLeadingPadding: CGFloat {
        let h = appearance.size.horizontalSpacing
        if effectiveUseAbsolute {
            let centerContentIdealWidth = centerContentFullWidth - 2 * h
            return max(0, barWidth / 2 - leadingBlockWidth - centerContentIdealWidth / 2)
        } else {
            return h
        }
    }

    private var centerTrailingPadding: CGFloat {
        let h = appearance.size.horizontalSpacing
        if effectiveUseAbsolute {
            let centerContentIdealWidth = centerContentFullWidth - 2 * h
            return max(0, barWidth / 2 - trailingBlockWidth - centerContentIdealWidth / 2)
        } else {
            return h
        }
    }

    private var centerBlockAbsoluteLeadingSpacerWidth: CGFloat {
        let center = cappedCenterContentWidth
        let value = max(0, barWidth / 2 - leadingBlockWidth - center / 2)
        print("[CollapsingBar] centerBlockAbsoluteLeadingSpacerWidth: \(value)")
        return value
    }

    private var centerBlockAbsoluteTrailingSpacerWidth: CGFloat {
        let center = cappedCenterContentWidth
        let value = max(0, barWidth / 2 - trailingBlockWidth - center / 2)
        print("[CollapsingBar] centerBlockAbsoluteTrailingSpacerWidth: \(value)")
        return value
    }

    @ViewBuilder
    private var collapsedRow: some View {
        Group {
            if effectiveUseAbsolute {
                HStack(alignment: .center, spacing: 0) {
                    collapsedLeadingBlock
                    Color.clear.frame(width: centerBlockAbsoluteLeadingSpacerWidth)
                    collapsedCenterBlock
                    Color.clear.frame(width: centerBlockAbsoluteTrailingSpacerWidth)
                    collapsedTrailingBlock
                }
            } else {
                HStack(alignment: .center, spacing: 0) {
                    collapsedLeadingBlock
                    collapsedCenterBlock
                    collapsedTrailingBlock
                }
            }
        }
        .padding(.top, appearance.size.paddingTop)
        .padding(.bottom, appearance.size.paddingBottom)
        .fixedSize(horizontal: false, vertical: true)
        .background(
            GeometryReader { g in
                Color.clear.preference(key: CollapsedBarHeightKey.self, value: g.size.height)
            }
        )
        .readSize { size in
            print("[CollapsingBar] readSize collapsedRow (barWidth): \(size)")
            DispatchQueue.main.async { barWidth = size.width }
        }
    }

    @ViewBuilder
    private var collapsedCenterBlock: some View {
        Group {
            if effectiveUseAbsolute {
                collapsedCenterContent(useAbsoluteCentering: true)
                    .padding(.leading, appearance.size.horizontalSpacing)
                    .padding(.trailing, appearance.size.horizontalSpacing)
                    .frame(width: cappedCenterContentWidth)
            } else {
                collapsedCenterContent(useAbsoluteCentering: false)
                    .padding(.leading, centerLeadingPadding)
                    .padding(.trailing, centerTrailingPadding)
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
        .overlay(alignment: .center) {
            collapsedCenterContentForMeasurement
        }
    }

    private var collapsedCenterContentForMeasurement: some View {
        collapsedCenterContent(useAbsoluteCentering: false)
            .padding(.leading, appearance.size.horizontalSpacing)
            .padding(.trailing, appearance.size.horizontalSpacing)
            .fixedSize(horizontal: true, vertical: false)
            .readSize { size in
                let maxWidth = UIScreen.main.bounds.width
                let stored = min(size.width, maxWidth)
                print("[CollapsingBar] readSize centerContent: raw=\(size), maxWidth=\(maxWidth), stored=\(stored)")
                DispatchQueue.main.async { centerContentFullWidth = stored }
            }
            .opacity(0)
            .allowsHitTesting(false)
    }

    private var collapsedTitleLineHeight: CGFloat {
        appearance.titleTypographyCollapsed.typography(with: appearance.size as Any)?.lineHeight
            ?? appearance.descriptionTypographyCollapsed.typography(with: appearance.size as Any)?.lineHeight
            ?? 0
    }

    @ViewBuilder
    private func collapsedCenterContent(useAbsoluteCentering: Bool) -> some View {
        let horizontalAlignment: HorizontalAlignment = useAbsoluteCentering ? .center : collapsedTextAlign.horizontalAlignment
        let measuredTitle = collapsedTitleContentHeight >= 0
        let measuredDescription = collapsedDescriptionContentHeight >= 0
        let hasTitle = collapsedTitleContentHeight >= 1
        let hasDescription = collapsedDescriptionContentHeight >= 1
        let hideTitle = measuredTitle && !hasTitle
        let hideDescription = measuredDescription && !hasDescription
        let spacingBetweenTitleAndDescription = (hasTitle && hasDescription) ? appearance.size.descriptionPaddingCollapsed : 0
        VStack(alignment: horizontalAlignment, spacing: spacingBetweenTitleAndDescription) {
            Group {
                collapsedTitle()
                    .typography(appearance.titleTypographyCollapsed.typography(with: appearance.size as Any) ?? .undefined)
                    .foregroundColor(currentColor(for: appearance.titleColor))
                    .multilineTextAlignment(useAbsoluteCentering ? .center : (collapsedTextAlign == .center ? .center : (collapsedTextAlign == .left ? .leading : .trailing)))
            }
            .background(
                GeometryReader { g in
                    Color.clear.preference(key: CollapsedTitleContentHeightKey.self, value: g.size.height)
                }
            )
            .frame(minHeight: hasTitle ? collapsedTitleLineHeight : 0, maxHeight: hideTitle ? 0 : nil)
            Group {
                collapsedDescription()
                    .typography(appearance.descriptionTypographyCollapsed.typography(with: appearance.size as Any) ?? .undefined)
                    .foregroundColor(currentColor(for: appearance.descriptionColor))
                    .multilineTextAlignment(useAbsoluteCentering ? .center : (collapsedTextAlign == .center ? .center : (collapsedTextAlign == .left ? .leading : .trailing)))
            }
            .background(
                GeometryReader { g in
                    Color.clear.preference(key: CollapsedDescriptionContentHeightKey.self, value: g.size.height)
                }
            )
            .frame(maxHeight: hideDescription ? 0 : nil)
        }
        .onPreferenceChange(CollapsedTitleContentHeightKey.self) { value in
            DispatchQueue.main.async {
                if collapsedTitleContentHeight != value {
                    collapsedTitleContentHeight = value
                }
            }
        }
        .onPreferenceChange(CollapsedDescriptionContentHeightKey.self) { value in
            DispatchQueue.main.async {
                if collapsedDescriptionContentHeight != value {
                    collapsedDescriptionContentHeight = value
                }
            }
        }
        .frame(maxWidth: useAbsoluteCentering ? nil : .infinity, alignment: Alignment(horizontal: horizontalAlignment, vertical: .center))
        .padding(.leading, appearance.size.horizontalSpacing)
        .padding(.trailing, appearance.size.horizontalSpacing)
        .opacity(collapsedRowAlpha)
        .animation(.easeInOut(duration: 0.2), value: state.collapsedFraction)
    }

    // MARK: - Expanded block

    @ViewBuilder
    private func expandedBlockView() -> some View {
        ZStack(alignment: .top) {
            if let backgroundContent = backgroundContent {
                backgroundContent()
            }
            expandedRow
        }
        .clipped()
        .fixedSize(horizontal: false, vertical: true)
        .opacity(expandedRowAlpha)
        .readSize { size in
            expandedHeight = size.height
        }
        .background(effectiveBackgroundColor)
    }

    @ViewBuilder
    private var expandedRow: some View {
        VStack(alignment: expandedTextAlign.horizontalAlignment, spacing: 0) {
            Spacer().frame(height: appearance.size.textBlockTopMargin)
            VStack(alignment: expandedTextAlign.horizontalAlignment, spacing: appearance.size.descriptionPadding) {
                expandedTitle()
                    .typography(appearance.titleTypography.typography(with: appearance.size as Any) ?? .undefined)
                    .foregroundColor(currentColor(for: appearance.titleColor))
                    .multilineTextAlignment(expandedTextAlign == .center ? .center : (expandedTextAlign == .left ? .leading : .trailing))
                    .frame(maxWidth: .infinity, alignment: Alignment(horizontal: expandedTextAlign.horizontalAlignment, vertical: .top))
                expandedDescription()
                    .typography(appearance.descriptionTypography.typography(with: appearance.size as Any) ?? .undefined)
                    .foregroundColor(currentColor(for: appearance.descriptionColor))
                    .multilineTextAlignment(expandedTextAlign == .center ? .center : (expandedTextAlign == .left ? .leading : .trailing))
                    .frame(maxWidth: .infinity, alignment: Alignment(horizontal: expandedTextAlign.horizontalAlignment, vertical: .top))
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, alignment: Alignment(horizontal: expandedTextAlign.horizontalAlignment, vertical: .top))
            .padding(.leading, appearance.size.paddingStart)
            .padding(.trailing, appearance.size.paddingEnd)
            .padding(.bottom, appearance.size.paddingBottom)
        }
        .background(effectiveBackgroundColor)
        .clipped()
    }

    private var collapsedRowAlpha: Double {
        min(1, Double(state.collapsedFraction) / 0.9)
    }

    private var expandedRowAlpha: Double {
        Double(1 - state.collapsedFraction)
    }

    // MARK: - Scroll Content

    @ViewBuilder
    private func scrollContentView(
        contentHeightBinding: Binding<CGFloat>,
        hideContentBlock: Bool = false
    ) -> some View {
        ScrollViewWrapper(
            contentOffset: $scrollContentOffset,
            scrollViewHeight: Binding<CGFloat>.constant(0),
            visibleHeight: Binding<CGFloat>.constant(0),
            scrollIndicatorInsetTop: effectiveBarHeight + expandedHeight + contentBlockHeight,
            contentInsetTop: effectiveBarHeight,
            backgroundColor: effectiveBackgroundColor
        ) {
            VStack(spacing: 0) {
                expandedBlockView()
                if let middle = middleContent {
                    middle()
                        .opacity(hideContentBlock ? 0 : 1)
                        .background(
                            GeometryReader { g in
                                Color.clear
                                    .onAppear { contentHeightBinding.wrappedValue = g.size.height }
                                    .id(g.size.height)
                            }
                        )
                }
                content()
            }
            .background(effectiveBackgroundColor)
            .frame(maxWidth: .infinity, alignment: .top)
        }
        .background(effectiveBackgroundColor)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // MARK: - Helpers

    private var effectiveBackgroundColor: Color {
        if !subtheme.isNone, let color = subthemeBackgroundColor {
            return color
        }
        return Color(uiColor: .systemBackground)
    }

    private var barBackgroundColor: Color {
        currentColor(for: appearance.backgroundColor)
    }

    private func currentColor(for token: ColorToken) -> Color {
        token.color(for: colorScheme, subtheme: subtheme)
    }

    private func cornerRadius(from pathDrawer: PathDrawer) -> CGFloat {
        if let drawer = pathDrawer as? CornerRadiusDrawer {
            return drawer.cornerRadius
        }
        return 0
    }

    @ViewBuilder
    private func topCornerMask(cornerRadius: CGFloat, backgroundColor: Color) -> some View {
        if cornerRadius > 0 {
            Rectangle()
                .fill(backgroundColor)
                .frame(height: cornerRadius)
        }
    }

    private func applyScrollFromOffset(clampedY: CGFloat) {
        let y = max(0, clampedY)
        if clampedY < 0, scrollContentOffset.y != 0 {
            scrollContentOffset = CGPoint(x: scrollContentOffset.x, y: 0)
        }
        state.contentOffset = y
        if expandedHeight > 0 {
            state.heightOffsetLimit = -expandedHeight
            let scrolledIntoBar = max(0, min(expandedHeight, y))
            state.heightOffset = -scrolledIntoBar
        } else {
            state.heightOffset = 0
        }
        previousScrollOffsetY = y
    }
}

// MARK: - NavigationBarTextAlign + HorizontalAlignment

private extension NavigationBarTextAlign {
    var horizontalAlignment: HorizontalAlignment {
        switch self {
        case .left: return .leading
        case .center: return .center
        case .right: return .trailing
        }
    }
}

// MARK: - Convenience Initializers

extension SDDSCollapsingNavigationBar where ActionStart == EmptyView {
    public init(
        appearance: CollapsingNavigationBarAppearance,
        expandedTitle: @escaping () -> ExpandedTitle,
        expandedDescription: @escaping () -> ExpandedDescription,
        collapsedTitle: @escaping () -> CollapsedTitle,
        collapsedDescription: @escaping () -> CollapsedDescription,
        expandedTextAlign: NavigationBarTextAlign = .left,
        collapsedTextAlign: NavigationBarTextAlign = .center,
        centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy = .relative,
        actionEnd: @escaping () -> ActionEnd,
        backgroundContent: (() -> AnyView)? = nil,
        middleContent: (() -> AnyView)? = nil,
        state: CollapsingNavigationBarState,
        scrollBehavior: CollapsingNavigationBarScrollBehavior,
        onBackPressed: @escaping () -> Void = {},
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.init(
            appearance: appearance,
            expandedTitle: expandedTitle,
            expandedDescription: expandedDescription,
            collapsedTitle: collapsedTitle,
            collapsedDescription: collapsedDescription,
            expandedTextAlign: expandedTextAlign,
            collapsedTextAlign: collapsedTextAlign,
            centerAlignmentStrategy: centerAlignmentStrategy,
            actionStart: { EmptyView() },
            actionEnd: actionEnd,
            backgroundContent: backgroundContent,
            middleContent: middleContent,
            state: state,
            scrollBehavior: scrollBehavior,
            onBackPressed: onBackPressed,
            content: content
        )
    }
}

extension SDDSCollapsingNavigationBar where ActionEnd == EmptyView {
    public init(
        appearance: CollapsingNavigationBarAppearance,
        expandedTitle: @escaping () -> ExpandedTitle,
        expandedDescription: @escaping () -> ExpandedDescription,
        collapsedTitle: @escaping () -> CollapsedTitle,
        collapsedDescription: @escaping () -> CollapsedDescription,
        expandedTextAlign: NavigationBarTextAlign = .left,
        collapsedTextAlign: NavigationBarTextAlign = .center,
        centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy = .relative,
        actionStart: @escaping () -> ActionStart,
        backgroundContent: (() -> AnyView)? = nil,
        middleContent: (() -> AnyView)? = nil,
        state: CollapsingNavigationBarState,
        scrollBehavior: CollapsingNavigationBarScrollBehavior,
        onBackPressed: @escaping () -> Void = {},
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.init(
            appearance: appearance,
            expandedTitle: expandedTitle,
            expandedDescription: expandedDescription,
            collapsedTitle: collapsedTitle,
            collapsedDescription: collapsedDescription,
            expandedTextAlign: expandedTextAlign,
            collapsedTextAlign: collapsedTextAlign,
            centerAlignmentStrategy: centerAlignmentStrategy,
            actionStart: actionStart,
            actionEnd: { EmptyView() },
            backgroundContent: backgroundContent,
            middleContent: middleContent,
            state: state,
            scrollBehavior: scrollBehavior,
            onBackPressed: onBackPressed,
            content: content
        )
    }
}

extension SDDSCollapsingNavigationBar where ActionStart == EmptyView, ActionEnd == EmptyView {
    public init(
        appearance: CollapsingNavigationBarAppearance,
        expandedTitle: @escaping () -> ExpandedTitle,
        expandedDescription: @escaping () -> ExpandedDescription,
        collapsedTitle: @escaping () -> CollapsedTitle,
        collapsedDescription: @escaping () -> CollapsedDescription,
        expandedTextAlign: NavigationBarTextAlign = .left,
        collapsedTextAlign: NavigationBarTextAlign = .center,
        centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy = .relative,
        backgroundContent: (() -> AnyView)? = nil,
        middleContent: (() -> AnyView)? = nil,
        state: CollapsingNavigationBarState,
        scrollBehavior: CollapsingNavigationBarScrollBehavior,
        onBackPressed: @escaping () -> Void = {},
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.init(
            appearance: appearance,
            expandedTitle: expandedTitle,
            expandedDescription: expandedDescription,
            collapsedTitle: collapsedTitle,
            collapsedDescription: collapsedDescription,
            expandedTextAlign: expandedTextAlign,
            collapsedTextAlign: collapsedTextAlign,
            centerAlignmentStrategy: centerAlignmentStrategy,
            actionStart: { EmptyView() },
            actionEnd: { EmptyView() },
            backgroundContent: backgroundContent,
            middleContent: middleContent,
            state: state,
            scrollBehavior: scrollBehavior,
            onBackPressed: onBackPressed,
            content: content
        )
    }
}
