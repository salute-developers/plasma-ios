import Foundation

enum MetaValueResolver {

    private struct StringHolder: Codable { let value: String? }
    struct StyleHolder: Codable { let value: String?; let props: UniversalProps? }
    private struct TypeHolder: Codable { let type: String? }

    private static let forcedEnumTypes: Set<String> = ["DrawerCloseIconPlacement"]

    static func category(for param: ApiMetaParam, declared: String?) -> String {
        if param.type == "iconSize" { return param.type }
        if forcedEnumTypes.contains(param.paramSimpleType) { return "value" }
        if param.paramSimpleType == "TypographyConfiguration" { return "typography" }
        if param.paramSimpleType == "PathDrawer" { return "shape" }
        return declared.flatMap { configCategories.contains($0) ? $0 : nil } ?? param.type
    }

    static let configCategories: Set<String> = ["color", "shape", "shadow", "icon", "typography", "component_style"]

    static func resolve(
        param: ApiMetaParam,
        raw: AnyJSON?,
        id: String?,
        component: CodeGenerationComponent,
        nullify: Bool,
        props: UniversalProps? = nil
    ) -> String? {
        let nullify = param.alwaysEmit == true ? false : nullify
        let declared = raw?.decoded(TypeHolder.self)?.type
        let category = Self.category(for: param, declared: declared)

        // Значение из разметки не читает конфиг по своему id: оно либо литерал,
        // либо собирается из перечисленных в разметке ключей.
        if let expression = param.markupValue {
            return MarkupValue.value(expression: expression, props: props, nullify: nullify)
        }
        if let state = param.componentState {
            return stateValue(param: param, raw: raw, state: state, category: category,
                              id: id, component: component, nullify: nullify)
        }

        switch category {
        case "color":
            return color(raw: raw, simpleType: param.paramSimpleType)
        case "typography":
            let string = raw?.decoded(KeyValue<String>.self)?.value
            return TypographyTokenContextBuilder(string: string, id: id, component: component).context
        case "dimension", "float":
            let value = raw?.decoded(KeyValue<Double>.self)?.value
                ?? raw?.decoded(KeyValue<String>.self)?.value.flatMap(Double.init)
            if param.rawNumber == true {
                return value.map { String($0) }
            }
            return CGFloatContextBuilder(value, nullify: nullify).context
        case "shape":
            let shape = raw?.decoded(ShapeKeyValue.self)
            if param.paramSimpleType == "PathDrawer" {
                return PathDrawerContextBuilder(shape: shape, nullify: nullify).context
            }
            return ShapeTokenContextBuilder(shape: shape, nullify: nullify).context
        case "shadow":
            return ShadowTokenContextBuilder(shadow: raw?.decoded(ShadowKeyValue.self)).context
        case "iconSize":
            return ImageSizeContextBuilder(raw?.decoded(KeyValue<String>.self)?.value, nullify: nullify).context
        case "icon":
            return ImageContextBuilder(raw?.decoded(KeyValue<String>.self)?.value).context
        case "component_style":
            let string = raw?.decoded(StringHolder.self)?.value
            guard let string else { return nil }
            return ComponentStyleContextBuilder(string).context
        case "boolean":
            return BoolContextBuilder(raw?.decoded(KeyValue<Bool>.self)?.value, nullify: nullify).context
        case "integer", "int":
            if component.metaName == "PaginationDots", param.methodName == "edgeCount" {
                return PaginationDotsEdgeCountContextBuilder(
                    value: raw?.decoded(KeyValue<String>.self)?.value, nullify: nullify
                ).context
            }
            if let value = raw?.decoded(KeyValue<Double>.self)?.value {
                return "Int(\(Int(value)))"
            }
            return nullify ? nil : "Int(0)"
        case "value":
            if param.paramSimpleType == "PathDrawer" {
                return PathDrawerContextBuilder(shape: raw?.decoded(ShapeKeyValue.self), nullify: nullify).context
            }
            let string = raw?.decoded(StringHolder.self)?.value
            // Значения enum'а описаны в мете (case'ы и их id в конфиге), поэтому
            // отображение значения на case не требует знания о компоненте.
            if let valueEnum = param.valueEnum {
                // Значения части свойств конфиг не несёт — их задаёт сама вариация
                // (`l.required-end` → `.right`), что и помечено в разметке.
                if param.fromVariation == true {
                    return valueEnum.context(for: id?.lastKey)
                }
                if let string { return valueEnum.context(for: string) }
                return nullify ? nil : valueEnum.context(for: nil)
            }
            return nullify ? nil : string.map { "\(param.paramSimpleType).\($0.camelCase)" }
        default:
            return nil
        }
    }

    private static func stateValue(param: ApiMetaParam, raw: AnyJSON?, state: ComponentState,
                                   category: String, id: String?, component: CodeGenerationComponent,
                                   nullify: Bool) -> String? {
        switch category {
        case "color":
            return ColorTokenContextBuilder(raw?.decoded(ColorKeyValue.self)?.value(for: state)).context
        case "typography":
            let kv = raw?.decoded(KeyValue<String>.self)
            return TypographyTokenContextBuilder(string: kv?.value(for: state)?.value, id: id, component: component).context
        default:
            let kv = raw?.decoded(KeyValue<Double>.self)
            let value = param.stateOnly == true
                ? kv?.stateOnlyValue(for: state)?.value
                : kv?.value(for: state)?.value
            return CGFloatContextBuilder(value, nullify: nullify).context
        }
    }

    private static func color(raw: AnyJSON?, simpleType: String) -> String? {
        guard let raw else { return nil }
        let colorKV = raw.decoded(ColorKeyValue.self)
        switch simpleType {
        case "StatefulColor":
            return ButtonColorContextBuilder(statefulColor: colorKV, outputType: .statefulColor).context
        case "ButtonColor":
            return ButtonColorContextBuilder(statefulColor: colorKV, outputType: .buttonColor).context
        case "StatefulFillStyle":
            return StatefulFillStyleContextBuilder(colorKV).context
        case "FillStyle":
            return FillStyleContextBuilder(colorKV).context
        default:
            return ColorTokenContextBuilder(colorKV).context
        }
    }
}
