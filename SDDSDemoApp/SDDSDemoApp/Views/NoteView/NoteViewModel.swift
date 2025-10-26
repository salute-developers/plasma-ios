import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class NoteViewModel: ComponentViewModel<NoteVariationProvider> {
    @Published var title: String = "Заголовок"
    @Published var text: String = "Описание сообщения"
    @Published var linkButtonTitle: String = "Действие"
    @Published var linkButtonIconVisible: Bool = false {
        didSet {
            updateLinkButtonIcon()
        }
    }
    @Published var linkButtonIcon: Image?
    @Published var hasContentBefore: Bool = true
    @Published var hasCloseButton: Bool = false
    
    private func updateLinkButtonIcon() {
        if linkButtonIconVisible {
            linkButtonIcon = Image("buttonIcon")
        } else {
            linkButtonIcon = nil
        }
    }
    
    init() {
        super.init(variationProvider: NoteVariationProvider())
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
}
