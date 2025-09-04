import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CheckboxSize {
    static let m = CheckboxSizeM()
    static let s = CheckboxSizeS()

    static let all: [SelectionControlSizeConfiguration] = [
        CheckboxSize.m,
        CheckboxSize.s,
    ] 
}
struct CheckboxSizeM: SelectionControlSizeConfiguration {
    var height = CGFloat(24.0)
    var horizontalGap = CGFloat(12.0)
    var lineWidth = CGFloat(2.0)
    var toggleCheckedIconHeight = CGFloat(6.0)
    var toggleCheckedIconWidth = CGFloat(9.0)
    var toggleIndeterminateIconHeight = CGFloat(2.0)
    var toggleIndeterminateIconWidth = CGFloat(12.0)
    var togglePaddings = CGFloat(2.0)
    var togglePathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer
    var verticalGap = CGFloat(2.0)
    var width = CGFloat(24.0)
    public var debugDescription: String {
        return "CheckboxSize"
    }
}
struct CheckboxSizeS: SelectionControlSizeConfiguration {
    var height = CGFloat(16.0)
    var horizontalGap = CGFloat(8.0)
    var lineWidth = CGFloat(1.5)
    var toggleCheckedIconHeight = CGFloat(4.0)
    var toggleCheckedIconWidth = CGFloat(6.0)
    var toggleIndeterminateIconHeight = CGFloat(2.0)
    var toggleIndeterminateIconWidth = CGFloat(8.0)
    var togglePaddings = CGFloat(1.0)
    var togglePathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer
    var verticalGap = CGFloat(2.0)
    var width = CGFloat(16.0)
    public var debugDescription: String {
        return "CheckboxSize"
    }
}

struct CheckboxAnySize: SelectionControlSizeConfiguration {
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
        return "CheckboxAnySize"
    }
}
