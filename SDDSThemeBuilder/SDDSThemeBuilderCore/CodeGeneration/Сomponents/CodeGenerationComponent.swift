import Foundation

enum CodeGenerationComponent: String, CaseIterable, Decodable {
    case basicButton = "BasicButton"
    case linkButton = "LinkButton"
    case iconButton = "IconButton"
    case textField = "TextField"
    case textFieldClear = "TextFieldClear"
    case textArea = "TextArea"
    case textAreaClear = "TextAreaClear"
}

extension CodeGenerationComponent {
    func command(outputURL: URL, themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> Command {
        switch self {
        case .basicButton, .iconButton, .linkButton:
            GenerateComponentCommand<ButtonProps, ButtonAppearance, ButtonSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .textField, .textFieldClear:
            GenerateComponentCommand<TextFieldProps, TextFieldAppearance, TextFieldSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .textArea, .textAreaClear:
            GenerateComponentCommand<TextFieldProps, TextAreaAppearance, TextAreaSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        }
    }
    
    /// Название структуры Appearance в `SDDSComponents`
    var appearance: String {
        switch self {
        case .basicButton, .iconButton, .linkButton:
            "ButtonAppearance"
        case .textArea, .textAreaClear:
            "TextAreaAppearance"
        case .textField, .textFieldClear:
            "TextFieldAppearance"
        }
    }
    
    /// Название протокола sizeConfiguration в `SDDSComponents`
    var sizeConfiguration: String {
        switch self {
        case .basicButton, .iconButton, .linkButton:
            "ButtonSizeConfiguration"
        case .textArea, .textAreaClear:
            "TextAreaSizeConfiguration"
        case .textField, .textFieldClear:
            "TextFieldSizeConfiguration"
        }
    }
    
    private var configurationFilename: String {
        switch self {
        case .basicButton:
            "basic_button_config.json"
        case .iconButton:
            "icon_button_config.json"
        case .linkButton:
            "link_button_config.json"
        case .textField:
            "text_field_config.json"
        case .textFieldClear:
            "text_field_clear_config.json"
        case .textArea:
            "text_area_config.json"
        case .textAreaClear:
            "text_area_clear_config.json"
        }
    }
    
    func url(baseURL: URL) -> URL {
        let result = baseURL
            .appending(component: configurationFilename)
        
        return result
    }
}

extension CodeGenerationComponent {
    func chain(with key: String) -> String {
        "\(self.rawValue).\(key.chain)"
    }
}
