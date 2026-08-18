import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSApiInfo

/**
 `AvatarSizeConfiguration` определяет размеры и отступы для аватара.

 - Properties:
    - avatarSize: Размер аватара.
    - statusSize: Размер иконки статуса.
    - statusInsets: Отступы иконки статуса относительно нижнего правого угла.
 */
public protocol AvatarSizeConfiguration {
    @ApiValue("size(width, height)")
    var avatarSize: CGSize { get }
    @ApiValue("insets(0, 0, statusOffsetY, statusOffsetX)")
    var statusInsets: EdgeInsets { get }
    @ApiValue("point(extraOffsetX, extraOffsetY)")
    var extraOffset: CGPoint { get }
    @ApiName("shape")
    var pathDrawer: PathDrawer { get }
}

public struct ZeroAvatarSize: AvatarSizeConfiguration {
    public var avatarSize: CGSize { .zero }
    public var statusInsets: EdgeInsets { .init() }
    public var extraOffset: CGPoint { .zero }
    public var pathDrawer: any PathDrawer { CircleDrawer() }
    public init() {}
}
