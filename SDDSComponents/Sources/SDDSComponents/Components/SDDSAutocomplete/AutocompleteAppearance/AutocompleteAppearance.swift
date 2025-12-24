import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `AutocompleteAppearance` определяет внешний вид компонента Autocomplete.
 
 Компонент Autocomplete представляет собой обертку над TextField с поддержкой выпадающего меню для автодополнения.
 
 - Properties:
    - dropdownAppearance: Настройки внешнего вида выпадающего меню
    - textFieldAppearance: Настройки внешнего вида текстового поля
    - size: Конфигурация размеров компонента
 */
public struct AutocompleteAppearance: Hashable {
    let id = UUID()
    public var dropdownAppearance: DropdownMenuAppearance
    public var textFieldAppearance: TextFieldAppearance
    public var size: AutocompleteSizeConfiguration
    
    public init(
        dropdownAppearance: DropdownMenuAppearance = .defaultValue,
        textFieldAppearance: TextFieldAppearance = .defaultValue,
        size: AutocompleteSizeConfiguration = ZeroAutocompleteSize()
    ) {
        self.dropdownAppearance = dropdownAppearance
        self.textFieldAppearance = textFieldAppearance
        self.size = size
    }
    
    public static func == (lhs: AutocompleteAppearance, rhs: AutocompleteAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.dropdownAppearance == rhs.dropdownAppearance &&
        lhs.textFieldAppearance == rhs.textFieldAppearance
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension AutocompleteAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        AutocompleteAppearance(
            dropdownAppearance: .defaultValue,
            textFieldAppearance: .defaultValue
        )
    }
}

public extension EnvironmentValues {
    var autocompleteAppearance: AutocompleteAppearance {
        get { self[AutocompleteAppearance.self] }
        set { self[AutocompleteAppearance.self] = newValue }
    }
}

