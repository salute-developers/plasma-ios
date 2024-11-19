import Foundation

/**
 `ButtonContentAlignment` определяет выравнивание содержимого внутри кнопки с фиксированной шириной.

 - Cases:
    - centered: Содержимое кнопки выравнивается по центру.
    - sideBySide: Содержимое кнопки выравнивается бок о бок.
 */
public enum ButtonContentAlignment {
    /**
     Содержимое кнопки выравнивается по центру.
     */
    case packed
    
    /**
     Содержимое кнопки выравнивается по бокам (по левому и правому краю) .
     */
    case spaceBetween
}
