import Foundation
import SwiftUI
import SDDSThemeCore

/**
 Протокол `ButtonSizeConfiguration` определяет размеры и отступы кнопки, которые можно настроить для различных стилей и вариантов кнопок.

 - Properties:
    - height: Высота кнопки.
    - cornerRadius: Радиус скругления углов кнопки.
    - paddings: Внутренние отступы кнопки.
    - iconSize: Размер иконки, отображаемой в кнопке.
    - spinnerSize: Размер спиннера загрузки в кнопке.
    - iconHorizontalGap: Горизонтальный промежуток между иконкой и текстом кнопки.
    - titleHorizontalGap: Горизонтальный промежуток между заголовком и подзаголовком кнопки.
 */
public protocol ButtonSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    /**
     Высота кнопки.
     */
    var height: CGFloat { get }
    
    /**
     Радиус скругления углов кнопки.
     */
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    var cornerRadius: CGFloat { get }
    
    /**
     Shape token скругления углов кнопки.
     */
    var pathDrawer: PathDrawer { get }
    
    /**
     Внутренние отступы кнопки.
     */
    var paddings: EdgeInsets { get }
    
    /**
     Размер иконки, отображаемой в кнопке.
     */
    var iconSize: CGSize { get }
    
    /**
     Размер спиннера загрузки в кнопке.
     */
    var spinnerSize: CGSize { get }
    
    /**
     Горизонтальный промежуток между иконкой и текстом кнопки.
     */
    var iconHorizontalGap: CGFloat { get }
    
    /**
     Горизонтальный промежуток между заголовком и подзаголовком кнопки.
     */
    var titleHorizontalGap: CGFloat { get }
    
}

public struct DefaultButtonSize: ButtonSizeConfiguration {
    public var height: CGFloat = 0
    public var cornerRadius: CGFloat = 0
    public var pathDrawer: any PathDrawer = DefaultPathDrawer()
    public var paddings: EdgeInsets = .init()
    public var iconSize: CGSize = .zero
    public var counterSize: CounterSizeConfiguration = DefaultCounterSize()
    public var spinnerSize: CGSize = .zero
    public var iconHorizontalGap: CGFloat = 0
    public var titleHorizontalGap: CGFloat = 0
    public var debugDescription: String {
        return "Default Button Size"
    }
    
    public init() {}
}
