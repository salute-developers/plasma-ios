import Foundation

//struct CellAppearance: CodeGenerationAppearance {
//    typealias Variation = CellConfiguration.Variation
//    typealias Props = CellProps
//    
//    public var labelTypography: String?
//    public var labelColor: String?
//    public var titleTypography: String?
//    public var titleColor: String?
//    public var subtitleTypography: String?
//    public var subtitleColor: String?
//    public var disclosureTextTypography: String?
//    public var avatarAppearance: String?
//    public var disclosureTextColor: String?
//    public var disclosureIconColor: String?
//    
//    init(variation: ComponentConfiguration<CellProps>.Variation, component: CodeGenerationComponent) {
//        self.init(props: variation.props, id: variation.id, component: component)
//    }
//    
//    init(props: CellProps, id: String?, component: CodeGenerationComponent) {
//        self.labelTypography = TypographyTokenContextBuilder(string: props.labelStyle?.value, sizeKey: id?.baseKey, component: component).context
//        self.labelColor = ColorTokenContextBuilder(props.labelColor).context
//        self.titleTypography = TypographyTokenContextBuilder(string: props.titleStyle?.value, sizeKey: id?.baseKey, component: component).context
//        self.titleColor = ColorTokenContextBuilder(props.titleColor).context
//        self.subtitleTypography = TypographyTokenContextBuilder(string: props.subtitleStyle?.value, sizeKey: id?.baseKey, component: component).context
//        self.subtitleColor = ColorTokenContextBuilder(props.subtitleColor).context
//        self.disclosureTextTypography = TypographyTokenContextBuilder(string: props.disclosureTextStyle?.value, sizeKey: id?.baseKey, component: component).context
//        self.disclosureTextColor = ColorTokenContextBuilder(props.disclosureTextColor).context
//        self.disclosureIconColor = ColorTokenContextBuilder(props.disclosureIconColor).context
//        
//        if let avatarStyle = props.avatarStyle?.value {
//            self.avatarAppearance = ComponentStyleContextBuilder(avatarStyle).context
//        }
//    }
//}
