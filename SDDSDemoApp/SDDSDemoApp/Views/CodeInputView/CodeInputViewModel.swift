import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

final class CodeInputViewModel: ComponentViewModel<CodeInputVariationProvider> {
    private let captionFailureText = "Invalid code"
    
    @Published var code: String = ""
    @Published var caption: String = "Enter the code"
    @Published var captionAlignment: CodeFieldAlignment = .center
    @Published var selectedGroupType: CodeFieldGroupType = .four {
        didSet {
            validation = CodeFieldOnlyDigitsValidation(code: validCode, groups: selectedGroups)
        }
    }
    @Published var successToastDisplayed = false
    @Published var validationResult: CodeFieldValidationResult = .success(.initial)
    @Published var isHidden: Bool = false
    @Published var validation: CodeFieldValidation = CodeFieldDisabledValidation()
    
    private var validCode: String {
        switch selectedGroupType {
        case .four:
            "1234"
        case .five:
            "12345"
        case .six:
            "123456"
        }
    }
    
    var availableGroupTypes: [CodeFieldGroupType] {
        CodeFieldGroupType.allCases
    }
    
    var selectedGroups: [CodeFieldGroup] {
        selectedGroupType.groups
    }
    
    var captionText: String {
        switch validationResult {
        case .success(.validated):
            return caption
        case .failure(.invalidCode):
            return captionFailureText
        case .failure(.inputFailed), .success(.next), .success(.initial):
            return caption
        }
    }
    
    private func updateCaption(validationResult: CodeFieldValidationResult) {
        switch validationResult {
        case .success(.validated):
            successToastDisplayed = true
        case .failure(.invalidCode):
            break
        case .failure(.inputFailed), .success(.next), .success(.initial):
            break
        }
    }
    
    init(theme: Theme = .sdddsServTheme, uiState: CodeInputUiState = .init()) {
        super.init(variationProvider: CodeInputVariationProvider(theme: theme), theme: theme)

        validation = CodeFieldOnlyDigitsValidation(code: validCode, groups: selectedGroups)

        $validationResult
            .sink { [weak self] value in
                self?.updateCaption(validationResult: value)
            }
            .store(in: &cancellables)

        apply(uiState: uiState)
    }

    private func apply(uiState: CodeInputUiState) {
        code = uiState.code
        caption = uiState.caption
        captionAlignment = uiState.captionAlignment
        selectedGroupType = uiState.selectedGroupType
        successToastDisplayed = uiState.successToastDisplayed
        validationResult = uiState.validationResult
        isHidden = uiState.isHidden
        validation = CodeFieldOnlyDigitsValidation(code: validCode, groups: selectedGroups)
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
