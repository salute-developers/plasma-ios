import SwiftUI

final class OverlayViewModel: ComponentViewModel<OverlayVariationProvider> {
    @Published var isPresent: Bool = false
    @Published var blurRadius: CGFloat = 0
    @Published var selectedItemId: UUID?
    let ids =  [UUID(), UUID(), UUID(), UUID()]
    
    init() {
        super.init(variationProvider: OverlayVariationProvider())
        self.selectedItemId = ids[0]
    }
}
