import Foundation
import SwiftUI

extension SDDSButton {
    func hasIconAttributes() -> Bool {
        return iconAttributes != nil
    }
    
    var backgroundOpacity: Double {
        isDisabled ? Opacity.fourty : 1.0
    }
    
    func backgroundColor(for colorScheme: ColorScheme) -> Color {
        appearance.backgroundColor.color(for: colorScheme).opacity(backgroundOpacity)
    }
    
    var contentOpacity: Double {
        if isLoading && spinnerStyle == .solid {
            0.0
        } else if spinnerStyle == .transparent {
            0.24
        } else {
            1.0
        }
    }
        
    var isCentered: Bool {
        layoutMode.isCentered
    }
    
    var isSideBySide: Bool {
        layoutMode.isSideBySide && (!subtitle.isEmpty || iconAttributes != nil)
    }
    
    var isEquilateral: Bool {
        switch buttonStyle {
        case .circle, .square:
            return true
        case .basic:
            return false
        }
    }
    
    var isCircle: Bool {
        switch buttonStyle {
        case .circle:
            return true
        case .basic, .square:
            return false
        }
    }
    
    func shouldShowRightAlignedIcon() -> Bool {
        return isIconRightAligned && hasIconAttributes()
    }

    func shouldShowLeftAlignedIcon() -> Bool {
        return !shouldShowRightAlignedIcon() && hasIconAttributes()
    }
        
    func hasTitleOrSubtitle() -> Bool {
        return !title.isEmpty || !subtitle.isEmpty
    }
    
    var isOnlyTitleAndImage: Bool {
        layoutMode.isSideBySide && !title.isEmpty && subtitle.isEmpty && iconAttributes != nil
    }
    
    var isIconRightAligned: Bool {
        iconAttributes?.alignment == .right || (iconAttributes?.alignment == .left && isOnlyTitleAndImage)
    }

    public var titleTypography: TypographyToken {
        if let typography = appearance.titleTypography.typography(with: size) {
            return typography
        } else {
            fatalError("Undefined Button Typography for size \(size.debugDescription).")
        }
    }
    
    public var subtitleTypography: TypographyToken {
        if let typography = appearance.subtitleTypography.typography(with: size) {
            return typography
        } else {
            fatalError("Undefined Button Typography for size \(size.debugDescription). Using a default value.")
        }
    }
}
