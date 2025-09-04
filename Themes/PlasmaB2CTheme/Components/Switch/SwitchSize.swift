import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SwitchSize {
    static let l = SwitchSizeL()
    static let m = SwitchSizeM()
    static let s = SwitchSizeS()

    static let all: [SwitchSizeConfiguration] = [
        SwitchSize.l,
        SwitchSize.m,
        SwitchSize.s,
    ] 
}
struct SwitchSizeL: SwitchSizeConfiguration {
    var descriptionPadding = CGFloat(4.0)
    var textPadding = CGFloat(12.0)
    var toggleThumbHeight = CGFloat(24.0)
    var toggleThumbPadding = CGFloat(2.0)
    var toggleThumbPathDrawer = CircleDrawer() as PathDrawer
    var toggleThumbWidth = CGFloat(24.0)
    var toggleTrackHeight = CGFloat(28.0)
    var toggleTrackPathDrawer = CircleDrawer() as PathDrawer
    var toggleTrackWidth = CGFloat(44.0)
    var verticalGap = CGFloat(0)
    var width = CGFloat?(0)
    public var debugDescription: String {
        return "SwitchSize"
    }
}
struct SwitchSizeM: SwitchSizeConfiguration {
    var descriptionPadding = CGFloat(4.0)
    var textPadding = CGFloat(12.0)
    var toggleThumbHeight = CGFloat(24.0)
    var toggleThumbPadding = CGFloat(2.0)
    var toggleThumbPathDrawer = CircleDrawer() as PathDrawer
    var toggleThumbWidth = CGFloat(24.0)
    var toggleTrackHeight = CGFloat(28.0)
    var toggleTrackPathDrawer = CircleDrawer() as PathDrawer
    var toggleTrackWidth = CGFloat(44.0)
    var verticalGap = CGFloat(0)
    var width = CGFloat?(0)
    public var debugDescription: String {
        return "SwitchSize"
    }
}
struct SwitchSizeS: SwitchSizeConfiguration {
    var descriptionPadding = CGFloat(4.0)
    var textPadding = CGFloat(12.0)
    var toggleThumbHeight = CGFloat(24.0)
    var toggleThumbPadding = CGFloat(2.0)
    var toggleThumbPathDrawer = CircleDrawer() as PathDrawer
    var toggleThumbWidth = CGFloat(24.0)
    var toggleTrackHeight = CGFloat(28.0)
    var toggleTrackPathDrawer = CircleDrawer() as PathDrawer
    var toggleTrackWidth = CGFloat(44.0)
    var verticalGap = CGFloat(0)
    var width = CGFloat?(0)
    public var debugDescription: String {
        return "SwitchSize"
    }
}

struct SwitchAnySize: SwitchSizeConfiguration {
    var descriptionPadding = CGFloat(0)
    var textPadding = CGFloat(0)
    var toggleThumbHeight = CGFloat(0)
    var toggleThumbPadding = CGFloat(0)
    var toggleThumbPathDrawer = DefaultPathDrawer() as PathDrawer
    var toggleThumbWidth = CGFloat(0)
    var toggleTrackHeight = CGFloat(0)
    var toggleTrackPathDrawer = DefaultPathDrawer() as PathDrawer
    var toggleTrackWidth = CGFloat(0)
    var verticalGap = CGFloat(0)
    var width = CGFloat?(0)

    init(size: SwitchSizeConfiguration) {
        self.descriptionPadding = size.descriptionPadding
        self.textPadding = size.textPadding
        self.toggleThumbHeight = size.toggleThumbHeight
        self.toggleThumbPadding = size.toggleThumbPadding
        self.toggleThumbPathDrawer = size.toggleThumbPathDrawer
        self.toggleThumbWidth = size.toggleThumbWidth
        self.toggleTrackHeight = size.toggleTrackHeight
        self.toggleTrackPathDrawer = size.toggleTrackPathDrawer
        self.toggleTrackWidth = size.toggleTrackWidth
        self.verticalGap = size.verticalGap
        self.width = size.width
    }
    var debugDescription: String {
        return "SwitchAnySize"
    }
}
