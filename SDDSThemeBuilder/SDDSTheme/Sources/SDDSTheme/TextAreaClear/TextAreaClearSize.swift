
import SDDSComponents
import SDDSThemeCore
import Foundation
import SwiftUI

public enum TextAreaClearSize: String, TextAreaClearSizeConfiguration {
    case extraSmall
    case large
    case medium
    case small
    
    public var cornerRadius: CGFloat {
        0
    }
    
    public var titleBottomPadding: CGFloat {
        switch self {
        case .extraSmall:
            return 2
        case .large:
            return 4
        case .medium:
            return 4
        case .small:
            return 4
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
            return 0
        case .large:
            return 0
        case .medium:
            return 0
        case .small:
            return 0
        }
    }
    
    public var boxTrailingPadding: CGFloat {
        switch self {
        case .extraSmall:
            return 0
        case .large:
            return 0
        case .medium:
            return 0
        case .small:
            return 0
        }
    }
    
    public var iconActionClearTrailingPadding: CGFloat {
        0
    }
    
    public var captionTopPadding: CGFloat {
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
    
    public var captionBottomPadding: CGFloat {
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
    
    public func boxPaddingBottom(labelPlacement: TextAreaClearLabelPlacement, requiredPlacement: TextAreaClearRequiredPlacement) -> CGFloat {
        switch labelPlacement {
        case .none:
            switch requiredPlacement {
            case .left:
                switch self {
                case .extraSmall:
                    return 0
                case .large:
                    return 0
                case .medium:
                    return 0
                case .small:
                    return 0
                }
            case .right:
                switch self {
                case .extraSmall:
                    return 0
                case .large:
                    return 0
                case .medium:
                    return 0
                case .small:
                    return 0
                }
            }
        case .inner:
            switch requiredPlacement {
            case .left:
                switch self {
                case .extraSmall:
                    return 0
                case .large:
                    return 0
                case .medium:
                    return 0
                case .small:
                    return 0
                }
            case .right:
                switch self {
                case .extraSmall:
                    return 0
                case .large:
                    return 0
                case .medium:
                    return 0
                case .small:
                    return 0
                }
            }
        case .outer:
            switch requiredPlacement {
            case .left:
                switch self {
                case .extraSmall:
                    return 0
                case .large:
                    return 0
                case .medium:
                    return 0
                case .small:
                    return 0
                }
            case .right:
                switch self {
                case .extraSmall:
                    return 0
                case .large:
                    return 0
                case .medium:
                    return 0
                case .small:
                    return 0
                }
            }
        }
    }
    
    public func boxPaddingTop(labelPlacement: TextAreaClearLabelPlacement, requiredPlacement: TextAreaClearRequiredPlacement) -> CGFloat {
        switch labelPlacement {
        case .none:
            switch requiredPlacement {
            case .left:
                switch self {
                case .extraSmall:
                    return 0
                case .large:
                    return 0
                case .medium:
                    return 0
                case .small:
                    return 0
                }
            case .right:
                switch self {
                case .extraSmall:
                    return 0
                case .large:
                    return 0
                case .medium:
                    return 0
                case .small:
                    return 0
                }
            }
        case .inner:
            switch requiredPlacement {
            case .left:
                switch self {
                case .extraSmall:
                    return 0
                case .large:
                    return 0
                case .medium:
                    return 0
                case .small:
                    return 0
                }
            case .right:
                switch self {
                case .extraSmall:
                    return 0
                case .large:
                    return 0
                case .medium:
                    return 0
                case .small:
                    return 0
                }
            }
        case .outer:
            switch requiredPlacement {
            case .left:
                switch self {
                case .extraSmall:
                    return 0
                case .large:
                    return 0
                case .medium:
                    return 0
                case .small:
                    return 0
                }
            case .right:
                switch self {
                case .extraSmall:
                    return 0
                case .large:
                    return 0
                case .medium:
                    return 0
                case .small:
                    return 0
                }
            }
        }
    }
    
    public func indicatorOffset(labelPlacement: TextAreaClearLabelPlacement, requiredPlacement: TextAreaClearRequiredPlacement) -> CGPoint {
        switch labelPlacement {
        case .none:
            switch requiredPlacement {
            case .left:
                switch self {
                case .extraSmall:
                    return CGPoint(
                        x: 4,
                        y: 13
                    )
                case .large:
                    return CGPoint(
                        x: 6,
                        y: 24
                    )
                case .medium:
                    return CGPoint(
                        x: 6,
                        y: 20
                    )
                case .small:
                    return CGPoint(
                        x: 6,
                        y: 17
                    )
                }
            case .right:
                switch self {
                case .extraSmall:
                    return CGPoint(
                        x: 4,
                        y: 13
                    )
                case .large:
                    return CGPoint(
                        x: 6,
                        y: 24
                    )
                case .medium:
                    return CGPoint(
                        x: 6,
                        y: 20
                    )
                case .small:
                    return CGPoint(
                        x: 6,
                        y: 17
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
                        x: 6,
                        y: 24
                    )
                case .medium:
                    return CGPoint(
                        x: 6,
                        y: 20
                    )
                case .small:
                    return CGPoint(
                        x: 6,
                        y: 17
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
                        x: 6,
                        y: 24
                    )
                case .medium:
                    return CGPoint(
                        x: 6,
                        y: 20
                    )
                case .small:
                    return CGPoint(
                        x: 6,
                        y: 17
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
        
    public func indicatorSize(labelPlacement: TextAreaClearLabelPlacement, requiredPlacement: TextAreaClearRequiredPlacement) -> CGSize {
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
        
}
