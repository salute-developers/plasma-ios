import Foundation
import SwiftUI

/**
 `AvatarSizeConfiguration` определяет размеры и отступы для аватара.

 - Properties:
    - avatarSize: Размер аватара.
    - statusSize: Размер иконки статуса.
    - statusInsets: Отступы иконки статуса относительно нижнего правого угла.
 */
public protocol AvatarSizeConfiguration {
    var avatarSize: CGSize { get }
    var statusSize: CGSize { get }
    var statusInsets: EdgeInsets { get }
}

public struct ZeroAvatarSize: AvatarSizeConfiguration {
    public var avatarSize: CGSize { .zero }
    public var statusSize: CGSize { .zero }
    public var statusInsets: EdgeInsets { .init() }
    public init() {}
}
