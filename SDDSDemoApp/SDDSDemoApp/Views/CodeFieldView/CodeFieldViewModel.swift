import Foundation
import SwiftUI
import SDDSComponents

final class CodeFieldViewModel: ComponentViewModel<CodeFieldVariationProvider> {
    @Published var code: String = ""
    @Published var caption: String = "Введите код из СМС"
    @Published var captionAlignment: TextAlignment = .center
    @Published var selectedGroupType: CodeFieldGroupType = .four
    
    var availableGroupTypes: [CodeFieldGroupType] {
        CodeFieldGroupType.allCases
    }
    
    var selectedGroups: [CodeFieldGroup] {
        selectedGroupType.groups
    }
    
    init() {
        super.init(variationProvider: CodeFieldVariationProvider())
    }
}
