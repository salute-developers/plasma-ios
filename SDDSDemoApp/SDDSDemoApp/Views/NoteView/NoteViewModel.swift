import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class NoteViewModel: ComponentViewModel<NoteVariationProvider> {
    @Published var title: String = "Title"
    @Published var text: String = "Text"
    @Published var hasContentBefore: Bool = true
    @Published var hasAction: Bool = true
    
    init() {
        super.init(variationProvider: NoteVariationProvider())
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
}
