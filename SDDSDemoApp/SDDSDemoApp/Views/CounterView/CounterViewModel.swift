import Foundation
import SwiftUI
import Combine
import SDDSComponents

final class CounterViewModel: ComponentViewModel<CounterVariationProvider> {
    @Published var text: String = "1"
    
    init(componentViewLayoutMode: ComponentViewLayoutMode = .screen) {
        super.init(variationProvider: CounterVariationProvider(), componentViewLayoutMode: componentViewLayoutMode)
    }
}
