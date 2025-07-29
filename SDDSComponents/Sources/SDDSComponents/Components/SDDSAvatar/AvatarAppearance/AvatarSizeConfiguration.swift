import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `AvatarSizeConfiguration` определяет размеры и отступы для аватара.

 - Properties:
    - avatarSize: Размер аватара.
    - statusSize: Размер иконки статуса.
    - statusInsets: Отступы иконки статуса относительно нижнего правого угла.
 */
public protocol AvatarSizeConfiguration {
    var avatarSize: CGSize { get }
    var statusInsets: EdgeInsets { get }
    var extraOffset: CGPoint { get }
    var pathDrawer: PathDrawer { get }
}

public struct ZeroAvatarSize: AvatarSizeConfiguration {
    public var avatarSize: CGSize { .zero }
    public var statusInsets: EdgeInsets { .init() }
    public var extraOffset: CGPoint { .zero }
    public var pathDrawer: any PathDrawer { CircleDrawer() }
    public init() {}
}
