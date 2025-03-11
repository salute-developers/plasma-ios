import SwiftUI
import Foundation
import SDDSThemeCore

public protocol CardSizeConfiguration: CustomDebugStringConvertible {
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var pathDrawer: PathDrawer { get }
}

public struct DefaultCardSize: CardSizeConfiguration {
    public var paddingStart: CGFloat = 16
    public var paddingEnd: CGFloat = 16
    public var paddingTop: CGFloat = 16
    public var paddingBottom: CGFloat = 16
    public var pathDrawer: PathDrawer = DefaultPathDrawer()
    
    public var debugDescription: String {
        return "Default Card Size"
    }
    
    public init() {}
}
