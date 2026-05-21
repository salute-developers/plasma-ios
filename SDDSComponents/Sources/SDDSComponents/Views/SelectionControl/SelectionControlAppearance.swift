import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public protocol SelectionControlAppearance {
    var size: SelectionControlSizeConfiguration { get }
    var titleTypography: TypographyConfiguration { get }
    var subtitleTypography: TypographyConfiguration { get }
    var titleColor: StatefulFillStyle { get }
    var subtitleColor: StatefulFillStyle { get }
    var disabledAlpha: CGFloat { get }
    @available(*, deprecated, message: "use toggleColor instead")
    var color: StatefulFillStyle { get }
    var toggleColor: StatefulFillStyle { get }
    var borderColor: StatefulFillStyle { get }
    var checkedIcon: PathDrawer? { get }
    var checkedIconColor: StatefulFillStyle { get }
    var toggleColorChecked: StatefulFillStyle { get }
    var toggleColorIndeterminate: StatefulFillStyle { get }
    var toggleIndeterminateIcon: PathDrawer? { get }
    var toggleIndeterminateIconColor: StatefulFillStyle { get }
    
    func titleColor(for isEnabled: Bool) -> FillStyle
    func subtitleColor(for isEnabled: Bool) -> FillStyle
    var toggleStatefulColor: StatefulFillStyle { get }
}

public extension SelectionControlAppearance {
    func titleColor(for isEnabled: Bool) -> FillStyle {
        let fillStyle = titleColor.resolvedDefaultValue()
        guard !isEnabled else { return fillStyle }
        return fillStyle.withOpacity(disabledAlpha)
    }

    func subtitleColor(for isEnabled: Bool) -> FillStyle {
        let fillStyle = subtitleColor.resolvedDefaultValue()
        guard !isEnabled else { return fillStyle }
        return fillStyle.withOpacity(disabledAlpha)
    }

    var toggleStatefulColor: StatefulFillStyle {
        toggleColor
    }
}
