import Foundation

struct CellAppearance: CodeGenerationAppearance {
    typealias Variation = CellConfiguration.Variation
    typealias Props = CellProps
    
    public var labelTypography: String?
    public var labelColor: String?
    public var titleTypography: String?
    public var titleColor: String?
    public var subtitleTypography: String?
    public var subtitleColor: String?
    public var disclosureTextTypography: String?
    public var disclosureTextColor: String?
    public var disclosureIconColor: String?
    public var avatarAppearance: String?
    public var iconButtonAppearance: String?
    public var checkBoxAppearance: String?
    public var radioBoxAppearance: String?
    public var switchAppearance: String?
//    public var disclosureIcon: String?
    
    init(variation: ComponentConfiguration<CellProps>.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: CellProps, id: String?, component: CodeGenerationComponent) {
        self.labelTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, id: id, component: component).context
        self.labelColor = ColorTokenContextBuilder(props.labelColor).context
        self.titleTypography = TypographyTokenContextBuilder(string: props.titleStyle?.value, id: id, component: component).context
        self.titleColor = ColorTokenContextBuilder(props.titleColor).context
        self.subtitleTypography = TypographyTokenContextBuilder(string: props.subtitleStyle?.value, id: id, component: component).context
        self.subtitleColor = ColorTokenContextBuilder(props.subtitleColor).context
        self.disclosureTextTypography = TypographyTokenContextBuilder(string: props.disclosureTextStyle?.value, id: id, component: component).context
        self.disclosureTextColor = ColorTokenContextBuilder(props.disclosureTextColor).context
        self.disclosureIconColor = ColorTokenContextBuilder(props.disclosureIconColor).context
        
        //MARK: - Написать один метод
        if let avatarStyle = props.avatarStyle?.value {
            self.avatarAppearance = ComponentStyleContextBuilder(avatarStyle).context
        }
        if let iconButtonStyle = props.iconButtonStyle?.value {
            self.iconButtonAppearance = ComponentStyleContextBuilder(iconButtonStyle).context
        }
        if let checkBoxStyle = props.checkBoxStyle?.value {
            self.checkBoxAppearance = ComponentStyleContextBuilder(checkBoxStyle).context
        }
        if let radioBoxStyle = props.radioBoxStyle?.value {
            self.radioBoxAppearance = ComponentStyleContextBuilder(radioBoxStyle).context
        }
        if let switchStyle = props.switchStyle?.value {
            self.switchAppearance = ComponentStyleContextBuilder(switchStyle).context
        }
    }
}
