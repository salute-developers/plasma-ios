import SwiftUI
import Foundation
import SDDSThemeCore

public protocol BottomSheetSizeConfiguration: CustomDebugStringConvertible {
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var pathDrawer: PathDrawer { get }
    var handlePathDrawer: PathDrawer { get }
    var handleWidth: CGFloat { get }
    var handleHeight: CGFloat { get }
    var handleOffset: CGFloat { get }
}

public struct DefaultBottomSheetSize: BottomSheetSizeConfiguration {
    public var paddingStart: CGFloat = 16
    public var paddingEnd: CGFloat = 16
    public var paddingTop: CGFloat = 16
    public var paddingBottom: CGFloat = 16
    public var pathDrawer: any SDDSThemeCore.PathDrawer = CornerRadiusDrawer(cornerRadius: 16)
    public var handlePathDrawer: any SDDSThemeCore.PathDrawer = CornerRadiusDrawer(cornerRadius: 3)
    public var handleWidth: CGFloat = 48
    public var handleHeight: CGFloat = 6
    public var handleOffset: CGFloat = 6
    
    public var debugDescription: String {
        return "Default BottomSheet Size"
    }
    
    public init() {}
}
