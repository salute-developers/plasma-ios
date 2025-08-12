import Foundation
import UIKit

public enum CornerRadiusDrawerType {
    case all
    case specific([UIRectCorner])
    
    public static let topLeft = UIRectCorner.topLeft
    public static let topRight = UIRectCorner.topRight
    public static let bottomLeft = UIRectCorner.bottomLeft
    public static let bottomRight = UIRectCorner.bottomRight
    
    public static let top = [UIRectCorner.topLeft, UIRectCorner.topRight]
    public static let bottom = [UIRectCorner.bottomLeft, UIRectCorner.bottomRight]
    public static let left = [UIRectCorner.topLeft, UIRectCorner.bottomLeft]
    public static let right = [UIRectCorner.topRight, UIRectCorner.bottomRight]
}
