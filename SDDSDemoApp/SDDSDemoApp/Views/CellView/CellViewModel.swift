import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

enum CellContent: String, CaseIterable {
    case avatar
    case iconButton
    case `switch`
    case checkbox
    case radiobox
    case none
}

final class CellViewModel: ComponentViewModel<CellVariationProvider> {
    @Published var alignment: CellContentAlignment = .center
    
    @Published var label: String = ""
    @Published var title: String = ""
    @Published var subtitle: String = ""
    
    @Published var leftContentType: CellContent = .avatar
    @Published var rightContentType: CellContent = .iconButton
    
    @Published var disclosureEnabled: Bool = true
    @Published var disclosureText: String = ""
    
    @Published var isOn: Bool = false
    @Published var isSelected: Bool = false
    @Published var state: SelectionControlState = .deselected
    
    init() {
        super.init(variationProvider: CellVariationProvider())
    }
}
