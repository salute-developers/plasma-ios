import Foundation
import SDDSComponents
import SDDSThemeCore

/**
 `ButtonTypography` содержит типографику для заголовков кнопки для каждого размера кнопки.

 - Properties:
    - large: Типографика для больших кнопок.
    - medium: Типографика для средних кнопок.
    - small: Типографика для маленьких кнопок.
    - xs: Типографика для очень маленьких кнопок.
    - xxs: Типографика для самых маленьких кнопок.

 - Methods:
    - typography(with size: ButtonSize): Возвращает типографику для заданного размера кнопки.
 */
public struct ButtonTypography: ButtonTypographyConfiguration {
    public let large: TypographyToken?
    public let medium: TypographyToken?
    public let small: TypographyToken?
    public let xs: TypographyToken?
    public let xxs: TypographyToken?
    
    public init(large: TypographyToken?, medium: TypographyToken?, small: TypographyToken?, xs: TypographyToken?, xxs: TypographyToken?) {
        self.large = large
        self.medium = medium
        self.small = small
        self.xs = xs
        self.xxs = xxs
    }
    
    /**
     Возвращает типографику для заданного размера кнопки.
     
     - Parameter size: Размер кнопки.
     - Returns: Типографика для заданного размера кнопки или nil, если не задана.
     */
    public func typography(with size: ButtonSizeConfiguration) -> TypographyToken? {
        switch size as? ButtonSize {
        case .large:
            return large
        case .medium:
            return medium
        case .small:
            return small
        case .xs:
            return xs
        case .xxs:
            return xxs
        case .none:
            return medium
        }
    }
}
