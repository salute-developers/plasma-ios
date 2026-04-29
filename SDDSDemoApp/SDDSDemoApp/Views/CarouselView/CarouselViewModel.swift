import Foundation
import SDDSComponents

final class CarouselViewModel: ComponentViewModel<CarouselVariationProvider> {
    private var isNormalizing = false

    @Published var selectedIndex: Int = 0 {
        didSet {
            guard !isNormalizing else { return }
            normalizeState()
        }
    }

    @Published var itemCount: Int = 10 {
        didSet {
            guard !isNormalizing else { return }
            normalizeState()
        }
    }

    @Published var alignment: CarouselPageAlignment = .center
    @Published var controlsEnabled: Bool = true
    @Published var indicatorEnabled: Bool = true

    @Published var indicatorVisibleItemCount: Int = 5 {
        didSet {
            guard !isNormalizing else { return }
            normalizeState()
        }
    }

    @Published var withGap: Bool = true

    init(theme: Theme = .sdddsServTheme, uiState: CarouselUiState = .init()) {
        super.init(
            variationProvider: CarouselVariationProvider(theme: theme),
            theme: theme
        )
        apply(uiState: uiState)
    }

    private func normalizeState() {
        guard !isNormalizing else { return }
        isNormalizing = true
        defer { isNormalizing = false }

        itemCount = min(max(itemCount, 0), 30)
        indicatorVisibleItemCount = min(max(indicatorVisibleItemCount, 1), max(itemCount, 1))
        if itemCount > 0 {
            selectedIndex = min(max(selectedIndex, 0), itemCount - 1)
        } else {
            selectedIndex = 0
        }
    }

    func resolvedAppearance() -> CarouselAppearance {
        var base = appearance
        let gapValue: CGFloat = withGap ? 4 : 0
        base.size = DefaultCarouselSize(
            gap: gapValue,
            indicatorPadding: base.size.indicatorPadding,
            nextButtonPadding: base.size.nextButtonPadding,
            prevButtonPadding: base.size.prevButtonPadding,
            buttonsPlacement: base.size.buttonsPlacement
        )
        return base
    }

    private func apply(uiState: CarouselUiState) {
        selectedIndex = uiState.selectedIndex
        itemCount = uiState.itemCount
        alignment = uiState.alignment
        controlsEnabled = uiState.controlsEnabled
        indicatorEnabled = uiState.indicatorEnabled
        indicatorVisibleItemCount = uiState.indicatorVisibleItemCount
        withGap = uiState.withGap
        normalizeState()
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
