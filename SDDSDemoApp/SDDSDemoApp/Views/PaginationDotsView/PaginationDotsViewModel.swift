import Foundation
import SDDSComponents

final class PaginationDotsViewModel: ComponentViewModel<PaginationDotsVariationProvider> {
    private var isNormalizing = false
    
    @Published var totalCount: Int = 10 {
        didSet {
            guard !isNormalizing else { return }
            normalizeState()
        }
    }
    
    @Published var visibleCount: Int = 5 {
        didSet {
            guard !isNormalizing else { return }
            normalizeState()
        }
    }
    
    @Published var selectedIndex: Int = 0 {
        didSet {
            guard !isNormalizing else { return }
            normalizeState()
        }
    }
    
    @Published var step: Int = 1 {
        didSet {
            guard !isNormalizing else { return }
            normalizeState()
        }
    }
    
    init(theme: Theme = .sdddsServTheme, uiState: PaginationDotsUiState = .init()) {
        super.init(
            variationProvider: PaginationDotsVariationProvider(theme: theme),
            theme: theme
        )
        apply(uiState: uiState)
    }
    
    private func normalizeState() {
        guard !isNormalizing else { return }
        isNormalizing = true
        defer { isNormalizing = false }
        
        totalCount = min(max(totalCount, 1), 30)
        visibleCount = min(max(visibleCount, 1), totalCount)
        selectedIndex = min(max(selectedIndex, 0), totalCount - 1)
        step = min(max(step, 1), max(totalCount - 1, 1))
    }
    
    func previous() {
        selectedIndex = max(selectedIndex - step, 0)
    }
    
    func next() {
        selectedIndex = min(selectedIndex + step, totalCount - 1)
    }

    private func apply(uiState: PaginationDotsUiState) {
        totalCount = uiState.totalCount
        visibleCount = uiState.visibleCount
        selectedIndex = uiState.selectedIndex
        step = uiState.step
        normalizeState()

        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
