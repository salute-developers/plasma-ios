import Foundation

/**
 `ChipSizeConfiguration` определяет конфигурацию размеров для чипа.
 
 - Properties:
    - iconImageSize: Размер изображения иконки.
    - buttonImageSize: Размер изображения кнопки.
    - leadingInset: Внутренний отступ слева.
    - trailingInset: Внутренний отступ справа.
    - spacing: Расстояние между элементами.
    - borderStyle: Стиль границы чипа.
    - height: Высота чипа.
 */
public protocol ChipSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var iconImageSize: CGSize? { get }
    var buttonImageSize: CGSize? { get }
    var leadingInset: CGFloat { get }
    var trailingInset: CGFloat { get }
    var spacing: CGFloat { get }
    var height: CGFloat { get }
    func cornerRadius(style: ComponentShapeStyle) -> CGFloat
}

public struct ZeroChipSize: ChipSizeConfiguration {
    public var iconImageSize: CGSize? { nil }
    public var buttonImageSize: CGSize? { nil }
    public var leadingInset: CGFloat { 0 }
    public var trailingInset: CGFloat { 0 }
    public var spacing: CGFloat { 0 }
    public var height: CGFloat { 0 }
    public func cornerRadius(style: ComponentShapeStyle) -> CGFloat { 0 }
    public var debugDescription: String { "ZeroChipSize" }
    public init() {}
}
