import Foundation
import SwiftSyntax
import SwiftParser

/// Свойство типа (stored для struct/class, требование для protocol).
struct PropertyDecl {
    let name: String
    /// Короткое имя типа, развёрнутое из Optional/дженериков.
    let simpleType: String
    /// Тип как написан в исходнике.
    let qualifiedType: String
    /// Первый generic-аргумент (напр. `IndicatorProps` в `ComponentStyleKeyValue<IndicatorProps>`).
    let genericArgument: String?
    let apiNameOverride: String?
    let typeOverride: String?
    let ignored: Bool
    let state: String?
    let copyOf: String?
    let fromVariation: Bool
    let markupValue: String?
    let markupZero: String?
    let rawNumber: Bool
    let alwaysEmit: Bool
    let stateOnly: Bool
    /// Строка декларации свойства (1-based) — для точной вставки маркеров.
    let line: Int
}

/// Декларация типа в дереве исходников.
/// Значение enum: имя case и его id в конфиге.
struct EnumCaseDecl {
    let name: String
    let id: String
    let isDefault: Bool
}

struct TypeDecl {
    enum Kind { case structOrClass, proto, enumeration }
    let name: String
    let kind: Kind
    let properties: [PropertyDecl]
    let enumCases: [EnumCaseDecl]
    let componentOverride: String?
    let stateEnumName: String?
    let ignored: Bool
    let apiInfo: Bool
    /// Имена компонентов, которые генерятся из этого типа (`@ApiInfo(components:)`).
    let components: [String]
    /// Путь к файлу, где объявлен тип — для вставки маркеров.
    let file: String
}

/// Индекс всех типов проекта: имя типа → декларация.
final class SymbolTable {
    private(set) var types: [String: TypeDecl] = [:]
    private(set) var markerErrors: [String] = []

    func ingest(source: String, path: String = "<memory>") {
        let tree = Parser.parse(source: source)
        let converter = SourceLocationConverter(fileName: path, tree: tree)
        let collector = SymbolCollector(file: path, converter: converter)
        collector.walk(tree)
        markerErrors += collector.markerErrors
        for decl in collector.decls {
            // Первая встреченная декларация имени выигрывает (partial extensions игнорируем).
            if types[decl.name] == nil {
                types[decl.name] = decl
            }
        }
    }
}


struct MarkerSet {
    var apiInfo = false
    var component: String?
    var stateEnum: String?
    var apiName: String?
    var state: String?
    var type: String?
    var copyOf: String?
    var ignored = false
    var isDefault = false
    var fromVariation = false
    var markupValue: String?
    var markupZero: String?
    var rawNumber = false
    var alwaysEmit = false
    var stateOnly = false
    var components: [String] = []
    var unknown: [String] = []
}

enum SyntaxSupport {
    nonisolated(unsafe) static var includeDeprecated = false

    private static let categoryNames: [String: String] = [
        "componentStyle": "component_style"
    ]

    static func markers(from attributes: AttributeListSyntax) -> MarkerSet {
        var result = MarkerSet()
        for element in attributes {
            guard let attribute = element.as(AttributeSyntax.self) else { continue }
            let name = attribute.attributeName.trimmedDescription
            guard name.hasPrefix("Api") else { continue }
            let arguments = argumentList(attribute)
            switch name {
            case "ApiInfo":
                result.apiInfo = true
                for argument in arguments {
                    switch argument.label {
                    case "components": result.components.append(argument.value)
                    default: result.unknown.append("\(name)(\(argument.label ?? ""):)")
                    }
                }
            case "ApiIgnore":
                result.ignored = true
            case "ApiDefault":
                result.isDefault = true
            case "ApiFromVariation":
                result.fromVariation = true
            case "ApiRawNumber":
                result.rawNumber = true
            case "ApiAlwaysEmit":
                result.alwaysEmit = true
            case "ApiStateOnly":
                result.stateOnly = true
            case "ApiValue":
                for argument in arguments {
                    switch argument.label {
                    case nil: result.markupValue = argument.value
                    case "zero": result.markupZero = argument.value
                    default: result.unknown.append("\(name)(\(argument.label ?? ""):)")
                    }
                }
            case "ApiComponent":
                result.component = arguments.first?.value
            case "ApiStateEnum":
                result.stateEnum = arguments.first?.value
            case "ApiCopy":
                result.copyOf = arguments.first?.value
            case "ApiType":
                result.type = arguments.first.map { categoryNames[$0.value] ?? $0.value }
            case "ApiName":
                for argument in arguments {
                    switch argument.label {
                    case nil: result.apiName = argument.value
                    case "state": result.state = argument.value
                    default: result.unknown.append("\(name)(\(argument.label ?? ""):)")
                    }
                }
            default:
                result.unknown.append(name)
            }
        }
        return result
    }

    private static func argumentList(_ attribute: AttributeSyntax) -> [(label: String?, value: String)] {
        guard case let .argumentList(list) = attribute.arguments else { return [] }
        return list.flatMap { argument -> [(label: String?, value: String)] in
            let label = argument.label?.text
            let expression = argument.expression
            // Литерал массива раскрывается в несколько значений с общим лейблом.
            if let array = expression.as(ArrayExprSyntax.self) {
                return array.elements.compactMap { element in
                    element.expression.as(StringLiteralExprSyntax.self)
                        .map { (label, $0.segments.trimmedDescription) }
                }
            }
            if let literal = expression.as(StringLiteralExprSyntax.self) {
                return [(label, literal.segments.trimmedDescription)]
            }
            if let member = expression.as(MemberAccessExprSyntax.self) {
                return [(label, member.declName.baseName.text)]
            }
            return [(label, expression.trimmedDescription)]
        }
    }

    /// Короткое имя типа + первый generic-аргумент, развёрнутое из Optional/IUO/массивов.
    static func unwrap(_ type: TypeSyntax) -> (simple: String, generic: String?) {
        if let optional = type.as(OptionalTypeSyntax.self) {
            return unwrap(optional.wrappedType)
        }
        if let iuo = type.as(ImplicitlyUnwrappedOptionalTypeSyntax.self) {
            return unwrap(iuo.wrappedType)
        }
        if let array = type.as(ArrayTypeSyntax.self) {
            let inner = unwrap(array.element)
            return ("Array", inner.simple)
        }
        if let identifier = type.as(IdentifierTypeSyntax.self) {
            let name = identifier.name.text
            var generic: String?
            if let args = identifier.genericArgumentClause?.arguments.first?.argument.as(TypeSyntax.self) {
                generic = unwrap(args).simple
            }
            return (name, generic)
        }
        if let member = type.as(MemberTypeSyntax.self) {
            return (member.name.text, nil)
        }
        // Функции, кортежи и прочее — как есть, без раскрытия.
        return (type.trimmedDescription, nil)
    }
}

// MARK: - Обход дерева

private final class SymbolCollector: SyntaxVisitor {
    var decls: [TypeDecl] = []
    var markerErrors: [String] = []
    let file: String
    let converter: SourceLocationConverter

    init(file: String, converter: SourceLocationConverter) {
        self.file = file
        self.converter = converter
        super.init(viewMode: .sourceAccurate)
    }

    override func visit(_ node: StructDeclSyntax) -> SyntaxVisitorContinueKind {
        collect(name: node.name.text, kind: .structOrClass, members: node.memberBlock, attributes: node.attributes)
        return .visitChildren
    }

    override func visit(_ node: ClassDeclSyntax) -> SyntaxVisitorContinueKind {
        collect(name: node.name.text, kind: .structOrClass, members: node.memberBlock, attributes: node.attributes)
        return .visitChildren
    }

    override func visit(_ node: ProtocolDeclSyntax) -> SyntaxVisitorContinueKind {
        collect(name: node.name.text, kind: .proto, members: node.memberBlock, attributes: node.attributes)
        return .visitChildren
    }

    override func visit(_ node: EnumDeclSyntax) -> SyntaxVisitorContinueKind {
        var cases: [EnumCaseDecl] = []
        for member in node.memberBlock.members {
            guard let caseDecl = member.decl.as(EnumCaseDeclSyntax.self) else { continue }
            let caseMarkers = SyntaxSupport.markers(from: caseDecl.attributes)
            for element in caseDecl.elements {
                let name = element.name.text
                cases.append(EnumCaseDecl(
                    name: name,
                    id: caseMarkers.apiName ?? name,
                    isDefault: caseMarkers.isDefault
                ))
            }
        }
        let markers = SyntaxSupport.markers(from: node.attributes)
        decls.append(TypeDecl(
            name: node.name.text,
            kind: .enumeration,
            properties: [],
            enumCases: cases,
            componentOverride: markers.component,
            stateEnumName: markers.stateEnum,
            ignored: markers.ignored,
            apiInfo: markers.apiInfo,
            components: markers.components,
            file: file
        ))
        return .visitChildren
    }

    private func validateMarkers(_ markers: MarkerSet, at line: Int, subject: String) {
        for name in markers.unknown {
            markerErrors.append("\(file):\(line): неизвестный маркер `@\(name)` у `\(subject)`")
        }
    }

    private func collect(name: String, kind: TypeDecl.Kind, members: MemberBlockSyntax, attributes: AttributeListSyntax) {
        let isProtocol = (kind == .proto)
        var properties: [PropertyDecl] = []
        for member in members.members {
            guard let variable = member.decl.as(VariableDeclSyntax.self) else { continue }
            if isStatic(variable) { continue }
            let markers = SyntaxSupport.markers(from: variable.attributes)
            let marked = markers.apiName != nil || markers.markupValue != nil || markers.markupZero != nil
            if isDeprecated(variable), !marked, !SyntaxSupport.includeDeprecated { continue }
            let line = converter.location(for: variable.positionAfterSkippingLeadingTrivia).line
            for binding in variable.bindings {
                guard let idPattern = binding.pattern.as(IdentifierPatternSyntax.self),
                      let type = binding.typeAnnotation?.type else { continue }
                // struct/class: только stored; protocol: все требования-var.
                if !isProtocol, isComputed(binding), !marked, !SyntaxSupport.includeDeprecated { continue }
                let unwrapped = SyntaxSupport.unwrap(type)
                validateMarkers(markers, at: line, subject: idPattern.identifier.text)
                properties.append(PropertyDecl(
                    name: idPattern.identifier.text,
                    simpleType: unwrapped.simple,
                    qualifiedType: type.trimmedDescription,
                    genericArgument: unwrapped.generic,
                    apiNameOverride: markers.apiName,
                    typeOverride: markers.type,
                    ignored: markers.ignored,
                    state: markers.state,
                    copyOf: markers.copyOf,
                    fromVariation: markers.fromVariation,
                    markupValue: markers.markupValue,
                    markupZero: markers.markupZero,
                    rawNumber: markers.rawNumber,
                    alwaysEmit: markers.alwaysEmit,
                    stateOnly: markers.stateOnly,
                    line: line
                ))
            }
        }
        // Функция-требование со значением из разметки: шаблон генерит её как
        // `func <имя><значение>`, поэтому имя параметра — `func<имя>`.
        for member in members.members {
            guard let function = member.decl.as(FunctionDeclSyntax.self) else { continue }
            let functionMarkers = SyntaxSupport.markers(from: function.attributes)
            guard functionMarkers.markupValue != nil || functionMarkers.markupZero != nil else { continue }
            properties.append(PropertyDecl(
                name: "func\(function.name.text)",
                simpleType: "String",
                qualifiedType: "String",
                genericArgument: nil,
                apiNameOverride: functionMarkers.apiName,
                typeOverride: functionMarkers.type,
                ignored: false,
                state: nil,
                copyOf: nil,
                fromVariation: false,
                markupValue: functionMarkers.markupValue,
                markupZero: functionMarkers.markupZero,
                rawNumber: functionMarkers.rawNumber,
                alwaysEmit: functionMarkers.alwaysEmit,
                stateOnly: functionMarkers.stateOnly,
                line: converter.location(for: function.positionAfterSkippingLeadingTrivia).line
            ))
        }
        let markers = SyntaxSupport.markers(from: attributes)
        validateMarkers(markers, at: converter.location(for: members.position).line, subject: name)
        decls.append(TypeDecl(
            name: name,
            kind: kind,
            properties: properties,
            enumCases: [],
            componentOverride: markers.component,
            stateEnumName: markers.stateEnum,
            ignored: markers.ignored,
            apiInfo: markers.apiInfo,
            components: markers.components,
            file: file
        ))
    }

    private func isStatic(_ variable: VariableDeclSyntax) -> Bool {
        variable.modifiers.contains { $0.name.tokenKind == .keyword(.static) || $0.name.tokenKind == .keyword(.class) }
    }

    private func isDeprecated(_ variable: VariableDeclSyntax) -> Bool {
        variable.attributes.contains { attr in
            attr.as(AttributeSyntax.self)?.trimmedDescription.contains("deprecated") ?? false
        }
    }

    /// Computed = есть accessor-блок с геттером или кодом (не только willSet/didSet).
    private func isComputed(_ binding: PatternBindingSyntax) -> Bool {
        guard let accessor = binding.accessorBlock else { return false }
        switch accessor.accessors {
        case .getter:
            return true
        case .accessors(let list):
            return list.contains { acc in
                switch acc.accessorSpecifier.tokenKind {
                case .keyword(.get), .keyword(._read), .keyword(.unsafeAddress):
                    return true
                default:
                    return false
                }
            }
        }
    }
}
