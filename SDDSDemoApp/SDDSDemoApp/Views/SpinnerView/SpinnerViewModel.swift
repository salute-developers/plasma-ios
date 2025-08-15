import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class SpinnerViewModel: ComponentViewModel<SpinnerVariationProvider> {
    @Published var isAnimating: Bool = true
    
    init(componentViewLayoutMode: ComponentViewLayoutMode = .screen) {
        super.init(variationProvider: SpinnerVariationProvider(), componentViewLayoutMode: componentViewLayoutMode)
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
    
    override func onUpdateAppearance() {
        super.onUpdateAppearance()
    }
} 
