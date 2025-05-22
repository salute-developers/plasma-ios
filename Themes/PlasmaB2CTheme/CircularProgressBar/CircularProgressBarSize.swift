import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CircularProgressBarSize {
    static let l = CircularProgressBarSizeL()
    static let m = CircularProgressBarSizeM()
    static let s = CircularProgressBarSizeS()
    static let xl = CircularProgressBarSizeXl()
    static let xs = CircularProgressBarSizeXs()
    static let xxl = CircularProgressBarSizeXxl()
    static let xxs = CircularProgressBarSizeXxs()

    static let all: [CircularProgressBarSizeConfiguration] = [
        CircularProgressBarSize.l,
        CircularProgressBarSize.m,
        CircularProgressBarSize.s,
        CircularProgressBarSize.xl,
        CircularProgressBarSize.xs,
        CircularProgressBarSize.xxl,
        CircularProgressBarSize.xxs,
    ] 
}
struct CircularProgressBarSizeL: CircularProgressBarSizeConfiguration {
    var height = CGFloat(56.0)
    var progressThickness = CGFloat(2.0)
    var trackThickness = CGFloat(2.0)
    var width = CGFloat(56.0)
    public var debugDescription: String {
        return "CircularProgressBarSize"
    }
}
struct CircularProgressBarSizeM: CircularProgressBarSizeConfiguration {
    var height = CGFloat(48.0)
    var progressThickness = CGFloat(2.0)
    var trackThickness = CGFloat(2.0)
    var width = CGFloat(48.0)
    public var debugDescription: String {
        return "CircularProgressBarSize"
    }
}
struct CircularProgressBarSizeS: CircularProgressBarSizeConfiguration {
    var height = CGFloat(36.0)
    var progressThickness = CGFloat(2.0)
    var trackThickness = CGFloat(2.0)
    var width = CGFloat(36.0)
    public var debugDescription: String {
        return "CircularProgressBarSize"
    }
}
struct CircularProgressBarSizeXl: CircularProgressBarSizeConfiguration {
    var height = CGFloat(88.0)
    var progressThickness = CGFloat(4.0)
    var trackThickness = CGFloat(4.0)
    var width = CGFloat(88.0)
    public var debugDescription: String {
        return "CircularProgressBarSize"
    }
}
struct CircularProgressBarSizeXs: CircularProgressBarSizeConfiguration {
    var height = CGFloat(24.0)
    var progressThickness = CGFloat(2.0)
    var trackThickness = CGFloat(2.0)
    var width = CGFloat(24.0)
    public var debugDescription: String {
        return "CircularProgressBarSize"
    }
}
struct CircularProgressBarSizeXxl: CircularProgressBarSizeConfiguration {
    var height = CGFloat(128.0)
    var progressThickness = CGFloat(4.0)
    var trackThickness = CGFloat(4.0)
    var width = CGFloat(128.0)
    public var debugDescription: String {
        return "CircularProgressBarSize"
    }
}
struct CircularProgressBarSizeXxs: CircularProgressBarSizeConfiguration {
    var height = CGFloat(16.0)
    var progressThickness = CGFloat(2.0)
    var trackThickness = CGFloat(2.0)
    var width = CGFloat(16.0)
    public var debugDescription: String {
        return "CircularProgressBarSize"
    }
}

struct CircularProgressBarAnySize: CircularProgressBarSizeConfiguration {
    var height = CGFloat(0)
    var progressThickness = CGFloat(0)
    var trackThickness = CGFloat(0)
    var width = CGFloat(0)

    init(size: CircularProgressBarSizeConfiguration) {
        self.height = size.height
        self.progressThickness = size.progressThickness
        self.trackThickness = size.trackThickness
        self.width = size.width
    }
    var debugDescription: String {
        return "CircularProgressBarAnySize"
    }
}
