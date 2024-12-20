import Foundation
import SwiftUI

/**
 `AvatarImageSource` определяет источник изображения для аватара.

 - Cases:
    - url: URL изображения, загружаемого асинхронно.
    - image: Локальное изображение типа `Image`.
 */
public enum AvatarImageSource {
    case url(URL)
    case image(Image)
}
