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
    var height = CGFloat(24.0)
    var horizontalGap = CGFloat(12.0)
    var lineWidth = CGFloat(2.0)
    var toggleCheckedIconHeight = CGFloat(10.0)
    var toggleCheckedIconWidth = CGFloat(10.0)
    var toggleIndeterminateIconHeight = CGFloat(0)
    var toggleIndeterminateIconWidth = CGFloat(0)
    var togglePaddings = CGFloat(1.0)
    var togglePathDrawer = CircleDrawer() as PathDrawer
    var verticalGap = CGFloat(2.0)
    var width = CGFloat(24.0)
    public var debugDescription: String {
        return "RadioboxSize"
    }
}
struct RadioboxSizeM: SelectionControlSizeConfiguration {
    var height = CGFloat(24.0)
    var horizontalGap = CGFloat(10.0)
    var lineWidth = CGFloat(2.0)
    var toggleCheckedIconHeight = CGFloat(10.0)
    var toggleCheckedIconWidth = CGFloat(10.0)
    var toggleIndeterminateIconHeight = CGFloat(0)
    var toggleIndeterminateIconWidth = CGFloat(0)
    var togglePaddings = CGFloat(1.0)
    var togglePathDrawer = CircleDrawer() as PathDrawer
    var verticalGap = CGFloat(2.0)
    var width = CGFloat(24.0)
    public var debugDescription: String {
        return "RadioboxSize"
    }
}
struct RadioboxSizeS: SelectionControlSizeConfiguration {
    var height = CGFloat(18.0)
    var horizontalGap = CGFloat(8.0)
    var lineWidth = CGFloat(1.5)
    var toggleCheckedIconHeight = CGFloat(8.0)
    var toggleCheckedIconWidth = CGFloat(8.0)
    var toggleIndeterminateIconHeight = CGFloat(0)
    var toggleIndeterminateIconWidth = CGFloat(0)
    var togglePaddings = CGFloat(1.0)
    var togglePathDrawer = CircleDrawer() as PathDrawer
    var verticalGap = CGFloat(2.0)
    var width = CGFloat(18.0)
    public var debugDescription: String {
        return "RadioboxSize"
    }
}

struct RadioboxAnySize: SelectionControlSizeConfiguration {
    var height = CGFloat(0)
    var horizontalGap = CGFloat(0)
    var lineWidth = CGFloat(0)
    var toggleCheckedIconHeight = CGFloat(0)
    var toggleCheckedIconWidth = CGFloat(0)
    var toggleIndeterminateIconHeight = CGFloat(0)
    var toggleIndeterminateIconWidth = CGFloat(0)
    var togglePaddings = CGFloat(0)
    var togglePathDrawer = DefaultPathDrawer() as PathDrawer
    var verticalGap = CGFloat(0)
    var width = CGFloat(0)

    init(size: SelectionControlSizeConfiguration) {
        self.height = size.height
        self.horizontalGap = size.horizontalGap
        self.lineWidth = size.lineWidth
        self.toggleCheckedIconHeight = size.toggleCheckedIconHeight
        self.toggleCheckedIconWidth = size.toggleCheckedIconWidth
        self.toggleIndeterminateIconHeight = size.toggleIndeterminateIconHeight
        self.toggleIndeterminateIconWidth = size.toggleIndeterminateIconWidth
        self.togglePaddings = size.togglePaddings
        self.togglePathDrawer = size.togglePathDrawer
        self.verticalGap = size.verticalGap
        self.width = size.width
    }
    var debugDescription: String {
        return "RadioboxAnySize"
    }
}
