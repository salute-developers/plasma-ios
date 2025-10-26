import Foundation

struct NoteCompactAppearance: CodeGenerationAppearance {
    typealias Variation = NoteCompactConfiguration.Variation
    typealias Props = NoteCompactProps
    
    var backgroundColor: String?
    var iconColor: String?
    var closeColor: String?
    var titleColor: String?
    var textColor: String?
    var titleTypography: String?
    var textTypography: String?
    var closeIcon: String?
    var linkButtonAppearance: String?
    
    init(variation: NoteCompactConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: NoteCompactProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        // Colors
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
        self.iconColor = ColorTokenContextBuilder(props.iconColor).context
        self.closeColor = ColorTokenContextBuilder(props.closeColor).context
        self.titleColor = ColorTokenContextBuilder(props.titleColor).context
        self.textColor = ColorTokenContextBuilder(props.textColor).context
        
        // Typography
        self.titleTypography = TypographyTokenContextBuilder(string: props.titleStyle?.value, id: id, component: component).context
        self.textTypography = TypographyTokenContextBuilder(string: props.textStyle?.value, id: id, component: component).context
        
        // Icon
        self.closeIcon = ImageContextBuilder(props.closeIcon?.value).context
        
        // Nested component style
        if let linkButtonStyle = props.linkButtonStyle?.value {
            self.linkButtonAppearance = ComponentStyleContextBuilder(linkButtonStyle).context
        }
    }
}

