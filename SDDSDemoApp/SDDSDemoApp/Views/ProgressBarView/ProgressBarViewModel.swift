import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSThemeCore

final class ProgressBarViewModel: ComponentViewModel<ProgressBarVariationProvider> {
    // MARK: - Progress Bar Properties
    @Published var progress: Double = 0.5 {
        didSet {
            if !isUpdatingProgress {
                isUpdatingProgressString = true
                progressString = String(format: "%.0f", progress * 100)
                isUpdatingProgressString = false
            }
        }
    }
    
    @Published var progressString: String = "50" {
        didSet {
            if !isUpdatingProgressString {
                isUpdatingProgress = true
                if let value = Double(progressString), value >= 0, value <= 100 {
                    progress = value / 100
                }
                isUpdatingProgress = false
            }
        }
    }
    @Published var isEnabled: Bool = true
    
    // MARK: - Screen properties
    
    private var isUpdatingProgress = false
    private var isUpdatingProgressString = false
    
    init(theme: Theme = .sdddsServTheme, uiState: ProgressBarUiState = .init()) {
        super.init(variationProvider: ProgressBarVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: ProgressBarUiState) {
        progress = uiState.progress
        progressString = uiState.progressString
        isEnabled = uiState.isEnabled
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
