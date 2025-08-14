import Foundation
import Combine
import SwiftUI
import SDDSComponents

enum LoaderType: String, CaseIterable {
    case spinner = "Spinner"
    case circularProgress = "CircularProgressBar"
}

final class LoaderViewModel: ComponentViewModel<LoaderVariationProvider> {
    @Published var spinnerViewModel: SpinnerViewModel = .init(componentViewLayoutMode: .subScreen)
    @Published var circularProgressViewModel: CircularProgressBarViewModel = .init(componentViewLayoutMode: .subScreen)
    @Published var loaderType: LoaderType = .spinner
    
    init() {
        super.init(variationProvider: LoaderVariationProvider())
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
        
        setupBindings()
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
