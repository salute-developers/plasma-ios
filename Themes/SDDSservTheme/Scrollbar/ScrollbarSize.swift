import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ScrollBarSize {
    static let m = ScrollBarSizeM()
    static let s = ScrollBarSizeS()

    static let all: [ScrollbarSizeConfiguration] = [
        ScrollBarSize.m,
        ScrollBarSize.s,
    ] 
}
struct ScrollBarSizeM: ScrollbarSizeConfiguration {
    var hoverExpandFactor = CGFloat(2.0)
    var shape = CircleDrawer() as PathDrawer
    var width = CGFloat(4.0)
    public var debugDescription: String {
        return "ScrollBarSize"
    }
}
struct ScrollBarSizeS: ScrollbarSizeConfiguration {
    var hoverExpandFactor = CGFloat(2.0)
    var shape = CircleDrawer() as PathDrawer
    var width = CGFloat(2.0)
    public var debugDescription: String {
        return "ScrollBarSize"
    }
}

struct ScrollBarAnySize: ScrollbarSizeConfiguration {
    var hoverExpandFactor = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer
    var width = CGFloat(0)

    init(size: ScrollbarSizeConfiguration) {
        self.hoverExpandFactor = size.hoverExpandFactor
        self.shape = size.shape
        self.width = size.width
    }
    var debugDescription: String {
        return "ScrollBarAnySize"
    }
}
