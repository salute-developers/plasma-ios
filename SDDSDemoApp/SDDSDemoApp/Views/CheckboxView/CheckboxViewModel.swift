import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class CheckboxViewModel: ComponentViewModel<CheckboxVariationProvider> {
    // MARK: - Checkbox Properties
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var state: SelectionControlState = .deselected
    @Published var isEnabled: Bool = true
    
    init() {
        super.init(variationProvider: CheckboxVariationProvider())
    }
}
