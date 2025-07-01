import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `ScrollbarAppearance` определяет внешний вид скроллбара, включая цвета трека и ползунка, а также размеры.

 - Properties:
    - size: Конфигурация размеров для скроллбара.
    - thumbColor: Цвет ползунка скроллбара.
    - trackColor: Цвет трека скроллбара.
    - shape: Форма скроллбара.
 */
public struct ScrollbarAppearance: Hashable {
    let id = UUID()
    public var size: ScrollbarSizeConfiguration
    public var thumbColor: ColorToken
    public var trackColor: ColorToken
    
    public init(
        size: ScrollbarSizeConfiguration = DefaultScrollbarSize(),
        thumbColor: ColorToken = .clearColor,
        trackColor: ColorToken = .clearColor
    ) {
        self.size = size
        self.thumbColor = thumbColor
        self.trackColor = trackColor
    }
    
    public static func == (lhs: ScrollbarAppearance, rhs: ScrollbarAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.thumbColor == rhs.thumbColor &&
        lhs.trackColor == rhs.trackColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension ScrollbarAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: ScrollbarAppearance.self, fallback: ScrollbarAppearance())
    }
} 
