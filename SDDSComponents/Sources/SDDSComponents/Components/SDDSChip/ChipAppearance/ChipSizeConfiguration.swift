import Foundation

/**
 `ChipSizeConfiguration` определяет конфигурацию размеров для чипа.
 
 - Properties:
    - iconImageSize: Размер изображения иконки.
    - buttonImageSize: Размер изображения кнопки.
    - leadingInset: Внутренний отступ слева.
    - trailingInset: Внутренний отступ справа.
    - contentStartPadding: Отступ от .contentStart
    - contentEndPadding: Отступ от .contentEnd
    - borderStyle: Стиль границы чипа.
    - height: Высота чипа.
 */
public protocol ChipSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var iconImageSize: CGSize? { get }
    var buttonImageSize: CGSize? { get }
    var leadingInset: CGFloat { get }
    var trailingInset: CGFloat { get }
    var contentStartPadding: CGFloat { get }
    var contentEndPadding: CGFloat { get }
    var height: CGFloat { get }
    var cornerRadius: CGFloat { get }
    
    @available(*, deprecated, message: "use contentEndPadding, contentStartPadding instead")
    var spacing: CGFloat { get }
}

public struct ZeroChipSize: ChipSizeConfiguration {
    public var cornerRadius: CGFloat { 0 }
    public var contentStartPadding: CGFloat { 0 }
    public var contentEndPadding: CGFloat { 0 }
    public var iconImageSize: CGSize? { nil }
    public var buttonImageSize: CGSize? { nil }
    public var leadingInset: CGFloat { 0 }
    public var trailingInset: CGFloat { 0 }
    public var spacing: CGFloat { 0 }
    public var height: CGFloat { 0 }
    public var debugDescription: String { "ZeroChipSize" }
    public init() {}
}
