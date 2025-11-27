import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class DrawerViewModel: ComponentViewModel<DrawerVariationProvider> {
    @Published var alignment: DrawerAlignment = .bottom
    @Published var showHeader: Bool = false
    @Published var showFooter: Bool = false
    @Published var showOverlay: Bool = false
    @Published var closePlacement: DrawerClosePlacement = .right
    @Published var moveContentEnabled: Bool = false
    @Published var peekOffsetEnabled: Bool = false
    @Published var variationType: DrawerVariationType = .inner {
        didSet {
            variationProvider.variationType = variationType
            if let firstVariation = variations.first {
                selectVariation(firstVariation)
            }
        }
    }
    
    init() {
        super.init(variationProvider: DrawerVariationProvider())
    }
}

