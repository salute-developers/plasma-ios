import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class CircularProgressBarViewModel: ComponentViewModel<CircularProgressBarVariationProvider> {
    @Published var progress: Double = 0.5
    @Published var valueEnabled: Bool = true
    @Published var hasTrack: Bool = true
    @Published var customContent: Bool = false
    
    init() {
        super.init(variationProvider: CircularProgressBarVariationProvider())
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
    
    override func onUpdateAppearance() {
        super.onUpdateAppearance()
        
        
    }
}
