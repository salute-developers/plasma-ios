import Foundation

enum GeneratedComponent: String, Decodable {
    case basicButton = "BasicButton"
    case linkButton = "LinkButton"
    case iconButton = "IconButton"
    case textField = "TextField"
    case textFieldClear = "TextFieldClear"
    case textArea = "TextArea"
    case textAreaClear = "TextAreaClear"
}

extension GeneratedComponent {
    var url: URL {
        switch self {
        case .basicButton:
            return URL(string: "https://raw.githubusercontent.com/salute-developers/theme-converter/refs/heads/main/components/sdds_serv/basic_button_config.json")!
        case .linkButton:
            return URL(string: "https://raw.githubusercontent.com/salute-developers/theme-converter/refs/heads/main/components/sdds_serv/link_button_config.json")!
        case .iconButton:
            return URL(string: "https://raw.githubusercontent.com/salute-developers/theme-converter/refs/heads/main/components/sdds_serv/icon_button_config.json")!
        case .textField:
            return URL(string: "https://raw.githubusercontent.com/salute-developers/theme-converter/refs/heads/main/components/sdds_serv/text_field_config.json")!
        case .textFieldClear:
            return URL(string: "https://raw.githubusercontent.com/salute-developers/theme-converter/refs/heads/main/components/sdds_serv/text_field_clear_config.json")!
        case .textArea:
            return URL(string: "https://raw.githubusercontent.com/salute-developers/theme-converter/refs/heads/main/components/sdds_serv/text_area_config.json")!
        case .textAreaClear:
            return URL(string: "https://raw.githubusercontent.com/salute-developers/theme-converter/refs/heads/main/components/sdds_serv/text_area_clear_config.json")!
        }
    }
    
    var appearance: String {
        switch self {
        case .textField, .textFieldClear:
            return "TextFieldAppearance"
        case .textArea, .textAreaClear:
            return "TextAreaAppearance"
        case .basicButton, .linkButton, .iconButton:
            return "ButtonAppearance"
        }
    }
    
    var sizeConfiguration: String {
        switch self {
        case .textField, .textFieldClear:
            return "TextFieldSizeConfiguration"
        case .textArea, .textAreaClear:
            return "TextAreaSizeConfiguration"
        case .basicButton, .linkButton, .iconButton:
            return "ButtonSizeConfiguration"
        }
    }
}
