import Foundation
@_exported import SDDSservTheme
import SDDSThemeCore
import SDDSThemeUtilities


struct ButtonTypography: GeneralTypographyConfiguration {
    typealias S = ButtonSizeConfiguration
    
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let extraSmall: TypographyToken?
    let extraExtraSmall: TypographyToken?
    
    init(large: TypographyToken?, medium: TypographyToken?, small: TypographyToken?, extraSmall: TypographyToken?, extraExtraSmall: TypographyToken?) {
        self.large = large
        self.medium = medium
        self.small = small
        self.extraSmall = extraSmall
        self.extraExtraSmall = extraExtraSmall
    }
    
    /**
     Возвращает типографику для заданного размера кнопки.
     
     - Parameter size: Размер кнопки.
     - Returns: Типографика для заданного размера кнопки или nil, если не задана.
     */
    func typography(with size: ButtonSizeConfiguration) -> TypographyToken? {
        switch size as? ButtonSize {
        case .large:
            return large
        case .medium:
            return medium
        case .small:
            return small
        case .extraSmall:
            return extraSmall
        case .extraExtraSmall:
            return extraExtraSmall
        case .none:
            return medium
        }
    }
}
