import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class SwitchViewModel: ComponentViewModel<SwitchVariationProvider> {
    // MARK: - Switch Properties
    @Published var title: String = "Switch Title"
    @Published var subtitle: String = "Switch Subtitle"
    @Published var isOn: Bool = true
    @Published var isEnabled: Bool = true
    @Published var switchAccessibility: SwitchAccessibility = SwitchAccessibility()
    
    init() {
        super.init(variationProvider: SwitchVariationProvider())
    }
}
