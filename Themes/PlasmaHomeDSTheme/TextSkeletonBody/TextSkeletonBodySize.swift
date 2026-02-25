import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextSkeletonBodySize {
    static let l = TextSkeletonBodySizeL()
    static let m = TextSkeletonBodySizeM()
    static let s = TextSkeletonBodySizeS()
    static let xs = TextSkeletonBodySizeXs()
    static let xxs = TextSkeletonBodySizeXxs()

    static let all: [SkeletonSizeConfiguration] = [
        TextSkeletonBodySize.l,
        TextSkeletonBodySize.m,
        TextSkeletonBodySize.s,
        TextSkeletonBodySize.xs,
        TextSkeletonBodySize.xxs,
    ] 
}
struct TextSkeletonBodySizeL: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonBodySize"
    }
}
struct TextSkeletonBodySizeM: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonBodySize"
    }
}
struct TextSkeletonBodySizeS: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonBodySize"
    }
}
struct TextSkeletonBodySizeXs: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonBodySize"
    }
}
struct TextSkeletonBodySizeXxs: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonBodySize"
    }
}

struct TextSkeletonBodyAnySize: SkeletonSizeConfiguration {

    init(size: SkeletonSizeConfiguration) {
    }
    var debugDescription: String {
        return "TextSkeletonBodyAnySize"
    }
}
