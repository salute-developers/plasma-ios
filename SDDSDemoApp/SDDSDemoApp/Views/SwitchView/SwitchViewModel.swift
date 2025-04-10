import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class SwitchViewModel: ComponentViewModel<SwitchVariationProvider> {
    // MARK: - Switch Properties
    @Published var title: String = "Label"
    @Published var subtitle: String = "Description"
    @Published var isOn: Bool = true
    @Published var isEnabled: Bool = true
    @Published var switchAccessibility: SwitchAccessibility = SwitchAccessibility()
    
    init() {
        super.init(variationProvider: SwitchVariationProvider())
    }
}
