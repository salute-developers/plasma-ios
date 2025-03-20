import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class BottomSheetViewModel: ComponentViewModel<BottomSheetVariationProvider> {
    @Published var isBottomSheetPresented = false
    @Published var isFooterEnabled = true
    @Published var isHeaderEnabled = true
    
    init() {
        super.init(variationProvider: BottomSheetVariationProvider())
    }
    
    func updateHandlePlacement(_ placement: BottomSheetHandlePlacement) {
        var newAppearance = appearance
        newAppearance.handlePlacement = placement
        appearance = newAppearance
    }
}
