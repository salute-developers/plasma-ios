import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ImageSize {
    static let ratio_16_9 = ImageSizeRatio_16_9()
    static let ratio_1_1 = ImageSizeRatio_1_1()
    static let ratio_1_2 = ImageSizeRatio_1_2()
    static let ratio_2_1 = ImageSizeRatio_2_1()
    static let ratio_3_4 = ImageSizeRatio_3_4()
    static let ratio_4_3 = ImageSizeRatio_4_3()
    static let ratio_9_16 = ImageSizeRatio_9_16()

    static let all: [ImageSizeConfiguration] = [
        ImageSize.ratio_16_9,
        ImageSize.ratio_1_1,
        ImageSize.ratio_1_2,
        ImageSize.ratio_2_1,
        ImageSize.ratio_3_4,
        ImageSize.ratio_4_3,
        ImageSize.ratio_9_16,
    ] 
}
struct ImageSizeRatio_16_9: ImageSizeConfiguration {
    var ratioHeight = CGFloat(9.0)
    var ratioWidth = CGFloat(16.0)
    public var debugDescription: String {
        return "ImageSize"
    }
}
struct ImageSizeRatio_1_1: ImageSizeConfiguration {
    var ratioHeight = CGFloat(1.0)
    var ratioWidth = CGFloat(1.0)
    public var debugDescription: String {
        return "ImageSize"
    }
}
struct ImageSizeRatio_1_2: ImageSizeConfiguration {
    var ratioHeight = CGFloat(2.0)
    var ratioWidth = CGFloat(1.0)
    public var debugDescription: String {
        return "ImageSize"
    }
}
struct ImageSizeRatio_2_1: ImageSizeConfiguration {
    var ratioHeight = CGFloat(1.0)
    var ratioWidth = CGFloat(2.0)
    public var debugDescription: String {
        return "ImageSize"
    }
}
struct ImageSizeRatio_3_4: ImageSizeConfiguration {
    var ratioHeight = CGFloat(4.0)
    var ratioWidth = CGFloat(3.0)
    public var debugDescription: String {
        return "ImageSize"
    }
}
struct ImageSizeRatio_4_3: ImageSizeConfiguration {
    var ratioHeight = CGFloat(3.0)
    var ratioWidth = CGFloat(4.0)
    public var debugDescription: String {
        return "ImageSize"
    }
}
struct ImageSizeRatio_9_16: ImageSizeConfiguration {
    var ratioHeight = CGFloat(16.0)
    var ratioWidth = CGFloat(9.0)
    public var debugDescription: String {
        return "ImageSize"
    }
}

struct ImageAnySize: ImageSizeConfiguration {
    var ratioHeight = CGFloat(0)
    var ratioWidth = CGFloat(0)

    init(size: ImageSizeConfiguration) {
        self.ratioHeight = size.ratioHeight
        self.ratioWidth = size.ratioWidth
    }
    var debugDescription: String {
        return "ImageAnySize"
    }
}
