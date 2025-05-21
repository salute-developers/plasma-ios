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
        if let sizeProps = configuration.props as? Size.Props, baseKeys.isEmpty {
            variations["Default".codeGenString] = Size(props: sizeProps, id: nil, nullify: false)
        } else {
            for key in baseKeys {
                guard let variation = configuration.allProps[key], let rhsProps = variation.props as? Props.Props else {
                    continue
                }
                let props = configuration.props?.merge(rhs: rhsProps) ?? rhsProps
                guard let sizeProps = props as? Size.Props else {
                    fatalError()
                }
                variations[key.codeGenString] = Size(props: sizeProps, id: nil, nullify: false)
            }
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
        
        var baseKeys = configuration.allBaseKeys
        
        if baseKeys.isEmpty {
            baseKeys.append("default")
        }
        
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
        let chains: [String] = configuration.variations.isEmpty ? ["default"] : keys.map({ $0.chain }).sorted()
        let configurationProps = configuration.props as? Appearance.Props
        
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
        
        guard !keys.isEmpty else {
            return .init(
                component: component.rawValue,
                appearance: component.appearance,
                variations: variations,
                variationViews: variationViews,
                views: configuration.view.keys.sorted().reduce(into: [:]) { result, viewKey in
                    guard let props = configuration.view[viewKey]?.props, let appearanceProps = props as? Appearance.Props else {
                        return
                    }
                    return result[viewKey.codeGenString] = .init(appearance: Appearance(props: appearanceProps, id: nil, component: component))
                }
            )
        }
       
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
                    
                    let variationViewKey = key.joinedVariationPath.codeGenString
                    var currentView = variationViews[variationViewKey, default: [:]]
                    currentView[viewKey.codeGenString] = .init(appearance: Appearance(props: appearanceProps, id: nil, component: component))
                    variationViews[variationViewKey] = currentView
                }
            }
            
            if configuration.view.keys.isEmpty {
                let variation = configuration.allProps[parentKey]
                guard let view = variation?.view, !view.keys.isEmpty else {
                    continue
                }
                for viewKey in view.keys {
                    guard let props = view[viewKey]?.props, let appearanceProps = props as? Appearance.Props, let sizeProps = props as? Size.Props, let variation = variation else {
                        continue
                    }

                    let variationViewKey = parentKey.joinedVariationPath.codeGenString
                    if variations[variationViewKey] == nil {
                        variations[variationViewKey] = [:]
                    }
                    
                    var currentView = variationViews[variationViewKey, default: [:]]
                    currentView[viewKey.codeGenString] = .init(appearance: Appearance(props: appearanceProps, id: nil, component: component))
                    variationViews[variationViewKey] = currentView
                }
            }
            
            var hasViewProps = false
            for viewKey in configuration.view.keys {
                for key in keys {
                    guard let variation = configuration.allProps[key], let viewProps = variation.view?[viewKey]?.props as? Props.Props else {
                        continue
                    }
                    hasViewProps = true
                    break
                }
            }
            
            for viewKey in configuration.view.keys {
                var parentProps = configuration.view[viewKey]?.props as? Props
                
                if hasViewProps {
                    for key in keys {
                        let variationViewKey = key.joinedVariationPath.codeGenString
                        if variations[variationViewKey] == nil {
                            variations[variationViewKey] = [:]
                        }
                        var currentView = variationViews[variationViewKey, default: [:]]
                        let variation = configuration.allProps[key]
                                                
                        guard let viewProps = variation?.view?[viewKey]?.props as? Props.Props else {
                            let baseKey = key.baseKey
                            let parentView = configuration.allProps[baseKey]?.view?[viewKey]?.props
                            if let parentView = parentView as? Props.Props {
                                parentProps = parentProps?.merge(rhs: parentView) as? Props
                            }
                            
                            if let appearanceProps = parentProps as? Appearance.Props {
                                currentView[viewKey.codeGenString] = .init(appearance: Appearance(props: appearanceProps, id: nil, component: component))
                                variationViews[variationViewKey] = currentView
                            }
                            continue
                        }
                        guard let props = parentProps?.merge(rhs: viewProps) as? Props, let appearanceProps = props as? Appearance.Props else {
                            continue
                        }
                        
                        currentView[viewKey.codeGenString] = .init(appearance: Appearance(props: appearanceProps, id: nil, component: component))
                        variationViews[variationViewKey] = currentView
                    }
                }
                
                guard let appearanceProps = parentProps as? Appearance.Props else {
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
        let props = configuration.allProps[key]
        let baseProps = configuration.allProps[key.baseKey]
        if configuration.hasChild(rawKey: key) || props?.view?.keys.isEmpty == false || baseProps?.view?.keys.isEmpty == false {
            nextVariation = key.joinedVariationPath
        }
        return nextVariation
    }
}
