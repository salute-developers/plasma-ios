import Foundation
import SDDSComponents
import SDDSServTheme
import SwiftUI

public extension AvatarAppearance {
    static var `default`: AvatarAppearance {
        AvatarAppearance(
            textFillStyle: .gradient(Gradients.textDefaultAccentGradient),
            backgroundFillStyle: .gradient(Gradients.surfaceDefaultAccentGradient),
            backgroundOpacity: 0.2,
            onlineStatusColor: Colors.textDefaultAccent,
            offlineStatusColor: Colors.surfaceOnLightSolidTertiary,
            textTypography: AvatarTypography.title
        )
    }
}
