import Foundation
import SDDSComponents
import SDDSservTheme

enum NotificationLayout: String, CaseIterable {
    case compact
    case loose
}

final class NotificationVariationProvider: VariationProvider {
    typealias Appearance = NotificationAppearance
    
    var theme: Theme
    var layout: NotificationLayout
    
    init(theme: Theme = .sdddsServTheme, layout: NotificationLayout) {
        self.theme = theme
        self.layout = layout
    }
    
    var variations: [Variation<NotificationAppearance>] {
        switch layout {
        case .compact:
            theme.notificationCompactVariations
        case .loose:
            theme.notificationLooseVariations
        }
    }
    
    var defaultValue: NotificationAppearance {
        NotificationCompact.m.appearance
    }
}
