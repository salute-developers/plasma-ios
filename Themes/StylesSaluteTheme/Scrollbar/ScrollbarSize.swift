import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ScrollbarSize {
    static let m = ScrollbarSizeM()
    static let s = ScrollbarSizeS()

    static let all: [ScrollbarSizeConfiguration] = [
        ScrollbarSize.m,
        ScrollbarSize.s,
    ] 
}
struct ScrollbarSizeM: ScrollbarSizeConfiguration {
    var hoverExpandFactor = CGFloat(2.0)
    var shape = CircleDrawer() as PathDrawer
    var width = CGFloat(4.0)
    public var debugDescription: String {
        return "ScrollbarSize"
    }
}
struct ScrollbarSizeS: ScrollbarSizeConfiguration {
    var hoverExpandFactor = CGFloat(2.0)
    var shape = CircleDrawer() as PathDrawer
    var width = CGFloat(2.0)
    public var debugDescription: String {
        return "ScrollbarSize"
    }
}

struct ScrollbarAnySize: ScrollbarSizeConfiguration {
    var hoverExpandFactor = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer
    var width = CGFloat(0)

    init(size: ScrollbarSizeConfiguration) {
        self.hoverExpandFactor = size.hoverExpandFactor
        self.shape = size.shape
        self.width = size.width
    }
    var debugDescription: String {
        return "ScrollbarAnySize"
    }
}
