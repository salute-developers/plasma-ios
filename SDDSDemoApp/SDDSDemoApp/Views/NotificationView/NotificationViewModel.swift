import Foundation
import SDDSComponents
import SDDSThemeCore

final class NotificationViewModel: ComponentViewModel<NotificationVariationProvider> {
    @Published var text: String = "Notification"
    @Published var position: ToastPosition = .topCenter
    @Published var hasClose: Bool = true
    @Published var layout: NotificationLayout = .compact {
        didSet {
            self.variationProvider.layout = layout
            self.selectVariation(variations.first)
        }
    }
    
    init() {
        super.init(variationProvider: NotificationVariationProvider(layout: .compact))
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
}
