
import SDDSComponents
import SDDSThemeCore
import Foundation
import SwiftUI

public enum TextAreaSize: String, CaseIterable, TextAreaSizeConfiguration {
    case extraSmall
    case large
    case medium
    case small
    
    public var cornerRadius: CGFloat {
        switch self {
        case .extraSmall:
            return ShapeToken.roundS.cornerRadius
        case .large:
            return ShapeToken.roundM.cornerRadius + 2.0
        case .medium:
            return ShapeToken.roundM.cornerRadius
        case .small:
            return ShapeToken.roundM.cornerRadius - 2.0
        }
    }
    
    public var titleBottomPadding: CGFloat {
        switch self {
        case .extraSmall:
            return 6
        case .large:
            return 12
        case .medium:
            return 10
        case .small:
            return 8
        }
    }
    
    public var titleInnerPadding: CGFloat {
        switch self {
        case .extraSmall:
            return 0
        case .large:
            return 2
        case .medium:
            return 2
        case .small:
            return 0
        }
    }
        
    public var boxLeadingPadding: CGFloat {
        switch self {
        case .extraSmall:
            return 8
        case .large:
            return 16
        case .medium:
            return 14
        case .small:
            return 12
        }
    }
    
    public var boxTrailingPadding: CGFloat {
        switch self {
        case .extraSmall:
            return 8
        case .large:
            return 16
        case .medium:
            return 14
        case .small:
            return 12
        }
    }
    
    public var iconActionClearTrailingPadding: CGFloat {
        0
    }
    
    public var captionTopPadding: CGFloat {
        switch self {
        case .extraSmall:
            return 8
        case .large:
            return 12
        case .medium:
            return 12
        case .small:
            return 12
        }
    }
    
    public var captionBottomPadding: CGFloat {
        switch self {
        case .extraSmall:
            return 8
        case .large:
            return 12
        case .medium:
            return 12
        case .small:
            return 12
        }
    }
    
    public var optionalPadding: CGFloat {
        switch self {
        case .extraSmall:
            return 4
        case .large:
            return 4
        case .medium:
            return 4
        case .small:
            return 4
        }
    }
    
    public var iconPadding: CGFloat {
        switch self {
        case .extraSmall:
            return 4
        case .large:
            return 8
        case .medium:
            return 6
        case .small:
            return 4
        }
    }
    
    public var iconActionPadding: CGFloat {
        switch self {
        case .extraSmall:
            return 4
        case .large:
            return 10
        case .medium:
            return 8
        case .small:
            return 6
        }
    }
    
    public var fieldHeight: CGFloat {
        switch self {
        case .extraSmall:
            return 32
        case .large:
            return 56
        case .medium:
            return 48
        case .small:
            return 40
        }
    }
    
    public var iconSize: CGSize {
        switch self {
        case .extraSmall:
            return CGSize(width: 16, height: 16)
        case .large:
            return CGSize(width: 24, height: 24)
        case .medium:
            return CGSize(width: 24, height: 24)
        case .small:
            return CGSize(width: 24, height: 24)
        }
    }
    
    public var iconActionSize: CGSize {
        switch self {
        case .extraSmall:
            return CGSize(width: 16, height: 16)
        case .large:
            return CGSize(width: 24, height: 24)
        case .medium:
            return CGSize(width: 24, height: 24)
        case .small:
            return CGSize(width: 24, height: 24)
        }
    }
    
    public var chipsPadding: CGFloat {
        switch self {
        case .extraSmall:
            return 6
        case .large:
            return 6
        case .medium:
            return 6
        case .small:
            return 6
        }
    }
    
    public var chipContainerHorizontalPadding: CGFloat {
        switch self {
        case .extraSmall:
            return 6
        case .large:
            return 6
        case .medium:
            return 6
        case .small:
            return 6
        }
    }
    
    public func boxPaddingBottom(labelPlacement: TextAreaLabelPlacement) -> CGFloat {
        switch self {
        case .extraSmall:
            switch labelPlacement {
            case .inner:
                return 8
            case .outer:
                return 8
            case .none:
                return 8
            }
        case .large:
            switch labelPlacement {
            case .inner:
                return 12
            case .outer:
                return 12
            case .none:
                return 12
            }
        case .medium:
            switch labelPlacement {
            case .inner:
                return 12
            case .outer:
                return 12
            case .none:
                return 12
            }
        case .small:
            switch labelPlacement {
            case .inner:
                return 12
            case .outer:
                return 12
            case .none:
                return 12
            }
        }
    }
    
    public func boxPaddingTop(labelPlacement: TextAreaLabelPlacement) -> CGFloat {
        switch self {
        case .extraSmall:
            switch labelPlacement {
            case .inner:
                return 8
            case .outer:
                return 8
            case .none:
                return 8
            }
        case .large:
            switch labelPlacement {
            case .inner:
                return 9
            case .outer:
                return 16
            case .none:
                return 16
            }
        case .medium:
            switch labelPlacement {
            case .inner:
                return 6
            case .outer:
                return 12
            case .none:
                return 12
            }
        case .small:
            switch labelPlacement {
            case .inner:
                return 4
            case .outer:
                return 8
            case .none:
                return 8
            }
        }
    }
    
    public func indicatorOffset(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement) -> CGPoint {
        switch labelPlacement {
        case .none:
            switch requiredPlacement {
            case .left:
                switch self {
                case .extraSmall:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                case .large:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                case .medium:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                case .small:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                }
            case .right:
                switch self {
                case .extraSmall:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                case .large:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                case .medium:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                case .small:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                }
            }
        case .inner:
            switch requiredPlacement {
            case .left:
                switch self {
                case .extraSmall:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                case .large:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                case .medium:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                case .small:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                }
            case .right:
                switch self {
                case .extraSmall:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                case .large:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                case .medium:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                case .small:
                    return CGPoint(
                        x: 0,
                        y: 0
                    )
                }
            }
        case .outer:
            switch requiredPlacement {
            case .left:
                switch self {
                case .extraSmall:
                    return CGPoint(
                        x: 4,
                        y: 4
                    )
                case .large:
                    return CGPoint(
                        x: 6,
                        y: 8
                    )
                case .medium:
                    return CGPoint(
                        x: 6,
                        y: 7
                    )
                case .small:
                    return CGPoint(
                        x: 4,
                        y: 6
                    )
                }
            case .right:
                switch self {
                case .extraSmall:
                    return CGPoint(
                        x: 4,
                        y: 2
                    )
                case .large:
                    return CGPoint(
                        x: 4,
                        y: 4
                    )
                case .medium:
                    return CGPoint(
                        x: 4,
                        y: 4
                    )
                case .small:
                    return CGPoint(
                        x: 4,
                        y: 4
                    )
                }
            }
        }
    }
        
    public func indicatorSize(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement) -> CGSize {
        switch labelPlacement {
        case .none:
            switch requiredPlacement {
            case .left:
                switch self {
                case .extraSmall:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                case .large:
                    return CGSize(
                        width: 8,
                        height: 8
                    )
                case .medium:
                    return CGSize(
                        width: 8,
                        height: 8
                    )
                case .small:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                }
            case .right:
                switch self {
                case .extraSmall:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                case .large:
                    return CGSize(
                        width: 8,
                        height: 8
                    )
                case .medium:
                    return CGSize(
                        width: 8,
                        height: 8
                    )
                case .small:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                }
            }
        case .inner:
            switch requiredPlacement {
            case .left:
                switch self {
                case .extraSmall:
                    return CGSize(
                        width: 0,
                        height: 0
                    )
                case .large:
                    return CGSize(
                        width: 8,
                        height: 8
                    )
                case .medium:
                    return CGSize(
                        width: 8,
                        height: 8
                    )
                case .small:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                }
            case .right:
                switch self {
                case .extraSmall:
                    return CGSize(
                        width: 0,
                        height: 0
                    )
                case .large:
                    return CGSize(
                        width: 8,
                        height: 8
                    )
                case .medium:
                    return CGSize(
                        width: 8,
                        height: 8
                    )
                case .small:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                }
            }
        case .outer:
            switch requiredPlacement {
            case .left:
                switch self {
                case .extraSmall:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                case .large:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                case .medium:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                case .small:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                }
            case .right:
                switch self {
                case .extraSmall:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                case .large:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                case .medium:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                case .small:
                    return CGSize(
                        width: 6,
                        height: 6
                    )
                }
            }
        }
    }
    
    public var lineWidth: CGFloat {
        1
    }
    
    public var debugDescription: String {
        return "TextAreaSize"
    }
        
}
