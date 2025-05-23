import SwiftUI
import SDDSComponents

enum OverlayBackgroundColors: String, CaseIterable {
    case info
    case accent
    case warning
    case `default`
}

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
    @Published var backgroundColor: OverlayBackgroundColors = .info {
        didSet {
            switch backgroundColor {
            case .info:
                appearance.backgroundColor = .surfaceDefaultInfo
            case .accent:
                appearance.backgroundColor = .surfaceDefaultAccent
            case .warning:
                appearance.backgroundColor = .surfaceDefaultWarning
            case .default:
                appearance.backgroundColor = .overlayDefaultSoft
            }
        }
    }
    
    let ids =  [UUID(), UUID(), UUID(), UUID()]
    
    init() {
        super.init(variationProvider: OverlayVariationProvider())
        self.selectedItemId = ids[0]
    }
}
