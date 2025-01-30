import Foundation

final class TextFieldContextBuilder {
    let configuration: TextFieldConfiguration
    
    init(configuration: TextFieldConfiguration) {
        self.configuration = configuration
    }
    
    func build() -> TextFieldContext {
        return TextFieldContext(
            sizeConfiguration: sizeConfiguration(from: configuration),
            appearance: appearance(from: configuration),
            typography: typography(from: configuration)
        )
    }
    
    private func sizeConfiguration(from configuration: TextFieldConfiguration) -> TextFieldSizeConfiguration {
        let invariantProps = configuration.props
        let allProps = configuration.allProps
        
        var data = [String: TextFieldSizeConfiguration.SizeVariation]()
        for variation in configuration.variations {
            guard let sizeVariationKey = SizeVariationKey(rawValue: variation.id) else {
                continue
            }
            let props = variation.props
            let mergedProps = props.merge(rhs: invariantProps)
            let key = sizeVariationKey.rawValue.sizeKey
            
            data[key] = TextFieldSizeConfiguration.SizeVariation(
                titleBottomPadding: configuration.child(props: allProps, key: sizeVariationKey, nodes: [.outerLabel])?.props.labelPadding?.value ?? 0,
                titleInnerPadding: configuration.child(props: allProps, key: sizeVariationKey, nodes: [.innerLabel])?.props.labelPadding?.value ?? 0,
                textBeforeTrailingPadding: mergedProps.prefixPadding?.value ?? 0,
                textAfterLeadingPadding: mergedProps.suffixPadding?.value ?? 0,
                boxLeadingPadding: mergedProps.boxPaddingStart?.value ?? 0,
                boxTrailingPadding: mergedProps.boxPaddingEnd?.value ?? 0,
                captionTopPadding: mergedProps.helperTextPadding?.value ?? 0,
                optionalPadding: mergedProps.optionalPadding?.value ?? 0,
                shape: mergedProps.shape ?? ShapeKeyValue(),
                chipGroupStyle: ComponentStyleContextBuilder(mergedProps.chipGroupStyle?.value ?? "").context,
                chipStyle: ComponentStyleContextBuilder(mergedProps.chipStyle?.value ?? "").context,
                iconPadding: mergedProps.startContentPadding?.value ?? 0,
                iconActionPadding: mergedProps.endContentPadding?.value ?? 0,
                fieldHeight: mergedProps.boxMinHeight?.value ?? 0,
                iconSize: .init(width: mergedProps.startContentSize?.value ?? 0, height: mergedProps.startContentSize?.value ?? 0),
                iconActionSize: .init(width: mergedProps.endContentSize?.value ?? 0, height: mergedProps.endContentSize?.value ?? 0),
                chipsPadding: mergedProps.chipsPadding?.value ?? 0,
                chipContainerHorizontalPadding: mergedProps.chipsPadding?.value ?? 0,
                indicatorOffsets: indiciatorOffsets(from: configuration, sizeVariationKey: sizeVariationKey),
                indicatorSizes: indiciatorSizes(from: configuration, sizeVariationKey: sizeVariationKey)
            )
        }
        
        return TextFieldSizeConfiguration(data: data)
    }
    
    private func appearance(from configuration: TextFieldConfiguration) -> TextFieldAppearance {
        var invariantProps = configuration.props
        
        var data = [String: TextFieldAppearance.AppearanceVariation]()
        for key in TextFieldConfiguration.Style.Key.allCases {

            guard let props = configuration.view[key.rawValue]?.props else {
                print("Undefined value for key '\(key)'")
                continue
            }
            
            let mergedProps = props.merge(rhs: invariantProps)
            let cursorColor = mergedProps.cursorColor?.default ?? ""
            let optionalTitleColor = mergedProps.optionalColor?.default ?? ""
            
            data[key.rawValue] = TextFieldAppearance.AppearanceVariation(
                backgroundColor: mergedProps.backgroundColor?.default ?? "",
                backgroundColorFocused: mergedProps.backgroundColor?.value(for: [.activated]) ?? "",
                backgroundColorReadOnly: mergedProps.backgroundColor?.default ?? "",
                captionColor: mergedProps.captionColor?.default ?? "",
                captionColorFocused: cursorColor,
                captionColorReadOnly: mergedProps.captionColor?.default ?? "",
                cursorColor: cursorColor,
                disabledAlpha: mergedProps.disableAlpha?.value ?? 0.0,
                endContentColor: mergedProps.endContentColor?.default ?? "",
                endContentColorReadonly: mergedProps.endContentColorReadOnly?.default ?? "",
                endContentColorReadonlyAlpha: mergedProps.endContentColorReadOnly?.alpha ?? 0,
                optionalTitleColor: optionalTitleColor,
                placeholderColor: mergedProps.placeholderColor?.default ?? "",
                placeholderColorFocused: mergedProps.placeholderColor?.value(for: [.activated]) ?? "",
                placeholderColorReadOnly: mergedProps.placeholderColor?.default ?? "",
                requiredIndicatorColor: mergedProps.indicatorColor?.default ?? "",
                startContentColor: mergedProps.startContentColor?.default ?? "",
                textAfterColor: optionalTitleColor,
                textBeforeColor: optionalTitleColor,
                textColor: mergedProps.valueColor?.default ?? "",
                textColorFocused: mergedProps.valueColor?.default ?? "",
                textColorReadOnly: mergedProps.valueColor?.default ?? "",
                titleColor: mergedProps.valueColor?.default ?? ""
            )
        }
        
        return TextFieldAppearance(data: data)
    }
    
    private func typography(from configuration: TextFieldConfiguration) -> TextFieldTypography {
        let invariantProps = configuration.props
        let allProps = configuration.allProps
        
        var data = [String: TextFieldTypography.SizeVariation]()
        for variation in configuration.variations {
            guard let sizeVariationKey = SizeVariationKey(rawValue: variation.id) else {
                continue
            }
            let props = variation.props
            let mergedProps = props.merge(rhs: invariantProps)
            let key = sizeVariationKey.rawValue.sizeKey
            
            data[key] = TextFieldTypography.SizeVariation(
                title: configuration.child(props: allProps, key: sizeVariationKey, nodes: [.outerLabel])?.props.labelStyle?.value ?? "",
                text: mergedProps.valueStyle?.value ?? "",
                innerTitle: configuration.child(props: allProps, key: sizeVariationKey, nodes: [.innerLabel])?.props.labelStyle?.value ?? "",
                caption: mergedProps.captionStyle?.value ?? ""
            )
        }
        
        return TextFieldTypography(data: data)
    }
    
    private func extractIndicatorValues(
        from configuration: TextFieldConfiguration,
        sizeVariationKey: SizeVariationKey,
        valueExtractor: (TextFieldProps) -> (Double?, Double?)
    ) -> [String: [String: TextFieldSizeConfiguration.Size]] {
        var result = [String: [String: TextFieldSizeConfiguration.Size]]()
        
        let nodes: [TextFieldVariationNode] = [.requiredStart, .requiredEnd]
        for node in nodes {
            if let child = configuration.child(for: sizeVariationKey, nodes: [node]) {
                let (width, height) = valueExtractor(child.props)
                var current = result[sizeVariationKey.rawValue.sizeKey] ?? [:]
                current[node.rawValue] = .init(width: width ?? 0, height: height ?? 0)
                
                result[sizeVariationKey.rawValue.sizeKey] = current
            } else {
                print("key not found")
            }
        }
        
        let labelNodes: [TextFieldVariationNode] = [.innerLabel, .outerLabel]
        for labelNode in labelNodes {
            for node in nodes {
                if let child = configuration.child(for: sizeVariationKey, nodes: [labelNode, node]) {
                    let (width, height) = valueExtractor(child.props)
                    print((width, height))
                    
                    var current = result[labelNode.rawValue] ?? [:]
                    current[node.rawValue] = .init(width: width ?? 0, height: height ?? 0)
                    result[labelNode.rawValue] = current
                } else {
                    print("key not found")
                }
            }
        }
        
        return result
    }

    private func indiciatorOffsets(from configuration: TextFieldConfiguration, sizeVariationKey: SizeVariationKey) -> [String: [String: TextFieldSizeConfiguration.Size]] {
        return extractIndicatorValues(
            from: configuration,
            sizeVariationKey: sizeVariationKey
        ) { props in
            return (props.indicatorOffsetX?.value, props.indicatorOffsetY?.value)
        }
    }

    private func indiciatorSizes(from configuration: TextFieldConfiguration, sizeVariationKey: SizeVariationKey) -> [String: [String: TextFieldSizeConfiguration.Size]] {
        return extractIndicatorValues(
            from: configuration,
            sizeVariationKey: sizeVariationKey
        ) { props in
            let size = props.indicatorSize?.value
            return (size, size)
        }
    }

}
