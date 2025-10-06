import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SpinnerSize {
    static let m = SpinnerSizeM()
    static let s = SpinnerSizeS()
    static let scalable = SpinnerSizeScalable()
    static let xs = SpinnerSizeXs()
    static let xxs = SpinnerSizeXxs()

    static let all: [SpinnerSizeConfiguration] = [
        SpinnerSize.m,
        SpinnerSize.s,
        SpinnerSize.scalable,
        SpinnerSize.xs,
        SpinnerSize.xxs,
    ] 
}
struct SpinnerSizeM: SpinnerSizeConfiguration {
    var angle = CGFloat(360.0)
    var padding = CGFloat(4.0)
    var size = CGFloat(48.0)
    public var debugDescription: String {
        return "SpinnerSize"
    }
}
struct SpinnerSizeS: SpinnerSizeConfiguration {
    var angle = CGFloat(360.0)
    var padding = CGFloat(3.0)
    var size = CGFloat(36.0)
    public var debugDescription: String {
        return "SpinnerSize"
    }
}
struct SpinnerSizeScalable: SpinnerSizeConfiguration {
    var angle = CGFloat(360.0)
    var padding = CGFloat(0.0)
    var size = CGFloat(16.0)
    public var debugDescription: String {
        return "SpinnerSize"
    }
}
struct SpinnerSizeXs: SpinnerSizeConfiguration {
    var angle = CGFloat(360.0)
    var padding = CGFloat(2.0)
    var size = CGFloat(24.0)
    public var debugDescription: String {
        return "SpinnerSize"
    }
}
struct SpinnerSizeXxs: SpinnerSizeConfiguration {
    var angle = CGFloat(360.0)
    var padding = CGFloat(1.0)
    var size = CGFloat(16.0)
    public var debugDescription: String {
        return "SpinnerSize"
    }
}

struct SpinnerAnySize: SpinnerSizeConfiguration {
    var angle = CGFloat(0)
    var padding = CGFloat(0)
    var size = CGFloat(0)

    init(size: SpinnerSizeConfiguration) {
        self.angle = size.angle
        self.padding = size.padding
        self.size = size.size
    }
    var debugDescription: String {
        return "SpinnerAnySize"
    }
}
