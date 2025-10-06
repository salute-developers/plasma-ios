import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct LoaderSize {
    static let `default` = LoaderSizeDefault()

    static let all: [LoaderSizeConfiguration] = [
        LoaderSize.`default`,
    ] 
}
struct LoaderSizeDefault: LoaderSizeConfiguration {
    public var debugDescription: String {
        return "LoaderSize"
    }
}

struct LoaderAnySize: LoaderSizeConfiguration {

    init(size: LoaderSizeConfiguration) {
    }
    var debugDescription: String {
        return "LoaderAnySize"
    }
}
