import Foundation

struct SelectProps: MergeableConfiguration, Codable {
    typealias Props = SelectProps
    
    var dropdownStyle: ComponentStyleKeyValue<DropdownMenuProps>?
    var textFieldStyle: ComponentStyleKeyValue<TextFieldProps>?
    var buttonStyle: ComponentStyleKeyValue<ButtonProps>?
    var selectItemStyle: ComponentStyleKeyValue<SelectItemProps>?
}

