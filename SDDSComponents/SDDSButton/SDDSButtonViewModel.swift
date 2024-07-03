import Foundation
import SwiftUI
import Combine
import SDDSThemeCore

public enum Alignment {
    case left
    case right
}

public enum SpinnerStyle {
    case solid
    case transparent
}

public enum ButtonLayoutMode {
    case wrapContent
    case fixedWidth(ButtonContentAlignment)
    case square
    case circle
    
    var isCentered: Bool {
        switch self {
        case .wrapContent, .square, .circle:
            return false
        case .fixedWidth(let alignment):
            return alignment == .centered
        }
    }
    
    var isSideBySide: Bool {
        switch self {
        case .wrapContent, .square, .circle:
            return false
        case .fixedWidth(let alignment):
            return alignment == .sideBySide
        }
    }
}

public enum ButtonContentAlignment {
    case centered
    case sideBySide
}

public struct ButtonIconAttributes {
    public let image: Image
    public let alignment: Alignment
}

public struct ButtonStyle {
    public let titleTypography: TypographyToken
    public let titleColor: ColorToken
    public let subtitleTypography: TypographyToken
    public let subtitleColor: ColorToken
    public let iconColor: ColorToken
    public let spinnerColor: ColorToken
    public let backgroundColor: ColorToken
}

public final class SDDSButtonViewModel: ObservableObject {
    @Published public var title: String?
    @Published public var subtitle: String?
    @Published public var iconAttributes: ButtonIconAttributes?
    @Published public var size: ButtonSize
    @Published public var isDisabled: Bool
    @Published public var isLoading: Bool
    @Published public var spinnerImage: Image
    @Published public var spinnerStyle: SpinnerStyle
    @Published public var style: ButtonStyle
    @Published public var layoutMode: ButtonLayoutMode
     
    public var action: () -> Void
    
    public init(title: String?,
                subtitle: String? = nil,
                iconAttributes: ButtonIconAttributes? = nil,
                size: ButtonSize = .medium,
                isDisabled: Bool = false,
                isLoading: Bool = false,
                spinnerImage: Image = Image(systemName: "arrow.triangle.2.circlepath"),
                spinnerStyle: SpinnerStyle = .solid,
                style: ButtonStyle,
                layoutMode: ButtonLayoutMode = .wrapContent,
                action: @escaping () -> Void = {}) {
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.size = size
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.spinnerImage = spinnerImage
        self.spinnerStyle = spinnerStyle
        self.style = style
        self.layoutMode = layoutMode
        self.action = action
    }
    
    var backgroundOpacity: Double {
        isDisabled ? Opacity.fourty : 1.0
    }
    
    var contentOpacity: Double {
        if isLoading && spinnerStyle == .solid {
            0.0
        } else if spinnerStyle == .transparent {
            Opacity.twenty
        } else {
            1.0
        }
    }
        
    var isCentered: Bool {
        layoutMode.isCentered
    }
    
    var isOnlyTitleAndImage: Bool {
        layoutMode.isSideBySide && title != nil && subtitle == nil && iconAttributes != nil
    }
    
    var isSideBySide: Bool {
        layoutMode.isSideBySide && (subtitle != nil || iconAttributes != nil)
    }
    
    var isIconRightAligned: Bool {
        iconAttributes?.alignment == .right || (iconAttributes?.alignment == .left && isOnlyTitleAndImage)
    }
    
    var isEquilateral: Bool {
        switch layoutMode {
        case .wrapContent, .fixedWidth:
            false
        case .square, .circle:
            true
        }
    }
    
    var isCircle: Bool {
        switch layoutMode {
        case .circle:
            true
        case .fixedWidth, .wrapContent, .square:
            false
        }
    }
}
