import Foundation

struct AccordionItemAppearance: CodeGenerationAppearance {
    typealias Variation = AccordionItemConfiguration.Variation
    typealias Props = AccordionItemProps
    
    var titleTypography: String?
    var contentTextTypography: String?
    var titleColor: String?
    var contentTextColor: String?
    var closedIcon: String?
    var openedIcon: String?
    var backgroundColor: String?
    
    init(variation: AccordionItemConfiguration.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }
    
    init(props: AccordionItemProps?, id: String? = nil, component: CodeGenerationComponent) {
        guard let props = props else {
            return
        }
        
        self.titleTypography = TypographyTokenContextBuilder(string: props.titleStyle?.value, id: id, component: component).context
        self.contentTextTypography = TypographyTokenContextBuilder(string: props.contentTextStyle?.value, id: id, component: component).context
        self.titleColor = ColorTokenContextBuilder(props.titleColor).context
        self.contentTextColor = ColorTokenContextBuilder(props.contentTextColor).context
        self.closedIcon = ImageContextBuilder(props.closedIcon?.value).context
        self.openedIcon = ImageContextBuilder(props.openedIcon?.value).context
        self.backgroundColor = ColorTokenContextBuilder(props.backgroundColor).context
    }
} 
