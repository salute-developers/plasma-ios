import SwiftUI
import UIKit

private let carouselSideVisibleWidth: CGFloat = 68

private final class CarouselPagingFlowLayout: UICollectionViewFlowLayout {
    var carouselGap: CGFloat = 0 {
        didSet {
            guard oldValue != carouselGap else { return }
            minimumLineSpacing = carouselGap
            invalidateLayout()
        }
    }
    var snapAlignment: CarouselSlideAlignment = .center {
        didSet {
            guard oldValue != snapAlignment else { return }
            invalidateLayout()
        }
    }
    var visibleSideCount: CGFloat = 2 {
        didSet {
            guard oldValue != visibleSideCount else { return }
            invalidateLayout()
        }
    }
    var fixedPageWidth: CGFloat? {
        didSet {
            guard oldValue != fixedPageWidth else { return }
            invalidateLayout()
        }
    }

    override init() {
        super.init()
        scrollDirection = .horizontal
        minimumLineSpacing = carouselGap
        sectionInset = .zero
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepare() {
        super.prepare()
        guard let collectionView else { return }

        minimumLineSpacing = carouselGap
        let width: CGFloat
        if let fixedPageWidth {
            width = max(min(fixedPageWidth, collectionView.bounds.width), 1)
        } else {
            width = max(collectionView.bounds.width - carouselSideVisibleWidth * visibleSideCount - carouselGap * 2, 1)
        }
        let height = max(collectionView.bounds.height, 1)
        itemSize = CGSize(width: width, height: height)
        if sectionInset != .zero {
            sectionInset = .zero
        }
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true
    }
}

struct CarouselCollectionView<Content: View>: UIViewRepresentable {
    @Binding var selection: Int
    let pageCount: Int
    let gap: CGFloat
    let visibleSideCount: CGFloat
    let fixedPageWidth: CGFloat?
    let pageAlignment: CarouselSlideAlignment
    let isScrollEnabled: Bool
    let content: (Int) -> Content

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> UICollectionView {
        let layout = CarouselPagingFlowLayout()
        layout.carouselGap = gap
        layout.visibleSideCount = visibleSideCount
        layout.fixedPageWidth = fixedPageWidth
        layout.snapAlignment = pageAlignment

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.alwaysBounceHorizontal = true
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        collectionView.isScrollEnabled = isScrollEnabled
        collectionView.register(HostingCarouselCell.self, forCellWithReuseIdentifier: HostingCarouselCell.reuseIdentifier)
        return collectionView
    }

    func updateUIView(_ uiView: UICollectionView, context: Context) {
        context.coordinator.parent = self
        context.coordinator.parentViewController = uiView.parentViewController
        context.coordinator.prepareForUpdate()

        if let layout = uiView.collectionViewLayout as? CarouselPagingFlowLayout {
            layout.carouselGap = gap
            layout.visibleSideCount = visibleSideCount
            layout.fixedPageWidth = fixedPageWidth
            layout.snapAlignment = pageAlignment
        }

        uiView.isScrollEnabled = isScrollEnabled
        if context.coordinator.shouldReloadData {
            uiView.reloadData()
            context.coordinator.shouldReloadData = false
        } else {
            context.coordinator.refreshVisibleCells(in: uiView)
        }
        context.coordinator.scrollToSelectionIfNeeded(
            collectionView: uiView,
            animated: true
        )
    }

    final class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
        var parent: CarouselCollectionView
        weak var parentViewController: UIViewController?
        private var isProgrammaticScroll = false
        private var hasScheduledDeferredPositioning = false
        private var lastKnownSelection: Int = -1
        private var hasPerformedInitialPositioning = false
        private var lastKnownBoundsSize: CGSize = .zero
        private var lastKnownPageCount: Int = 0
        private var lastKnownGap: CGFloat = 0
        private var lastKnownAlignment: CarouselSlideAlignment = .center
        var shouldReloadData = true

        var shouldAnimateSelectionScroll: Bool {
            hasPerformedInitialPositioning
        }

        init(parent: CarouselCollectionView) {
            self.parent = parent
            lastKnownPageCount = parent.pageCount
            lastKnownGap = parent.gap
            lastKnownAlignment = parent.pageAlignment
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            parent.pageCount
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HostingCarouselCell.reuseIdentifier,
                    for: indexPath
                ) as? HostingCarouselCell
            else {
                return UICollectionViewCell()
            }

            let hostedView = parent.content(indexPath.item)
            cell.apply(rootView: AnyView(hostedView), parentViewController: parentViewController)
            return cell
        }

        func scrollViewWillEndDragging(
            _ scrollView: UIScrollView,
            withVelocity velocity: CGPoint,
            targetContentOffset: UnsafeMutablePointer<CGPoint>
        ) {
            guard
                let collectionView = scrollView as? UICollectionView,
                let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout,
                parent.pageCount > 0
            else { return }

            let targetOffsetX = clampedContentOffsetX(
                targetContentOffset.pointee.x,
                in: collectionView
            )
            let targetIndex = index(
                forContentOffsetX: targetOffsetX,
                in: collectionView,
                layout: layout
            )
            targetContentOffset.pointee.x = contentOffsetX(
                forIndex: targetIndex,
                in: collectionView,
                layout: layout
            )
        }

        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            isProgrammaticScroll = false
            updateSelectionFromScroll(scrollView: scrollView)
        }

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            updateSelectionFromScroll(scrollView: scrollView)
        }

        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            // If user starts dragging, treat further updates as user-driven.
            isProgrammaticScroll = false
        }

        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            if !decelerate {
                isProgrammaticScroll = false
                updateSelectionFromScroll(scrollView: scrollView)
            }
        }

        func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
            isProgrammaticScroll = false
        }

        func scrollToSelectionIfNeeded(collectionView: UICollectionView, animated: Bool) {
            guard parent.pageCount > 0 else {
                hasPerformedInitialPositioning = false
                lastKnownSelection = -1
                return
            }
            guard collectionView.bounds.width > 1, collectionView.bounds.height > 1 else {
                // Keep selection "dirty" until we have final layout size.
                lastKnownSelection = -1
                return
            }
            let boundsChanged = collectionView.bounds.size != lastKnownBoundsSize
            let clampedSelection = min(max(parent.selection, 0), parent.pageCount - 1)
            guard clampedSelection != lastKnownSelection || !hasPerformedInitialPositioning || boundsChanged else { return }

            collectionView.layoutIfNeeded()
            guard collectionView.numberOfItems(inSection: 0) > clampedSelection else {
                // Data/layout is not ready yet; retry on next update pass.
                lastKnownSelection = -1
                scheduleDeferredPositioning(for: collectionView)
                return
            }

            let isInitialSelectionSync = !hasPerformedInitialPositioning
                && lastKnownSelection == -1
                && clampedSelection == 0
            // Disable animation only for the very first sync to the initial page.
            // Any first user-driven transition (including after variation changes) must be animated.
            var shouldAnimate = animated && !isInitialSelectionSync
            var didApplyPosition = false

            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let targetOffsetX = contentOffsetX(
                    forIndex: clampedSelection,
                    in: collectionView,
                    layout: layout
                )
                if shouldAnimate {
                    let deltaX = abs(collectionView.contentOffset.x - targetOffsetX)
                    // No-op animated scroll may not trigger completion delegate.
                    if deltaX < 0.5 {
                        shouldAnimate = false
                    }
                }
                if shouldAnimate {
                    isProgrammaticScroll = true
                }
                collectionView.setContentOffset(CGPoint(x: targetOffsetX, y: 0), animated: shouldAnimate)
                didApplyPosition = true
            } else {
                if shouldAnimate {
                    isProgrammaticScroll = true
                }
                collectionView.scrollToItem(
                    at: IndexPath(item: clampedSelection, section: 0),
                    at: .centeredHorizontally,
                    animated: shouldAnimate
                )
                didApplyPosition = true
            }

            guard didApplyPosition else {
                lastKnownSelection = -1
                return
            }

            lastKnownSelection = clampedSelection
            lastKnownBoundsSize = collectionView.bounds.size
            if !shouldAnimate {
                isProgrammaticScroll = false
            }
            hasPerformedInitialPositioning = true
        }

        private func scheduleDeferredPositioning(for collectionView: UICollectionView) {
            guard !hasScheduledDeferredPositioning else { return }
            hasScheduledDeferredPositioning = true
            DispatchQueue.main.async { [weak self, weak collectionView] in
                guard let self, let collectionView else { return }
                self.hasScheduledDeferredPositioning = false
                let shouldAnimateDeferred = self.hasPerformedInitialPositioning || self.parent.selection != 0
                self.scrollToSelectionIfNeeded(
                    collectionView: collectionView,
                    animated: shouldAnimateDeferred
                )
            }
        }

        func refreshVisibleCells(in collectionView: UICollectionView) {
            for indexPath in collectionView.indexPathsForVisibleItems {
                guard
                    indexPath.item >= 0,
                    indexPath.item < parent.pageCount,
                    let cell = collectionView.cellForItem(at: indexPath) as? HostingCarouselCell
                else {
                    continue
                }
                cell.apply(rootView: AnyView(parent.content(indexPath.item)), parentViewController: parentViewController)
            }
        }

        func prepareForUpdate() {
            if parent.pageCount != lastKnownPageCount {
                shouldReloadData = true
                lastKnownPageCount = parent.pageCount
                hasPerformedInitialPositioning = false
                lastKnownSelection = -1
            }
            if parent.gap != lastKnownGap {
                shouldReloadData = true
                lastKnownGap = parent.gap
                hasPerformedInitialPositioning = false
            }
            if parent.pageAlignment != lastKnownAlignment {
                lastKnownAlignment = parent.pageAlignment
                hasPerformedInitialPositioning = false
            }
        }

        private func updateSelectionFromScroll(scrollView: UIScrollView) {
            guard
                !isProgrammaticScroll,
                parent.pageCount > 0,
                let collectionView = scrollView as? UICollectionView,
                let clampedIndex = nearestIndex(in: collectionView)
            else { return }
            if clampedIndex != parent.selection {
                parent.selection = clampedIndex
            }
            lastKnownSelection = clampedIndex
        }

        private func nearestIndex(in collectionView: UICollectionView) -> Int? {
            guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
                return nil
            }
            return index(
                forContentOffsetX: collectionView.contentOffset.x,
                in: collectionView,
                layout: layout
            )
        }

        private func anchorX(
            forContentOffsetX contentOffsetX: CGFloat,
            in collectionView: UICollectionView,
            layout: UICollectionViewFlowLayout
        ) -> CGFloat {
            switch parent.pageAlignment {
            case .start:
                return contentOffsetX + layout.sectionInset.left
            case .center:
                return contentOffsetX + collectionView.bounds.width / 2
            case .end:
                return contentOffsetX + collectionView.bounds.width - layout.sectionInset.right
            }
        }

        private func contentOffsetX(
            forIndex index: Int,
            in collectionView: UICollectionView,
            layout: UICollectionViewFlowLayout
        ) -> CGFloat {
            let safeIndex = min(max(index, 0), max(parent.pageCount - 1, 0))
            let itemWidth = max(layout.itemSize.width, 1)
            let stride = itemWidth + layout.minimumLineSpacing
            let itemMinX = layout.sectionInset.left + CGFloat(safeIndex) * stride
            let targetOffset: CGFloat
            switch parent.pageAlignment {
            case .start:
                targetOffset = itemMinX - layout.sectionInset.left
            case .center:
                targetOffset = itemMinX + itemWidth / 2 - collectionView.bounds.width / 2
            case .end:
                targetOffset = itemMinX + itemWidth - (collectionView.bounds.width - layout.sectionInset.right)
            }
            let minOffsetX = -collectionView.contentInset.left
            let maxOffsetX = max(
                collectionView.contentSize.width - collectionView.bounds.width + collectionView.contentInset.right,
                minOffsetX
            )
            return min(max(targetOffset, minOffsetX), maxOffsetX)
        }

        private func index(
            forContentOffsetX contentOffsetX: CGFloat,
            in collectionView: UICollectionView,
            layout: UICollectionViewFlowLayout
        ) -> Int {
            guard parent.pageCount > 0 else { return 0 }
            let minOffsetX = -collectionView.contentInset.left
            let maxOffsetX = max(
                collectionView.contentSize.width - collectionView.bounds.width + collectionView.contentInset.right,
                minOffsetX
            )
            let clampedOffsetX = min(max(contentOffsetX, minOffsetX), maxOffsetX)
            if clampedOffsetX <= minOffsetX + 0.5 {
                return 0
            }
            if clampedOffsetX >= maxOffsetX - 0.5 {
                return parent.pageCount - 1
            }
            let anchor = anchorX(
                forContentOffsetX: clampedOffsetX,
                in: collectionView,
                layout: layout
            )
            return index(forAnchorX: anchor, layout: layout)
        }

        private func clampedContentOffsetX(_ contentOffsetX: CGFloat, in collectionView: UICollectionView) -> CGFloat {
            let minOffsetX = -collectionView.contentInset.left
            let maxOffsetX = max(
                collectionView.contentSize.width - collectionView.bounds.width + collectionView.contentInset.right,
                minOffsetX
            )
            return min(max(contentOffsetX, minOffsetX), maxOffsetX)
        }

        private func index(forAnchorX anchorX: CGFloat, layout: UICollectionViewFlowLayout) -> Int {
            guard parent.pageCount > 0 else { return 0 }
            let itemWidth = max(layout.itemSize.width, 1)
            let stride = itemWidth + layout.minimumLineSpacing
            guard stride > 0 else { return 0 }

            let firstAnchorX: CGFloat
            switch parent.pageAlignment {
            case .start:
                firstAnchorX = layout.sectionInset.left
            case .center:
                firstAnchorX = layout.sectionInset.left + itemWidth / 2
            case .end:
                firstAnchorX = layout.sectionInset.left + itemWidth
            }

            let rawIndex = Int(round((anchorX - firstAnchorX) / stride))
            return min(max(rawIndex, 0), parent.pageCount - 1)
        }
    }
}
