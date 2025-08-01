import Foundation
import SwiftUI
import SDDSComponents

final class CodeFieldViewModel: ComponentViewModel<CodeFieldVariationProvider> {
    private let captionDefaultText = "Enter the code"
    private let captionFailureText = "Invalid code"
    
    @Published var code: String = ""
    @Published var caption: String = "Enter the code"
    @Published var captionAlignment: CodeFieldAlignment = .center
    @Published var selectedGroupType: CodeFieldGroupType = .four
    @Published var successToastDisplayed = false
    @Published var validationResult: CodeFieldValidationResult = .success(.initial)
    
    var validation: CodeFieldValidation {
        return CodeFieldOnlyDigitsValidation(code: validCode, groups: selectedGroups)
    }
    
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
    
    private func updateCaption(validationResult: CodeFieldValidationResult) {
        switch validationResult {
        case .success(.validated):
            successToastDisplayed = true
            caption = captionDefaultText
        case .failure(.invalidCode):
            caption = captionFailureText
        case .failure(.inputFailed), .success(.next), .success(.initial):
            caption = captionDefaultText
        }
    }
    
    init() {
        super.init(variationProvider: CodeFieldVariationProvider())
        
        $validationResult
            .sink { [weak self] value in
                self?.updateCaption(validationResult: value)
            }
            .store(in: &cancellables)
    }
}
