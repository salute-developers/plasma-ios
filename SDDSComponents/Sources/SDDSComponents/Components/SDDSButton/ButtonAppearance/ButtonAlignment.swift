import Foundation
import SwiftUI

/**
 `ButtonAlignment` определяет выравнивание иконки внутри кнопки.

 - Cases:
    - left: Иконка выравнивается по левому краю.
    - right: Иконка выравнивается по правому краю.
 */
public enum ButtonAlignment: String, CaseIterable {
    /**
     Иконка выравнивается по левому краю.
     */
    case leading
    
    /**
     Иконка выравнивается по правому краю.
     */
    case trailing
}
