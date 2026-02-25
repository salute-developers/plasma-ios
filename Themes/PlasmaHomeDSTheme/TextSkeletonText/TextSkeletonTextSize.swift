import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextSkeletonTextSize {
    static let l = TextSkeletonTextSizeL()
    static let m = TextSkeletonTextSizeM()
    static let s = TextSkeletonTextSizeS()
    static let xs = TextSkeletonTextSizeXs()

    static let all: [SkeletonSizeConfiguration] = [
        TextSkeletonTextSize.l,
        TextSkeletonTextSize.m,
        TextSkeletonTextSize.s,
        TextSkeletonTextSize.xs,
    ] 
}
struct TextSkeletonTextSizeL: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonTextSize"
    }
}
struct TextSkeletonTextSizeM: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonTextSize"
    }
}
struct TextSkeletonTextSizeS: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonTextSize"
    }
}
struct TextSkeletonTextSizeXs: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonTextSize"
    }
}

struct TextSkeletonTextAnySize: SkeletonSizeConfiguration {

    init(size: SkeletonSizeConfiguration) {
    }
    var debugDescription: String {
        return "TextSkeletonTextAnySize"
    }
}
