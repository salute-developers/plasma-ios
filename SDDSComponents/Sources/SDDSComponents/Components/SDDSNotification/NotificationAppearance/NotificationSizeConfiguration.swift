import SwiftUI
@_exported import SDDSThemeCore

public protocol NotificationSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var closeSize: CGFloat { get }
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var shape: PathDrawer { get }
} 
