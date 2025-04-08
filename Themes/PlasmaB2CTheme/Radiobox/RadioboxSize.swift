import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct RadioboxSize {
    static let l = RadioboxSizeL()
    static let m = RadioboxSizeM()
    static let s = RadioboxSizeS()

    static let all: [SelectionControlSizeConfiguration] = [
        RadioboxSize.l,
        RadioboxSize.m,
        RadioboxSize.s,
    ] 
}
struct RadioboxSizeL: SelectionControlSizeConfiguration {
    var horizontalGap = CGFloat(12.0)
    var lineWidth = CGFloat(2.0)
    var pathDrawer = CircleDrawer() as PathDrawer
    var toggleCheckedIconHeight = CGFloat(10.0)
    var toggleCheckedIconWidth = CGFloat(10.0)
    var toggleHeight = CGFloat(22.0)
    var toggleIndeterminateIconHeight = CGFloat(0)
    var toggleIndeterminateIconWidth = CGFloat(0)
    var togglePaddings = CGFloat(1.0)
    var toggleWidth = CGFloat(22.0)
    var verticalGap = CGFloat(2.0)
    public var debugDescription: String {
        return "RadioboxSize"
    }
}
struct RadioboxSizeM: SelectionControlSizeConfiguration {
    var horizontalGap = CGFloat(10.0)
    var lineWidth = CGFloat(2.0)
    var pathDrawer = CircleDrawer() as PathDrawer
    var toggleCheckedIconHeight = CGFloat(10.0)
    var toggleCheckedIconWidth = CGFloat(10.0)
    var toggleHeight = CGFloat(22.0)
    var toggleIndeterminateIconHeight = CGFloat(0)
    var toggleIndeterminateIconWidth = CGFloat(0)
    var togglePaddings = CGFloat(1.0)
    var toggleWidth = CGFloat(22.0)
    var verticalGap = CGFloat(2.0)
    public var debugDescription: String {
        return "RadioboxSize"
    }
}
struct RadioboxSizeS: SelectionControlSizeConfiguration {
    var horizontalGap = CGFloat(8.0)
    var lineWidth = CGFloat(1.5)
    var pathDrawer = CircleDrawer() as PathDrawer
    var toggleCheckedIconHeight = CGFloat(8.0)
    var toggleCheckedIconWidth = CGFloat(8.0)
    var toggleHeight = CGFloat(16.0)
    var toggleIndeterminateIconHeight = CGFloat(0)
    var toggleIndeterminateIconWidth = CGFloat(0)
    var togglePaddings = CGFloat(1.0)
    var toggleWidth = CGFloat(16.0)
    var verticalGap = CGFloat(2.0)
    public var debugDescription: String {
        return "RadioboxSize"
    }
}

struct RadioboxAnySize: SelectionControlSizeConfiguration {
    var horizontalGap = CGFloat(0)
    var lineWidth = CGFloat(0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer
    var toggleCheckedIconHeight = CGFloat(0)
    var toggleCheckedIconWidth = CGFloat(0)
    var toggleHeight = CGFloat(0)
    var toggleIndeterminateIconHeight = CGFloat(0)
    var toggleIndeterminateIconWidth = CGFloat(0)
    var togglePaddings = CGFloat(0)
    var toggleWidth = CGFloat(0)
    var verticalGap = CGFloat(0)

    init(size: SelectionControlSizeConfiguration) {
        self.horizontalGap = size.horizontalGap
        self.lineWidth = size.lineWidth
        self.pathDrawer = size.pathDrawer
        self.toggleCheckedIconHeight = size.toggleCheckedIconHeight
        self.toggleCheckedIconWidth = size.toggleCheckedIconWidth
        self.toggleHeight = size.toggleHeight
        self.toggleIndeterminateIconHeight = size.toggleIndeterminateIconHeight
        self.toggleIndeterminateIconWidth = size.toggleIndeterminateIconWidth
        self.togglePaddings = size.togglePaddings
        self.toggleWidth = size.toggleWidth
        self.verticalGap = size.verticalGap
    }
    var debugDescription: String {
        return "RadioboxAnySize"
    }
}
