import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class NoteCompactViewModel: ComponentViewModel<NoteCompactVariationProvider> {
    @Published var title: String = "Title"
    @Published var text: String = "Text"
    @Published var hasContentBefore: Bool = true
    @Published var hasAction: Bool = true
    
    init() {
        super.init(variationProvider: NoteCompactVariationProvider())
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
}
