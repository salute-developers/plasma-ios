import Foundation
import SDDSComponents
import SwiftUI

final class EditableViewModel: ComponentViewModel<EditableVariationProvider> {
    @Published var text: String = "Value"
    @Published var enabled: Bool = true
    @Published var readOnly: Bool = false
    @Published var singleLine: Bool = true
    @Published var textAlign: TextAlignment = .leading
    @Published var hasIcon: Bool = true
    @Published var iconPlacement: EditableIconPlacement = .relative
    
    init() {
        super.init(variationProvider: EditableVariationProvider())
    }
}
