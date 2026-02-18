import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `AutocompleteSizeConfiguration` определяет размеры компонента Autocomplete.
 
 В текущей реализации протокол не содержит специфичных свойств размеров,
 так как компонент является оберткой над TextField и DropdownMenu.
 */
public protocol AutocompleteSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    // AutocompleteSizeConfiguration не имеет специфичных свойств в текущей конфигурации
}

/**
 Базовая реализация `AutocompleteSizeConfiguration` с нулевыми значениями.
 */
public struct ZeroAutocompleteSize: AutocompleteSizeConfiguration {
    public var debugDescription: String {
        "ZeroAutocompleteSize"
    }
    
    public init() {}
}

