import Foundation
import SDDSComponents
import SDDSServTheme
import SwiftUI

extension AvatarAppearance {
    static var `default`: AvatarAppearance {
        AvatarAppearance(
            textFillStyle: .color(Colors.textDefaultAccent),
            backgroundFillStyle: .gradient(Gradients.outlineDefaultAccentGradient),
            onlineStatusColor: Colors.textDefaultAccent,
            offlineStatusColor: Colors.surfaceOnLightSolidTertiary,
            textTypography: AvatarTypography.title
        )
    }
}
