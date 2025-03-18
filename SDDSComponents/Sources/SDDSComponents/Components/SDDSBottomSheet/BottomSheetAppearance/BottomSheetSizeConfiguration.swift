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
    public var paddingStart: CGFloat = 0
    public var paddingEnd: CGFloat = 0
    public var paddingTop: CGFloat = 0
    public var paddingBottom: CGFloat = 0
    public var pathDrawer: any SDDSThemeCore.PathDrawer = DefaultPathDrawer()
    public var handlePathDrawer: any SDDSThemeCore.PathDrawer = DefaultPathDrawer()
    public var handleWidth: CGFloat = 0
    public var handleHeight: CGFloat = 0
    public var handleOffset: CGFloat = 0
    
    public var debugDescription: String {
        return "Default BottomSheet Size"
    }
    
    public init() {}
}
