import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextSkeletonSize {
    static let `default` = TextSkeletonSizeDefault()

    static let all: [SkeletonSizeConfiguration] = [
        TextSkeletonSize.`default`,
    ] 
}
struct TextSkeletonSizeDefault: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonSize"
    }
}

struct TextSkeletonAnySize: SkeletonSizeConfiguration {

    init(size: SkeletonSizeConfiguration) {
    }
    var debugDescription: String {
        return "TextSkeletonAnySize"
    }
}
