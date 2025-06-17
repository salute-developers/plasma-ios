import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct RectSkeletonSize {
    static let `default` = RectSkeletonSizeDefault()

    static let all: [SkeletonSizeConfiguration] = [
        RectSkeletonSize.`default`,
    ] 
}
struct RectSkeletonSizeDefault: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "RectSkeletonSize"
    }
}

struct RectSkeletonAnySize: SkeletonSizeConfiguration {

    init(size: SkeletonSizeConfiguration) {
    }
    var debugDescription: String {
        return "RectSkeletonAnySize"
    }
}
