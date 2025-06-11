import SwiftUI

public struct ZeroNotificationSize: NotificationSizeConfiguration {
    public var closeSize = CGFloat(0)
    public var paddingBottom = CGFloat(0)
    public var paddingEnd = CGFloat(0)
    public var paddingStart = CGFloat(0)
    public var paddingTop = CGFloat(0)
    public var shape = DefaultPathDrawer() as PathDrawer
    
    public var debugDescription: String {
        return "ZeroNotificationSize"
    }
    
    public init() {}
}
