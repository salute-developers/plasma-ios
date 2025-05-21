import SwiftUI
import SDDSComponents

final class OverlayViewModel: ComponentViewModel<OverlayVariationProvider> {
    @Published var isPresent: Bool = false
    @Published var selectedItemId: UUID?
    @Published var hasBlur: Bool = true {
        didSet {
            if !hasBlur {
                appearance.blurRadius = 0
            } else {
                appearance.blurRadius = 16
            }
        }
    }
    @Published var hasBackgroundColor: Bool = true {
        didSet {
            switch hasBackgroundColor {
            case true:
                appearance.backgroundColor = .overlayDefaultSoft
            case false:
                appearance.backgroundColor = .clearColor
            }
        }
    }
    
    let ids =  [UUID(), UUID(), UUID(), UUID()]
    
    init() {
        super.init(variationProvider: OverlayVariationProvider())
        self.selectedItemId = ids[0]
    }
}
