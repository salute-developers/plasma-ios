import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class CircularProgressBarViewModel: ComponentViewModel<CircularProgressBarVariationProvider> {
    @Published var progress: Double = 0.5
    @Published var valueEnabled: Bool = true
    
    init() {
        super.init(variationProvider: CircularProgressBarVariationProvider())
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
    
    func updateAppearance() {
        var appearance = self.appearance
        appearance.valueEnabled = valueEnabled
        self.appearance = appearance
    }
}
