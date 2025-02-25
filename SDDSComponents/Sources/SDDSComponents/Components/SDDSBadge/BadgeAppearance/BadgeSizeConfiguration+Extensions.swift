import Foundation
import SwiftUI
import SDDSThemeCore

extension BadgeSizeConfiguration {
    func buttonSize(iconSize: CGSize, iconPadding: CGFloat) -> ButtonSizeConfiguration {
        var size = DefaultButtonSize()
        size.height = height
        size.cornerRadius = cornerRadius
        size.iconSize = iconSize
        size.iconHorizontalGap = iconPadding
        size.paddings = EdgeInsets(top: 0, leading: startPadding, bottom: 0, trailing: endPadding)
        return size
    }
}
