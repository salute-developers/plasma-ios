import Foundation

struct CellAppearance: CodeGenerationAppearance {
    typealias Variation = CellConfiguration.Variation
    typealias Props = CellProps
    
    var labelTypography: String?
    var labelColor: String?
    var titleTypography: String?
    var titleColor: String?
    var subtitleTypography: String?
    var subtitleColor: String?
    var disclosureTextTypography: String?
    var disclosureTextColor: String?
    var disclosureImageColor: String?
    var avatarAppearance: String?
    var buttonAppearance: String?
    var checkboxAppearance: String?
    var radioboxAppearance: String?
    var switchAppearance: String?
    var disclosureImage: String?
    
    init(variation: CellConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: CellProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.labelTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.labelColor = ColorTokenContextBuilder(props.labelColor).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.titleStyle?.value, id: id, component: component).context
        self.titleColor = ColorTokenContextBuilder(props.titleColor).context
        self.subtitleTypography = TypographyTokenContextBuilder(string: props.subtitleStyle?.value, id: id, component: component).context
        self.subtitleColor = ColorTokenContextBuilder(props.subtitleColor).context
        self.disclosureTextTypography = TypographyTokenContextBuilder(string: props.disclosureTextStyle?.value, id: id, component: component).context
        self.disclosureTextColor = ColorTokenContextBuilder(props.disclosureTextColor).context
        self.disclosureImageColor = ColorTokenContextBuilder(props.disclosureIconColor).context
        self.disclosureImage = ImageContextBuilder(props.disclosureIcon?.value).context
        
        if let avatarStyle = props.avatarStyle?.value {
            self.avatarAppearance = ComponentStyleContextBuilder(avatarStyle).context
        }
        if let iconButtonStyle = props.iconButtonStyle?.value {
            self.buttonAppearance = ComponentStyleContextBuilder(iconButtonStyle).context
        }
        if let checkBoxStyle = props.checkBoxStyle?.value {
            self.checkboxAppearance = ComponentStyleContextBuilder(checkBoxStyle).context
        }
        if let radioBoxStyle = props.radioBoxStyle?.value {
            self.radioboxAppearance = ComponentStyleContextBuilder(radioBoxStyle).context
        }
        if let switchStyle = props.switchStyle?.value {
            self.switchAppearance = ComponentStyleContextBuilder(switchStyle).context
        }
    }
}
