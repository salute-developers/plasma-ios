import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

final class ProgressBarViewModel: ObservableObject {
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
    @Published var variation: AppearanceVariation<ProgressBarAppearance> = SDDSProgressView.accent
    
    // MARK: - Screen properties
    
    private var isUpdatingProgress = false
    private var isUpdatingProgressString = false
}
