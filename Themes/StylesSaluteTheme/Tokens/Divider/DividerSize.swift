import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DividerSize {
    static let `default` = DividerSizeDefault()

    static let all: [DividerSizeConfiguration] = [
        DividerSize.`default`,
    ] 
}
struct DividerSizeDefault: DividerSizeConfiguration {
    public var debugDescription: String {
        return "DividerSize"
    }
}

struct DividerAnySize: DividerSizeConfiguration {

    init(size: DividerSizeConfiguration) {
    }
    var debugDescription: String {
        return "DividerAnySize"
    }
}
