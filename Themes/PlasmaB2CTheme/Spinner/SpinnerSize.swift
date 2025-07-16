import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SpinnerSize {
    static let l = SpinnerSizeL()
    static let m = SpinnerSizeM()
    static let s = SpinnerSizeS()
    static let scalable = SpinnerSizeScalable()
    static let xl = SpinnerSizeXl()
    static let xs = SpinnerSizeXs()
    static let xxl = SpinnerSizeXxl()
    static let xxs = SpinnerSizeXxs()

    static let all: [SpinnerSizeConfiguration] = [
        SpinnerSize.l,
        SpinnerSize.m,
        SpinnerSize.s,
        SpinnerSize.scalable,
        SpinnerSize.xl,
        SpinnerSize.xs,
        SpinnerSize.xxl,
        SpinnerSize.xxs,
    ] 
}
struct SpinnerSizeL: SpinnerSizeConfiguration {
    var padding = CGFloat(4.0)
    var size = CGFloat(56.0)
    public var debugDescription: String {
        return "SpinnerSize"
    }
}
struct SpinnerSizeM: SpinnerSizeConfiguration {
    var padding = CGFloat(4.0)
    var size = CGFloat(48.0)
    public var debugDescription: String {
        return "SpinnerSize"
    }
}
struct SpinnerSizeS: SpinnerSizeConfiguration {
    var padding = CGFloat(3.0)
    var size = CGFloat(36.0)
    public var debugDescription: String {
        return "SpinnerSize"
    }
}
struct SpinnerSizeScalable: SpinnerSizeConfiguration {
    var padding = CGFloat(0.0)
    var size = CGFloat(16.0)
    public var debugDescription: String {
        return "SpinnerSize"
    }
}
struct SpinnerSizeXl: SpinnerSizeConfiguration {
    var padding = CGFloat(6.0)
    var size = CGFloat(88.0)
    public var debugDescription: String {
        return "SpinnerSize"
    }
}
struct SpinnerSizeXs: SpinnerSizeConfiguration {
    var padding = CGFloat(2.0)
    var size = CGFloat(24.0)
    public var debugDescription: String {
        return "SpinnerSize"
    }
}
struct SpinnerSizeXxl: SpinnerSizeConfiguration {
    var padding = CGFloat(8.0)
    var size = CGFloat(128.0)
    public var debugDescription: String {
        return "SpinnerSize"
    }
}
struct SpinnerSizeXxs: SpinnerSizeConfiguration {
    var padding = CGFloat(1.0)
    var size = CGFloat(16.0)
    public var debugDescription: String {
        return "SpinnerSize"
    }
}

struct SpinnerAnySize: SpinnerSizeConfiguration {
    var padding = CGFloat(0)
    var size = CGFloat(0)

    init(size: SpinnerSizeConfiguration) {
        self.padding = size.padding
        self.size = size.size
    }
    var debugDescription: String {
        return "SpinnerAnySize"
    }
}
