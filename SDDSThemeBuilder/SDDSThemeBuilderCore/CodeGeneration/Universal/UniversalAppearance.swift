import Foundation
import SwiftUI

public enum UniversalRuntime {
    /// По умолчанию генерация идёт через мету. `SDDS_TYPED_GENERATOR=1` — аварийный откат
    /// на устаревший typed-путь (см. `CodeGenerationComponent.typedCommand`), нужен только
    /// на время миграции.
    public static var isEnabled: Bool = ProcessInfo.processInfo.environment["SDDS_TYPED_GENERATOR"] != "1"

    static var currentComponent: CodeGenerationComponent?
}

struct UniversalAppearance: CodeGenerationAppearance {
    typealias Props = UniversalProps

    var fields: [String: String]

    init(variation: ComponentConfiguration<UniversalProps>.Variation, component: CodeGenerationComponent) {
        self.init(props: variation.props, id: variation.id, component: component)
    }

    init(props: UniversalProps?, id: String?, component: CodeGenerationComponent) {
        var out: [String: String] = [:]
        if let props, let meta = ApiMetaStore.shared.component(component.metaName) {
            let rootParams = meta.params.filter { $0.isRoot && !$0.isUnmapped }
            for param in rootParams {
                if let value = MetaValueResolver.resolve(
                    param: param, raw: props[param.id], id: id, component: component, nullify: true, props: props
                ), !value.isEmpty {
                    out[param.methodName] = value
                }
            }
            for param in rootParams where param.copyOf != nil {
                if let source = param.copyOf, let value = out[source] { out[param.methodName] = value }
            }
        }
        self.fields = out
    }

    func context(with defaultStyle: String, fields order: [String]) -> String {
        let parts = order.map { "\($0): \(fields[$0] ?? "\(defaultStyle).\($0)")" }
        return ".init(\(parts.joined(separator: ",")))"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        fields = (try? container.decode([String: String].self)) ?? [:]
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(fields)
    }
}

struct UniversalSize: CodeGenerationSize {
    typealias Props = UniversalProps

    var fields: [String: String]

    init() {
        var out: [String: String] = [:]
        if let component = UniversalRuntime.currentComponent,
           let meta = ApiMetaStore.shared.component(component.metaName) {
            let sizeParams = meta.params.filter { $0.isSize && !$0.isUnmapped }

            for param in sizeParams {
                if let value = Self.defaultContext(for: param) {
                    out[param.methodName] = value
                }
            }
        }
        fields = out
    }

    private static func defaultContext(for param: ApiMetaParam) -> String? {
        if param.markupValue != nil || param.markupZero != nil {
            return MarkupValue.zeroValue(param: param)
        }
        switch MetaValueResolver.category(for: param, declared: nil) {
        case "dimension", "float":
            return param.paramSimpleType == "CGSize" ? CGSize.defaultContext : CGFloat.defaultContext
        case "shape" where param.paramSimpleType == "CGFloat":
            return CGFloat.defaultContext
        case "shape" where param.paramSimpleType == "PathDrawer",
             "value" where param.paramSimpleType == "PathDrawer":
            return "DefaultPathDrawer() as PathDrawer"
        case "boolean":
            return "Bool(false)"
        case "integer", "int":
            return Int.defaultContext
        case "iconSize":
            return CGFloat.defaultContext
        case "shadow":
            return ShadowTokenContextBuilder.defaultContext
        case "value":
            return param.valueEnum?.context(for: nil)
        default:
            return nil
        }
    }

    init(variation: ComponentConfiguration<UniversalProps>.Variation, nullify: Bool) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }

    init(props: UniversalProps, id: String?, nullify: Bool) {
        var out: [String: String] = [:]
        if let component = UniversalRuntime.currentComponent,
           let meta = ApiMetaStore.shared.component(component.metaName) {
            let sizeParams = meta.params.filter { $0.isSize && !$0.isUnmapped }

            for param in sizeParams {
                if let value = MetaValueResolver.resolve(
                    param: param, raw: props[param.id], id: id, component: component, nullify: nullify, props: props
                ), !value.isEmpty {
                    out[param.methodName] = value
                }
            }
        }
        self.fields = out
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        fields = (try? container.decode([String: String].self)) ?? [:]
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(fields)
    }
}
