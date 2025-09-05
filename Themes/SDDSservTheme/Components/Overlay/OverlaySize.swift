import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct OverlaySize {
    static let `default` = OverlaySizeDefault()

    static let all: [OverlaySizeConfiguration] = [
        OverlaySize.`default`,
    ] 
}
struct OverlaySizeDefault: OverlaySizeConfiguration {
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
