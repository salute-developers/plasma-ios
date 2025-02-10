import Foundation

enum CodeGenerationComponent: String, CaseIterable, Decodable {
    case basicButton = "BasicButton"
    case linkButton = "LinkButton"
    case iconButton = "IconButton"
    case textField = "TextField"
    case textFieldClear = "TextFieldClear"
    case textArea = "TextArea"
    case textAreaClear = "TextAreaClear"
    case chip = "Chip"
    case embeddedChip = "EmbeddedChip"
    
    static var supportedComponents: [CodeGenerationComponent] {
        [
            .basicButton,
            .linkButton,
            .iconButton,
            .textField,
            .textFieldClear,
            .textArea,
            .textAreaClear
        ]
    }
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
        case .chip, .embeddedChip:
            GenerateComponentCommand<ChipProps, ChipAppearance, ChipSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
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
        case .chip, .embeddedChip:
            "ChipAppearance"
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
        case .chip, .embeddedChip:
            "ChipSizeConfiguration"
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
        case .chip:
            "chip_config.json"
        case .embeddedChip:
            "embedded_chip_config.json"
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
