import Foundation

struct AutocompleteProps: MergeableConfiguration, Codable {
    typealias Props = AutocompleteProps
    
    var dropdownStyle: ComponentStyleKeyValue<DropdownMenuProps>?
    var textFieldStyle: ComponentStyleKeyValue<TextFieldProps>?
}

