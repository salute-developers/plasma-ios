import SwiftUI
import SDDSThemeCore

// MARK: - Constants

private enum PaginationDotsAnimation {
    static let timingCurveX1: Double = 0.4
    static let timingCurveY1: Double = 0.0
    static let timingCurveX2: Double = 0.2
    static let timingCurveY2: Double = 1.0
    
    /// Single duration for track offset and per-dot transitions so motion and edge-scale stay in sync.
    static let scrollDuration: Double = 0.3
    
    static var scroll: Animation {
        timingCurve(duration: scrollDuration)
    }
    
    static func timingCurve(duration: Double) -> Animation {
        .timingCurve(
            timingCurveX1,
            timingCurveY1,
            timingCurveX2,
            timingCurveY2,
            duration: duration
        )
    }
}

private enum PaginationDotVisual {
    static let pillCornerRadiusDivisor: CGFloat = 2
    static let selectedOverlayOpacity: CGFloat = 1
    static let unselectedOverlayOpacity: CGFloat = 0
    static let unitScaleLowerBound: CGFloat = 0
    static let unitScaleUpperBound: CGFloat = 1
}

// MARK: - Helpers

private func clampedToUnitInterval(_ value: CGFloat) -> CGFloat {
    min(max(value, PaginationDotVisual.unitScaleLowerBound), PaginationDotVisual.unitScaleUpperBound)
}

// MARK: - SDDSPaginationDots

public struct SDDSPaginationDots: View {
    public static let defaultVisibleCount: Int = 5
    
    @Environment(\.paginationDotsAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    
    private let selectedIndex: Int
    private let totalCount: Int
    private let visibleCount: Int
    private let _appearance: PaginationDotsAppearance?
    
    public init(
        selectedIndex: Int,
        totalCount: Int,
        visibleCount: Int = Self.defaultVisibleCount,
        appearance: PaginationDotsAppearance? = nil
    ) {
        self.selectedIndex = selectedIndex
        self.totalCount = totalCount
        self.visibleCount = visibleCount
        self._appearance = appearance
    }
    
    private var appearance: PaginationDotsAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var safeTotalCount: Int {
        max(totalCount, 0)
    }
    
    private var safeVisibleCount: Int {
        guard safeTotalCount > 0 else { return 0 }
        return min(max(visibleCount, 1), safeTotalCount)
    }
    
    private var safeSelectedIndex: Int {
        guard safeTotalCount > 0 else { return 0 }
        return min(max(selectedIndex, 0), safeTotalCount - 1)
    }
    
    private var startOffset: Int {
        guard safeVisibleCount > 0 else { return 0 }
        let center = safeVisibleCount / 2
        return min(
            max(safeSelectedIndex - center, 0),
            max(safeTotalCount - safeVisibleCount, 0)
        )
    }
    
    private var endOffset: Int {
        max(safeTotalCount - safeVisibleCount - startOffset, 0)
    }
    
    private func mainAxisDotSize(activated: Bool) -> CGFloat {
        switch appearance.size.orientation {
        case .horizontal:
            return activated ? appearance.size.dotWidthActivated : appearance.size.dotWidth
        case .vertical:
            return activated ? appearance.size.dotHeightActivated : appearance.size.dotHeight
        }
    }
    
    private var dotMainAxisSize: CGFloat {
        mainAxisDotSize(activated: false)
    }
    
    private var selectedDotMainAxisSize: CGFloat {
        mainAxisDotSize(activated: true)
    }
    
    private var viewportMainAxisSize: CGFloat {
        guard safeVisibleCount > 0 else { return 0 }
        return dotMainAxisSize * CGFloat(max(safeVisibleCount - 1, 0))
            + selectedDotMainAxisSize
            + appearance.size.gap * CGFloat(safeVisibleCount)
    }
    
    private var contentOffset: CGFloat {
        CGFloat(startOffset) * (dotMainAxisSize + appearance.size.gap)
    }
    
    public var body: some View {
        Group {
            if safeVisibleCount > 0 {
                dotsStack
            } else {
                EmptyView()
            }
        }
    }
    
    @ViewBuilder
    private var dotsStack: some View {
        orientedDotContainer {
            dotsContent
        }
    }
    
    @ViewBuilder
    private func orientedDotContainer<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        let gap = appearance.size.gap
        Group {
            switch appearance.size.orientation {
            case .horizontal:
                HStack(spacing: gap) {
                    content()
                }
                .offset(x: -contentOffset)
                .frame(width: viewportMainAxisSize, alignment: .leading)
            case .vertical:
                VStack(spacing: gap) {
                    content()
                }
                .offset(y: -contentOffset)
                .frame(height: viewportMainAxisSize, alignment: .top)
            }
        }
        .clipped()
        .animation(PaginationDotsAnimation.scroll, value: startOffset)
    }
    
    private var dotsContent: some View {
        ForEach(0..<safeTotalCount, id: \.self) { index in
            let isSelected = index == safeSelectedIndex
            let scale = dotScale(for: index)
            PaginationDotView(
                width: isSelected ? appearance.size.dotWidthActivated : appearance.size.dotWidth,
                height: isSelected ? appearance.size.dotHeightActivated : appearance.size.dotHeight,
                unselectedColor: appearance.dotBackgroundColor.color(for: colorScheme, subtheme: subtheme),
                selectedColor: appearance.dotBackgroundColorActivated.color(for: colorScheme, subtheme: subtheme),
                isSelected: isSelected,
                scale: scale
            )
        }
    }
    
    private func dotScale(for index: Int) -> CGFloat {
        guard safeTotalCount > safeVisibleCount else { return PaginationDotVisual.unitScaleUpperBound }
        let edgeCount = max(appearance.size.edgeCount, 0)
        guard edgeCount > 0 else { return PaginationDotVisual.unitScaleUpperBound }
        
        let firstVisibleIndex = startOffset
        let lastVisibleIndex = safeTotalCount - endOffset - 1
        let centerVisibleIndex = firstVisibleIndex + (lastVisibleIndex - firstVisibleIndex) / 2
        
        let shouldDecreaseFromStart = index < centerVisibleIndex && safeSelectedIndex >= firstVisibleIndex + edgeCount
        let shouldDecreaseFromEnd = index > centerVisibleIndex && safeSelectedIndex <= lastVisibleIndex - edgeCount
        
        let shrinkFactor = max(appearance.size.edgeShrinkFactor, 0)
        
        if shouldDecreaseFromStart {
            let value = PaginationDotVisual.unitScaleUpperBound
                - CGFloat(firstVisibleIndex + edgeCount - index) * shrinkFactor
            return clampedToUnitInterval(value)
        }
        if shouldDecreaseFromEnd {
            let value = PaginationDotVisual.unitScaleUpperBound
                - CGFloat(index - (lastVisibleIndex - edgeCount)) * shrinkFactor
            return clampedToUnitInterval(value)
        }
        return PaginationDotVisual.unitScaleUpperBound
    }
}

// MARK: - PaginationDotView

private struct PaginationDotView: View {
    let width: CGFloat
    let height: CGFloat
    let unselectedColor: Color
    let selectedColor: Color
    let isSelected: Bool
    let scale: CGFloat
    
    var body: some View {
        let cornerRadius = min(max(width, 0), max(height, 0)) / PaginationDotVisual.pillCornerRadiusDivisor
        let selectedOpacity = isSelected
            ? PaginationDotVisual.selectedOverlayOpacity
            : PaginationDotVisual.unselectedOverlayOpacity
        
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(unselectedColor)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(selectedColor)
                    .opacity(selectedOpacity)
            )
            .frame(width: max(width, 0), height: max(height, 0))
            .scaleEffect(clampedToUnitInterval(scale))
            // Same animation as track offset so edge scale and scroll stay in sync.
            .animation(PaginationDotsAnimation.scroll, value: scale)
            .animation(PaginationDotsAnimation.scroll, value: width)
            .animation(PaginationDotsAnimation.scroll, value: height)
            .animation(PaginationDotsAnimation.scroll, value: isSelected)
    }
}
