import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class NoteCompactViewModel: ComponentViewModel<NoteCompactVariationProvider> {
    @Published var title: String = "Title"
    @Published var text: String = "Text"
    @Published var linkButtonTitle: String = "Label"
    @Published var linkButtonIconVisible: Bool = false {
        didSet {
            updateLinkButtonIcon()
        }
    }
    @Published var linkButtonIcon: Image?
    @Published var hasContentBefore: Bool = true
    
    private func updateLinkButtonIcon() {
        if linkButtonIconVisible {
            linkButtonIcon = Image("buttonIcon")
        } else {
            linkButtonIcon = nil
        }
    }
    
    init() {
        super.init(variationProvider: NoteCompactVariationProvider())
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
}

