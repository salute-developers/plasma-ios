import Foundation
import SwiftUI

public struct CustomAppearances {
    public let avatarAppearance: AvatarAppearance
}

public struct AppearancesEnvironmentKey: EnvironmentKey {
    public static let defaultValue: CustomAppearances = CustomAppearances(
        avatarAppearance: AvatarAppearance()
    )
}

extension EnvironmentValues {
    var appearances: CustomAppearances {
        get { self[AppearancesEnvironmentKey.self] }
        set { self[AppearancesEnvironmentKey.self] = newValue }
    }
}
