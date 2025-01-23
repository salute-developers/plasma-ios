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
            let key = sizeVariationKey.rawValue.sizeKey
            
            data[key] = TextFieldSizeConfiguration.SizeVariation(
                titleBottomPadding: configuration.child(props: allProps, key: sizeVariationKey, nodes: [.outerLabel])?.props.labelPadding?.value ?? 0,
                titleInnerPadding: configuration.child(props: allProps, key: sizeVariationKey, nodes: [.innerLabel])?.props.labelPadding?.value ?? 0,
                textBeforeTrailingPadding: invariantProps.prefixPadding?.value ?? 0,
                textAfterLeadingPadding: invariantProps.suffixPadding?.value ?? 0,
                boxLeadingPadding: props.boxPaddingStart?.value ?? 0,
                boxTrailingPadding: props.boxPaddingEnd?.value ?? 0,
                captionTopPadding: invariantProps.helperTextPadding?.value ?? 0,
                optionalPadding: invariantProps.optionalPadding?.value ?? 0,
                shape: props.shape ?? ShapeKeyValue(),
                iconPadding: props.startContentPadding?.value ?? 0,
                iconActionPadding: props.endContentPadding?.value ?? 0,
                fieldHeight: props.boxMinHeight?.value ?? 0,
                iconSize: .init(width: props.startContentSize?.value ?? 0, height: props.startContentSize?.value ?? 0),
                iconActionSize: .init(width: props.endContentSize?.value ?? 0, height: props.endContentSize?.value ?? 0),
                chipsPadding: invariantProps.chipsPadding?.value ?? 0,
                chipContainerHorizontalPadding: props.chipsPadding?.value ?? 0,
                chipGroupHeight: 0,
                chipGroupVerticalTopPadding: 0,
                chipGroupVerticalBottomPadding: 0,
                indicatorOffsets: indiciatorOffsets(from: configuration, sizeVariationKey: sizeVariationKey),
                indicatorSizes: indiciatorSizes(from: configuration, sizeVariationKey: sizeVariationKey)
            )
            
        }
        
        return TextFieldSizeConfiguration(data: data)
    }
    
    private func appearance(from configuration: TextFieldConfiguration) -> TextFieldAppearance {
        TextFieldAppearance()
    }
    
    private func typography(from configuration: TextFieldConfiguration) -> TextFieldTypography {
        TextFieldTypography()
    }
    
    private func extractIndicatorValues(
        from configuration: TextFieldConfiguration,
        sizeVariationKey: SizeVariationKey,
        valueExtractor: (TextFieldProps) -> (Double?, Double?)
    ) -> [String: [String: TextFieldSizeConfiguration.Size]] {
        let allProps = configuration.allProps
        guard let variation = allProps[sizeVariationKey.rawValue] else {
            return [:]
        }
        
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
