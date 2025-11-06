import Foundation

struct TabsDefaultSize: CodeGenerationSize {
    typealias Variation = TabsDefaultConfiguration.Variation
    typealias Props = TabsDefaultProps
    
    var dividerEnabled: String?
    var indicatorEnabled: String?
    var indicatorThickness: String?
    var minSpacing: String?
    var orientation: String?
    var overflowIconSize: String?
    var disclosureIconSize: String?
    
    init(variation: TabsDefaultConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: TabsDefaultProps, id: String? = nil, nullify: Bool = false) {
        self.dividerEnabled = BoolContextBuilder(props.dividerEnabled?.value, nullify: nullify).context
        self.indicatorEnabled = BoolContextBuilder(props.indicatorEnabled?.value, nullify: nullify).context
        self.indicatorThickness = CGFloatContextBuilder(props.indicatorThickness?.value, nullify: nullify).context
        self.minSpacing = CGFloatContextBuilder(props.minSpacing?.value, nullify: nullify).context
        self.orientation = TabsDefaultOrientationContextBuilder(id: props.orientation?.value, component: .tabsDefault, nullify: nullify).context
        self.overflowIconSize = ImageSizeContextBuilder(props.overflowNextIcon?.value, nullify: nullify).context
        self.disclosureIconSize = ImageSizeContextBuilder(props.disclosureIcon?.value, nullify: nullify).context
    }
    
    init() {
        self.dividerEnabled = "Bool(true)"
        self.indicatorEnabled = "Bool(true)"
        self.indicatorThickness = CGFloat.defaultContext
        self.minSpacing = CGFloat.defaultContext
        self.orientation = TabsDefaultOrientationContextBuilder.defaultContext
        self.overflowIconSize = "CGFloat(0)"
        self.disclosureIconSize = "CGFloat(0)"
    }
}
