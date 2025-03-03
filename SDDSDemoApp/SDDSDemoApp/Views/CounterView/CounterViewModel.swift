import Foundation
import SwiftUI
import Combine
import SDDSComponents

final class CounterViewModel: ComponentViewModel<CounterVariationProvider> {
    @Published var text: String = "1"
    
    init() {
        super.init(variationProvider: CounterVariationProvider())
    }
}
