import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class BottomSheetViewModel: ComponentViewModel<BottomSheetVariationProvider> {
    @Published var isBottomSheetPresented = false
    @Published var isFooterEnabled = true
    @Published var isHeaderEnabled = true
    @Published var isHeaderFixed = true
    @Published var isFooterFixed = true
    @Published var contentHeight: CGFloat = 0
    @Published var detent: BottomSheetDetent?
    
    init() {
        super.init(variationProvider: BottomSheetVariationProvider())
    }
    
    func updateHandlePlacement(_ placement: BottomSheetHandlePlacement) {
        var newAppearance = appearance
        newAppearance.handlePlacement = placement
        appearance = newAppearance
    }
    
    var placeholder: String {
        """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        """
    }
}
