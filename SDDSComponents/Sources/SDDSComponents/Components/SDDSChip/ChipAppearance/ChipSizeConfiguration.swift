import Foundation
import SDDSApiInfo

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
    @ApiName("contentStartSize")
    @ApiValue("size(contentStartSize, contentStartSize)")
    var iconImageSize: CGSize { get }
    @ApiName("contentEndSize")
    @ApiValue("size(contentEndSize, contentEndSize)")
    var buttonImageSize: CGSize { get }
    @ApiName("paddingStart")
    var leadingInset: CGFloat { get }
    @ApiName("paddingEnd")
    var trailingInset: CGFloat { get }
    var contentStartPadding: CGFloat { get }
    var contentEndPadding: CGFloat { get }
    var height: CGFloat { get }
    @ApiName("shape")
    var cornerRadius: CGFloat { get }
}

public struct ZeroChipSize: ChipSizeConfiguration {
    public var cornerRadius: CGFloat { 0 }
    public var contentStartPadding: CGFloat { 0 }
    public var contentEndPadding: CGFloat { 0 }
    public var iconImageSize: CGSize { .zero }
    public var buttonImageSize: CGSize { .zero }
    public var leadingInset: CGFloat { 0 }
    public var trailingInset: CGFloat { 0 }
    public var height: CGFloat { 0 }
    public var debugDescription: String { "ZeroChipSize" }
    public init() {}
}
