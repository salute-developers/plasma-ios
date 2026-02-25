import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct OverlaySize {
    static let `default` = OverlaySizeDefault()
    static let directionBottom = OverlaySizeDirectionbottom()
    static let directionTop = OverlaySizeDirectiontop()

    static let all: [OverlaySizeConfiguration] = [
        OverlaySize.`default`,
        OverlaySize.directionBottom,
        OverlaySize.directionTop,
    ] 
}
struct OverlaySizeDefault: OverlaySizeConfiguration {
    public var debugDescription: String {
        return "OverlaySize"
    }
}
struct OverlaySizeDirectionbottom: OverlaySizeConfiguration {
    public var debugDescription: String {
        return "OverlaySize"
    }
}
struct OverlaySizeDirectiontop: OverlaySizeConfiguration {
    public var debugDescription: String {
        return "OverlaySize"
    }
}

struct OverlayAnySize: OverlaySizeConfiguration {

    init(size: OverlaySizeConfiguration) {
    }
    var debugDescription: String {
        return "OverlayAnySize"
    }
}
