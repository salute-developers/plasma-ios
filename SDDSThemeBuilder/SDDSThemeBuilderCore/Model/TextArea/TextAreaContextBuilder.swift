import Foundation

final class TextAreaContextBuilder {
    let configuration: TextAreaConfiguration
    
    init(configuration: TextAreaConfiguration) {
        self.configuration = configuration
    }
    
    func build() -> TextAreaContext {
        return TextAreaContext(
            sizeConfiguration: sizeConfiguration(from: configuration),
            appearance: appearance(from: configuration),
            typography: typography(from: configuration)
        )
    }
    
    private func sizeConfiguration(from configuration: TextAreaConfiguration) -> TextAreaSizeConfiguration {
        let invariantProps = configuration.props
        let allProps = configuration.allProps
        
        var data = [String: TextAreaSizeConfiguration.SizeVariation]()
        for variation in configuration.variations {
            guard let sizeVariationKey = SizeVariationKey(rawValue: variation.id) else {
                continue
            }
            let props = variation.props
            let mergedProps = props.merge(rhs: invariantProps)
            let key = sizeVariationKey.rawValue.sizeKey
            
            data[key] = TextAreaSizeConfiguration.SizeVariation(
                titleBottomPadding: configuration.child(props: allProps, key: sizeVariationKey, nodes: [.outerLabel])?.props.labelPadding?.value ?? 0,
                titleInnerPadding: configuration.child(props: allProps, key: sizeVariationKey, nodes: [.innerLabel])?.props.labelPadding?.value ?? 0,
                textBeforeTrailingPadding: mergedProps.prefixPadding?.value ?? 0,
                textAfterLeadingPadding: mergedProps.suffixPadding?.value ?? 0,
                boxLeadingPadding: mergedProps.boxPaddingStart?.value ?? 0,
                boxTrailingPadding: mergedProps.boxPaddingEnd?.value ?? 0,
                captionTopPadding: mergedProps.helperTextPadding?.value ?? 0,
                captionBottomPadding: mergedProps.helperTextPadding?.value ?? 0,
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
                indicatorOffsets: indicatorOffsets(from: configuration, sizeVariationKey: sizeVariationKey),
                indicatorSizes: indicatorSizes(from: configuration, sizeVariationKey: sizeVariationKey),
                boxPaddingTops: boxPaddings(props: mergedProps, from: configuration, sizeVariationKey: sizeVariationKey, keyPath: \TextAreaProps.boxPaddingTop),
                boxPaddingBottoms: boxPaddings(props: mergedProps, from: configuration, sizeVariationKey: sizeVariationKey, keyPath: \TextAreaProps.boxPaddingBottom)
            )
        }
        
        return TextAreaSizeConfiguration(data: data)
    }
    
    private func appearance(from configuration: TextAreaConfiguration) -> TextAreaAppearance {
        let invariantProps = configuration.props
        
        var data = [String: TextAreaAppearance.AppearanceVariation]()
        for key in TextAreaConfiguration.Style.Key.allCases {

            guard let props = configuration.view[key.rawValue]?.props else {
                print("Undefined value for key '\(key)'")
                continue
            }
            
            let mergedProps = props.merge(rhs: invariantProps)
            let cursorColor = mergedProps.cursorColor?.default ?? ""
            let optionalTitleColor = mergedProps.optionalColor?.default ?? ""
            
            data[key.rawValue] = TextAreaAppearance.AppearanceVariation(
                backgroundColor: mergedProps.backgroundColor?.default ?? "",
                backgroundColorFocused: mergedProps.backgroundColor?.value(for: [.activated]) ?? "",
                backgroundColorReadOnly: mergedProps.backgroundColor?.default ?? "",
                captionColor: mergedProps.captionColor?.default ?? "",
                captionColorFocused: cursorColor,
                captionColorReadOnly: mergedProps.captionColor?.default ?? "",
                counterColor: mergedProps.counterColor?.default ?? "",
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
        
        return TextAreaAppearance(data: data)
    }
    
    private func typography(from configuration: TextAreaConfiguration) -> TextAreaTypography {
        let invariantProps = configuration.props
        let allProps = configuration.allProps
        
        var data = [String: TextAreaTypography.SizeVariation]()
        for variation in configuration.variations {
            guard let sizeVariationKey = SizeVariationKey(rawValue: variation.id) else {
                continue
            }
            let props = variation.props
            let mergedProps = props.merge(rhs: invariantProps)
            let key = sizeVariationKey.rawValue.sizeKey
            
            data[key] = TextAreaTypography.SizeVariation(
                title: configuration.child(props: allProps, key: sizeVariationKey, nodes: [.outerLabel])?.props.labelStyle?.value ?? "",
                text: mergedProps.valueStyle?.value ?? "",
                innnerTitle: configuration.child(props: allProps, key: sizeVariationKey, nodes: [.innerLabel])?.props.labelStyle?.value ?? "",
                caption: mergedProps.captionStyle?.value ?? "",
                counter: mergedProps.counterStyle?.value ?? ""
            )
        }
        
        return TextAreaTypography(data: data)
    }
    
    private func extractIndicatorValues<Value>(
        from configuration: TextAreaConfiguration,
        sizeVariationKey: SizeVariationKey,
        valueExtractor: (TextAreaProps) -> (Value?)
    ) -> [String: [String: Value]] {
        var result = [String: [String: Value]]()
        
        let nodes: [TextAreaVariationNode] = [.requiredStart, .requiredEnd]
        for node in nodes {
            if let child = configuration.child(for: sizeVariationKey, nodes: [node]) {
                let extractedValue = valueExtractor(child.props)
                var current = result[sizeVariationKey.rawValue.sizeKey] ?? [:]
                current[node.rawValue] = extractedValue
                
                result[sizeVariationKey.rawValue.sizeKey] = current
            } else {
                print("key not found")
            }
        }
        
        let labelNodes: [TextAreaVariationNode] = [.innerLabel, .outerLabel]
        for labelNode in labelNodes {
            for node in nodes {
                if let child = configuration.child(for: sizeVariationKey, nodes: [labelNode, node]) {
                    let extractedValue = valueExtractor(child.props)
                    
                    var current = result[labelNode.rawValue] ?? [:]
                    current[node.rawValue] = extractedValue
                    result[labelNode.rawValue] = current
                } else {
                    print("key not found")
                }
            }
        }
        
        return result
    }
    
    private func boxPaddings(props: TextAreaProps, from configuration: TextAreaConfiguration, sizeVariationKey: SizeVariationKey, keyPath: AnyKeyPath) -> [String: Double] {
        var result = [String: Double]()
        
        let defaultValue = (props[keyPath] as? KeyValue<Double>)?.value ?? 0.0
        let nodes: [TextAreaVariationNode] = [.default, .innerLabel, .outerLabel]
        for node in nodes {
            let padding: Double
            if let child = configuration.child(props: configuration.allProps, key: sizeVariationKey, nodes: [node]),
                let keyValue = child.props[keyPath] as? KeyValue<Double> {
                padding = keyValue.value ?? 0.0
            } else {
                padding = defaultValue
            }
            result[node.rawValue] = padding
        }
        
        return result
    }

    private func indicatorOffsets(from configuration: TextAreaConfiguration, sizeVariationKey: SizeVariationKey) -> [String: [String: TextAreaSizeConfiguration.Size]] {
        return extractIndicatorValues(
            from: configuration,
            sizeVariationKey: sizeVariationKey
        ) { props in
            return TextAreaSizeConfiguration.Size(width: props.indicatorOffsetX?.value ?? 0, height: props.indicatorOffsetY?.value ?? 0)
        }
    }

    private func indicatorSizes(from configuration: TextAreaConfiguration, sizeVariationKey: SizeVariationKey) -> [String: [String: TextAreaSizeConfiguration.Size]] {
        return extractIndicatorValues(
            from: configuration,
            sizeVariationKey: sizeVariationKey
        ) { props in
            return TextAreaSizeConfiguration.Size(width: props.indicatorSize?.value ?? 0, height: props.indicatorSize?.value ?? 0)
        }
    }

}
