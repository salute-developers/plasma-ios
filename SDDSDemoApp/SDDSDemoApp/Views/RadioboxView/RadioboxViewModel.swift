import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class RadioboxViewModel: ComponentViewModel<RadioboxVariationProvider> {
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var isSelected: Bool = false
    @Published var isEnabled: Bool = true
    
    init() {
        super.init(variationProvider: RadioboxVariationProvider())
    }
}
