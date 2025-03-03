import Foundation

protocol ComponentContextBuilder {
    associatedtype Appearance: CodeGenerationAppearance
    associatedtype Size: CodeGenerationSize
    
    func build() -> ComponentContext<Appearance, Size>
}

final class ComponentContextBuilderImpl<Props: MergeableConfiguration, Appearance: CodeGenerationAppearance, Size: CodeGenerationSize>: ComponentContextBuilder {
    private typealias VariationsContext = ComponentVariationsContext<Appearance, Size>
    private typealias Configuration = ComponentConfiguration<Props>
    private typealias TypographyContext = ComponentTypographyContext<Appearance>
    private typealias BaseContext = ComponentBaseContext<Appearance>
    private typealias SizeContext = ComponentSizeContext<Size>
    
    let configuration: ComponentConfiguration<Props>
    let component: CodeGenerationComponent
    
    init(configuration: ComponentConfiguration<Props>, component: CodeGenerationComponent) {
        self.configuration = configuration
        self.component = component
    }
    
    func build() -> ComponentContext<Appearance, Size> {
        return .init(
            typography: typography(from: configuration),
            size: sizeContext(from: configuration),
            base: baseContext(from: configuration),
            variations: variationsContext(from: configuration)
        )
    }
    
    private func sizeContext(from configuration: Configuration) -> SizeContext {
        var variations: [String: Size] = [:]
        
        let baseKeys = configuration.allBaseKeys
        for key in baseKeys {
            guard let variation = configuration.allProps[key], let rhsProps = variation.props as? Props.Props else {
                continue
            }
            let props = configuration.props.merge(rhs: rhsProps)
            guard let sizeProps = props as? Size.Props else {
                fatalError()
            }
            variations[key.codeGenString] = Size(props: sizeProps, id: nil, nullify: false)
        }
        
        return .init(
            component: component.rawValue, 
            appearance: component.appearance,
            sizeConfiguration: component.sizeConfiguration,
            variations: variations,
            zeroSize: Size()
        )
    }
    
    private func baseContext(from configuration: Configuration) -> BaseContext {
        var variations: [String: BaseContext.Variation] = [:]
        
        let baseKeys = configuration.allBaseKeys
        for key in baseKeys {
            guard let variation = configuration.allProps[key],
                  let appearanceProps = variation.props as? Appearance.Props
            else {
                continue
            }
            
            let nextContextBuilder = NextContextBuilder(
                nextVariation: nextVariation(configuration: configuration, key: key),
                currentVariation: key.joinedVariationPath,
                component: component.rawValue,
                appearance: component.appearance
            )
            let next = nextContextBuilder.context ?? ""
            
            variations[key.codeGenString] = .init(
                appearance: Appearance(props: appearanceProps, id: nil, component: component),
                next: next
            )
        }
        
        let keys = configuration.allProps.keys.sorted()
        let all: [String] = keys.map({ $0.joinedVariationPath }).sorted()
        let chains: [String] = keys.map({ $0.chain }).sorted()
        
        guard let configurationProps = configuration.props as? Appearance.Props else {
            fatalError("Bad definition")
        }
        
        return .init(
            component: component.rawValue,
            appearance: component.appearance,
            variations: variations,
            all: all,
            chains: chains,
            base: Appearance(props: configurationProps, id: nil, component: component)
        )
    }
    
    private func variationsContext(from configuration: Configuration) -> VariationsContext {
        var variations: [String: [String: VariationsContext.Variation]] = [:]
        var variationViews: [String: [String: VariationsContext.View]] = [:]
        var views: [String: VariationsContext.View] = [:]
        
        let keys = configuration.allProps.keys.sorted()
        for parentKey in keys {
            let childKeys = configuration.childKeys(for: parentKey)
            
            for key in childKeys {
                guard let variation = configuration.allProps[key] else {
                    continue
                }
                
                let variationKey = parentKey.joinedVariationPath.codeGenString

                let nextContextBuilder = NextContextBuilder(
                    nextVariation: nextVariation(configuration: configuration, key: key),
                    currentVariation: parentKey.joinedVariationPath,
                    component: component.rawValue,
                    appearance: component.appearance
                )
                let next = nextContextBuilder.context ?? ""
                
                let appearanceProps = variation.props as? Appearance.Props
                let sizeProps = variation.props as? Size.Props
                guard let appearanceProps = appearanceProps, let sizeProps = sizeProps else {
                    fatalError("Bad definition")
                }
                
                let variationContext = VariationsContext.Variation(
                    appearance: Appearance(props: appearanceProps, id: variation.id, component: component),
                    size: Size(props: sizeProps, id: variation.id, nullify: true),
                    next: next, 
                    chain: key.chain
                )
                
                var currentVariation = variations[variationKey, default: [:]]
                currentVariation[key.lastVariation.camelCase] = variationContext
                variations[variationKey] = currentVariation
                
                guard let view = variation.view else {
                    continue
                }
                for viewKey in view.keys.sorted() {
                    guard let props = view[viewKey]?.props, let appearanceProps = props as? Appearance.Props else {
                        continue
                    }
                    
                    var currentView = variationViews[parentKey.joinedVariationPath.codeGenString, default: [:]]
                    currentView[viewKey.codeGenString] = .init(appearance: Appearance(props: appearanceProps, id: nil, component: component))
                    variationViews[parentKey.joinedVariationPath.codeGenString] = currentView
                }
            }
            
            for viewKey in configuration.view.keys.sorted() {
                guard let props = configuration.view[viewKey]?.props, let appearanceProps = props as? Appearance.Props else {
                    continue
                }
                
                views[viewKey.codeGenString] = .init(appearance: Appearance(props: appearanceProps, id: nil, component: component))
            }
        }
        
        return .init(
            component: component.rawValue,
            appearance: component.appearance,
            variations: variations,
            variationViews: variationViews,
            views: views
        )
    }
    
    private func typography(from configuration: Configuration) -> TypographyContext {
        var variations: [String: Appearance] = [:]
        
        let baseKeys = configuration.allBaseKeys
        for key in baseKeys {
            guard let variation = configuration.allProps[key], let appearanceProps = variation.props as? Appearance.Props else {
                continue
            }
            variations[key.codeGenString] = Appearance(props: appearanceProps, id: variation.id, component: component)
        }
        
        return .init(
            component: component.rawValue,
            appearance: component.appearance, 
            sizeConfiguration: component.sizeConfiguration,
            variations: variations
        )
    }
    
    private func nextVariation(configuration: Configuration, key: String) -> String? {
        var nextVariation: String? = nil
        if configuration.hasChild(rawKey: key) {
            nextVariation = key.joinedVariationPath
        }
        return nextVariation
    }

}
