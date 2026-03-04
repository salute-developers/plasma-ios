import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public protocol EditableSizeConfiguration {
    var iconSize: CGFloat { get }
    var iconMargin: CGFloat { get }
}

public struct EditableSize: EditableSizeConfiguration {
    public var iconSize: CGFloat
    public var iconMargin: CGFloat
    
    public init(
        iconSize: CGFloat = 0,
        iconMargin: CGFloat = 0
    ) {
        self.iconSize = iconSize
        self.iconMargin = iconMargin
    }
}
