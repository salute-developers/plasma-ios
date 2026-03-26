import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSThemeCore

enum LoaderType: String, CaseIterable {
    case spinner = "Spinner"
    case circularProgress = "CircularProgressBar"
}

final class LoaderViewModel: ComponentViewModel<LoaderVariationProvider> {
    @Published var spinnerViewModel: SpinnerViewModel = .init(componentViewLayoutMode: .subScreen)
    @Published var circularProgressViewModel: CircularProgressBarViewModel = .init(componentViewLayoutMode: .subScreen)
    @Published var loaderType: LoaderType = .spinner
    
    init(theme: Theme = .sdddsServTheme, uiState: LoaderUiState = .init()) {
        super.init(variationProvider: LoaderVariationProvider(theme: theme), theme: theme)
        spinnerViewModel = SpinnerViewModel(theme: theme, componentViewLayoutMode: .subScreen)
        circularProgressViewModel = CircularProgressBarViewModel(theme: theme, componentViewLayoutMode: .subScreen)

        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }

        setupBindings()
        apply(uiState: uiState)
    }

    private func apply(uiState: LoaderUiState) {
        loaderType = uiState.loaderType
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
    
    private func setupBindings() {
        spinnerViewModel.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
        
        circularProgressViewModel.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
    
    override func onUpdateAppearance() {
        super.onUpdateAppearance()
        
        spinnerViewModel.appearance = appearance.spinnerAppearance ?? .defaultValue
        circularProgressViewModel.appearance = appearance.circularProgressAppearance ?? .defaultValue
    }
}
