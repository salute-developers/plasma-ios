import SwiftUI

// MARK: - Animation (spring, как в Android Carousel)

private enum CarouselNavigationAnimation {
    static var `default`: Animation {
        .interpolatingSpring(stiffness: 300, damping: 30)
    }
}

public enum CarouselSlideAlignment: Equatable {
    case start
    case center
    case end
}

/// Горизонтальная карусель с опциональными точками и кнопками prev/next.
public struct SDDSCarousel<Content: View>: View {
    @Binding private var selection: Int
    private let pageCount: Int
    private let hasIndicator: Bool
    private let hasControls: Bool
    private let indicatorVisibleCount: Int
    private let userScrollEnabled: Bool
    private let pageWidth: CGFloat?
    private let pageAlignment: CarouselSlideAlignment
    private let content: (Int) -> Content
    private let _appearance: CarouselAppearance?

    @Environment(\.carouselAppearance) private var environmentAppearance

    public init(
        selection: Binding<Int>,
        pageCount: Int,
        hasIndicator: Bool = true,
        hasControls: Bool = true,
        indicatorVisibleCount: Int = SDDSPaginationDots.defaultVisibleCount,
        userScrollEnabled: Bool = true,
        pageWidth: CGFloat? = nil,
        pageAlignment: CarouselSlideAlignment = .center,
        appearance: CarouselAppearance? = nil,
        @ViewBuilder content: @escaping (Int) -> Content
    ) {
        self._selection = selection
        self.pageCount = pageCount
        self.hasIndicator = hasIndicator
        self.hasControls = hasControls
        self.indicatorVisibleCount = indicatorVisibleCount
        self.userScrollEnabled = userScrollEnabled
        self.pageWidth = pageWidth
        self.pageAlignment = pageAlignment
        self._appearance = appearance
        self.content = content
    }

    private var appearance: CarouselAppearance {
        _appearance ?? environmentAppearance
    }

    private var safePageCount: Int {
        max(pageCount, 0)
    }

    private var safeSelection: Int {
        guard safePageCount > 0 else { return 0 }
        return min(max(selection, 0), safePageCount - 1)
    }

    private var outerSlotWidth: CGFloat {
        max(appearance.nextButtonAppearance.size.height, appearance.prevButtonAppearance.size.height)
    }

    private var pagerVisibleSideCount: CGFloat {
        appearance.size.buttonsPlacement == .outer ? 1 : 2
    }


    public var body: some View {
        let placement = appearance.size.buttonsPlacement
        VStack(spacing: appearance.size.indicatorPadding) {
            HStack(alignment: .center, spacing: 0) {
                if placement == .outer {
                    outerStartButton(placement: placement)
                }

                ZStack {
                    pagerContent

                    if placement == .inner {
                        HStack {
                            innerStartButton(placement: placement)
                            Spacer(minLength: 0)
                            innerEndButton(placement: placement)
                        }
                    }
                }
                .frame(maxWidth: .infinity)

                if placement == .outer {
                    outerEndButton(placement: placement)
                }
            }

            if hasIndicator, safePageCount > 0 {
                SDDSPaginationDots(
                    selectedIndex: safeSelection,
                    totalCount: safePageCount,
                    visibleCount: indicatorVisibleCount,
                    appearance: appearance.indicatorAppearance
                )
            }
        }
        .onChange(of: pageCount) { _ in
            clampSelection()
        }
    }

    @ViewBuilder
    private var pagerContent: some View {
        if safePageCount == 0 {
            Color.clear
                .frame(minHeight: 1)
        } else {
            CarouselCollectionView(
                selection: $selection,
                pageCount: safePageCount,
                gap: appearance.size.gap,
                visibleSideCount: pagerVisibleSideCount,
                fixedPageWidth: pageWidth,
                pageAlignment: pageAlignment,
                isScrollEnabled: userScrollEnabled
            ) { index in
                content(index)
            }
        }
    }

    private func clampSelection() {
        guard safePageCount > 0 else {
            if selection != 0 {
                selection = 0
            }
            return
        }
        let clamped = min(max(selection, 0), safePageCount - 1)
        if clamped != selection {
            selection = clamped
        }
    }

    // MARK: Outer controls

    @ViewBuilder
    private func outerStartButton(placement: CarouselButtonsPlacement) -> some View {
        if placement == .outer, hasControls, let icon = appearance.prevButtonIcon, safePageCount > 0, safeSelection > 0 {
            IconButton(
                iconAttributes: ButtonIconAttributes(image: icon, alignment: .leading),
                appearance: appearance.prevButtonAppearance,
                action: { goTo(safeSelection - 1) }
            )
            .padding(.trailing, appearance.size.prevButtonPadding)
        } else if placement == .outer, hasControls, appearance.prevButtonIcon != nil {
            Color.clear
                .frame(width: outerSlotWidth, height: outerSlotWidth)
                .padding(.trailing, appearance.size.prevButtonPadding)
        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    private func outerEndButton(placement: CarouselButtonsPlacement) -> some View {
        if placement == .outer, hasControls, let icon = appearance.nextButtonIcon, safePageCount > 0, safeSelection < safePageCount - 1 {
            IconButton(
                iconAttributes: ButtonIconAttributes(image: icon, alignment: .leading),
                appearance: appearance.nextButtonAppearance,
                action: { goTo(safeSelection + 1) }
            )
            .padding(.leading, appearance.size.nextButtonPadding)
        } else if placement == .outer, hasControls, appearance.nextButtonIcon != nil {
            Color.clear
                .frame(width: outerSlotWidth, height: outerSlotWidth)
                .padding(.leading, appearance.size.nextButtonPadding)
        } else {
            EmptyView()
        }
    }

    // MARK: Inner controls

    @ViewBuilder
    private func innerStartButton(placement: CarouselButtonsPlacement) -> some View {
        if placement == .inner, hasControls, let icon = appearance.prevButtonIcon, safePageCount > 0, safeSelection > 0 {
            IconButton(
                iconAttributes: ButtonIconAttributes(image: icon, alignment: .leading),
                appearance: appearance.prevButtonAppearance,
                action: { goTo(safeSelection - 1) }
            )
            .padding(.leading, appearance.size.prevButtonPadding)
        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    private func innerEndButton(placement: CarouselButtonsPlacement) -> some View {
        if placement == .inner, hasControls, let icon = appearance.nextButtonIcon, safePageCount > 0, safeSelection < safePageCount - 1 {
            IconButton(
                iconAttributes: ButtonIconAttributes(image: icon, alignment: .leading),
                appearance: appearance.nextButtonAppearance,
                action: { goTo(safeSelection + 1) }
            )
            .padding(.trailing, appearance.size.nextButtonPadding)
        } else {
            EmptyView()
        }
    }

    private func goTo(_ page: Int) {
        guard safePageCount > 0 else { return }
        let next = min(max(page, 0), safePageCount - 1)
        withAnimation(CarouselNavigationAnimation.default) {
            selection = next
        }
    }
}
