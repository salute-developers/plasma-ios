import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

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
    
    @Published var label: String = "label"
    @Published var title: String = "title"
    @Published var subtitle: String = "subtitle"
    
    @Published var leftContentType: CellContent = .avatar
    @Published var rightContentType: CellContent = .iconButton
    
    @Published var disclosureEnabled: Bool = true
    @Published var disclosureText: String = ""
    
    @Published var isOn: Bool = false
    @Published var isSelected: Bool = false
    @Published var state: SelectionControlState = .deselected
    
    init(theme: Theme = .sdddsServTheme, uiState: CellUiState = .init()) {
        super.init(variationProvider: CellVariationProvider(theme: theme), theme: theme)
        apply(uiState: uiState)
    }

    private func apply(uiState: CellUiState) {
        alignment = uiState.alignment
        label = uiState.label
        title = uiState.title
        subtitle = uiState.subtitle
        leftContentType = uiState.leftContentType
        rightContentType = uiState.rightContentType
        disclosureEnabled = uiState.disclosureEnabled
        disclosureText = uiState.disclosureText
        isOn = uiState.isOn
        isSelected = uiState.isSelected
        state = uiState.state
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
