import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextSkeletonDisplaySize {
    static let l = TextSkeletonDisplaySizeL()
    static let m = TextSkeletonDisplaySizeM()
    static let s = TextSkeletonDisplaySizeS()

    static let all: [SkeletonSizeConfiguration] = [
        TextSkeletonDisplaySize.l,
        TextSkeletonDisplaySize.m,
        TextSkeletonDisplaySize.s,
    ] 
}
struct TextSkeletonDisplaySizeL: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonDisplaySize"
    }
}
struct TextSkeletonDisplaySizeM: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonDisplaySize"
    }
}
struct TextSkeletonDisplaySizeS: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonDisplaySize"
    }
}

struct TextSkeletonDisplayAnySize: SkeletonSizeConfiguration {

    init(size: SkeletonSizeConfiguration) {
    }
    var debugDescription: String {
        return "TextSkeletonDisplayAnySize"
    }
}
