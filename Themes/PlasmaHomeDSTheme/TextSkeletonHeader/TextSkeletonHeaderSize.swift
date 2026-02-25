import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextSkeletonHeaderSize {
    static let h1 = TextSkeletonHeaderSizeH1()
    static let h2 = TextSkeletonHeaderSizeH2()
    static let h3 = TextSkeletonHeaderSizeH3()
    static let h4 = TextSkeletonHeaderSizeH4()
    static let h5 = TextSkeletonHeaderSizeH5()
    static let h6 = TextSkeletonHeaderSizeH6()

    static let all: [SkeletonSizeConfiguration] = [
        TextSkeletonHeaderSize.h1,
        TextSkeletonHeaderSize.h2,
        TextSkeletonHeaderSize.h3,
        TextSkeletonHeaderSize.h4,
        TextSkeletonHeaderSize.h5,
        TextSkeletonHeaderSize.h6,
    ] 
}
struct TextSkeletonHeaderSizeH1: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonHeaderSize"
    }
}
struct TextSkeletonHeaderSizeH2: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonHeaderSize"
    }
}
struct TextSkeletonHeaderSizeH3: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonHeaderSize"
    }
}
struct TextSkeletonHeaderSizeH4: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonHeaderSize"
    }
}
struct TextSkeletonHeaderSizeH5: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonHeaderSize"
    }
}
struct TextSkeletonHeaderSizeH6: SkeletonSizeConfiguration {
    public var debugDescription: String {
        return "TextSkeletonHeaderSize"
    }
}

struct TextSkeletonHeaderAnySize: SkeletonSizeConfiguration {

    init(size: SkeletonSizeConfiguration) {
    }
    var debugDescription: String {
        return "TextSkeletonHeaderAnySize"
    }
}
