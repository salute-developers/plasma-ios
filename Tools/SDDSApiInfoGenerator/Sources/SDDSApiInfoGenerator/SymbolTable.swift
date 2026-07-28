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
    /// Override имени в конфиге (`// sdds:apiName=<id>`).
    let apiNameOverride: String?
    /// Override категории (`// sdds:type=<category>`).
    let typeOverride: String?
    /// Пропустить свойство (`// sdds:ignore`).
    let ignored: Bool
    /// Строка декларации свойства (1-based) — для точной вставки маркеров.
    let line: Int
}

/// Декларация типа в дереве исходников.
struct TypeDecl {
    enum Kind { case structOrClass, proto, enumeration }
    let name: String
    let kind: Kind
    let properties: [PropertyDecl]
    let enumCases: [String]
    /// Override имени компонента (`// sdds:component=<Name>`) на struct.
    let componentOverride: String?
    /// Имя enum состояний (`// sdds:stateEnum=<Name>`) на struct.
    let stateEnumName: String?
    /// Не считать компонентом/не рекурсить (`// sdds:ignore`) на struct.
    let ignored: Bool
    /// Помечен ли `// sdds:apiInfo` (компонент-аннотация, opt-in).
    let apiInfo: Bool
    /// Путь к файлу, где объявлен тип — для вставки маркеров.
    let file: String
}

/// Индекс всех типов проекта: имя типа → декларация.
final class SymbolTable {
    private(set) var types: [String: TypeDecl] = [:]

    func ingest(source: String, path: String = "<memory>") {
        let tree = Parser.parse(source: source)
        let converter = SourceLocationConverter(fileName: path, tree: tree)
        let collector = SymbolCollector(file: path, converter: converter)
        collector.walk(tree)
        for decl in collector.decls {
            // Первая встреченная декларация имени выигрывает (partial extensions игнорируем).
            if types[decl.name] == nil {
                types[decl.name] = decl
            }
        }
    }
}

// MARK: - Извлечение marker-комментов и имён типов

enum SyntaxSupport {
    /// Собирает все строки line/block-комментов из trivia.
    static func comments(from trivia: Trivia) -> [String] {
        trivia.compactMap { piece in
            switch piece {
            case .lineComment(let text), .blockComment(let text):
                return text
            case .docLineComment(let text), .docBlockComment(let text):
                return text
            default:
                return nil
            }
        }
    }

    /// Ищет `sdds:<key>=<value>` в списке комментов.
    static func marker(_ key: String, in comments: [String]) -> String? {
        let needle = "sdds:\(key)="
        for comment in comments {
            guard let range = comment.range(of: needle) else { continue }
            let tail = comment[range.upperBound...]
            let value = tail.prefix { $0 != " " && $0 != "\t" && $0 != "*" && $0 != "/" }
            let trimmed = value.trimmingCharacters(in: .whitespaces)
            if !trimmed.isEmpty { return trimmed }
        }
        return nil
    }

    /// Есть ли флаг `sdds:<flag>` (без значения) в комментах.
    static func flag(_ flag: String, in comments: [String]) -> Bool {
        let needle = "sdds:\(flag)"
        return comments.contains { $0.contains(needle) && marker(flag, in: [$0]) == nil }
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
    let file: String
    let converter: SourceLocationConverter

    init(file: String, converter: SourceLocationConverter) {
        self.file = file
        self.converter = converter
        super.init(viewMode: .sourceAccurate)
    }

    override func visit(_ node: StructDeclSyntax) -> SyntaxVisitorContinueKind {
        collect(name: node.name.text, kind: .structOrClass, members: node.memberBlock, leading: node.leadingTrivia)
        return .visitChildren
    }

    override func visit(_ node: ClassDeclSyntax) -> SyntaxVisitorContinueKind {
        collect(name: node.name.text, kind: .structOrClass, members: node.memberBlock, leading: node.leadingTrivia)
        return .visitChildren
    }

    override func visit(_ node: ProtocolDeclSyntax) -> SyntaxVisitorContinueKind {
        collect(name: node.name.text, kind: .proto, members: node.memberBlock, leading: node.leadingTrivia)
        return .visitChildren
    }

    override func visit(_ node: EnumDeclSyntax) -> SyntaxVisitorContinueKind {
        var cases: [String] = []
        for member in node.memberBlock.members {
            guard let caseDecl = member.decl.as(EnumCaseDeclSyntax.self) else { continue }
            for element in caseDecl.elements {
                cases.append(element.name.text)
            }
        }
        let comments = SyntaxSupport.comments(from: node.leadingTrivia)
        decls.append(TypeDecl(
            name: node.name.text,
            kind: .enumeration,
            properties: [],
            enumCases: cases,
            componentOverride: SyntaxSupport.marker("component", in: comments),
            stateEnumName: SyntaxSupport.marker("stateEnum", in: comments),
            ignored: SyntaxSupport.flag("ignore", in: comments),
            apiInfo: SyntaxSupport.flag("apiInfo", in: comments),
            file: file
        ))
        return .visitChildren
    }

    private func collect(name: String, kind: TypeDecl.Kind, members: MemberBlockSyntax, leading: Trivia) {
        let isProtocol = (kind == .proto)
        var properties: [PropertyDecl] = []
        for member in members.members {
            guard let variable = member.decl.as(VariableDeclSyntax.self) else { continue }
            if isStatic(variable) { continue }
            if isDeprecated(variable) { continue }
            let comments = SyntaxSupport.comments(from: variable.leadingTrivia)
                + SyntaxSupport.comments(from: variable.trailingTrivia)
            let line = converter.location(for: variable.positionAfterSkippingLeadingTrivia).line
            for binding in variable.bindings {
                guard let idPattern = binding.pattern.as(IdentifierPatternSyntax.self),
                      let type = binding.typeAnnotation?.type else { continue }
                // struct/class: только stored; protocol: все требования-var.
                if !isProtocol && isComputed(binding) { continue }
                let unwrapped = SyntaxSupport.unwrap(type)
                properties.append(PropertyDecl(
                    name: idPattern.identifier.text,
                    simpleType: unwrapped.simple,
                    qualifiedType: type.trimmedDescription,
                    genericArgument: unwrapped.generic,
                    apiNameOverride: SyntaxSupport.marker("apiName", in: comments),
                    typeOverride: SyntaxSupport.marker("type", in: comments),
                    ignored: SyntaxSupport.flag("ignore", in: comments),
                    line: line
                ))
            }
        }
        let comments = SyntaxSupport.comments(from: leading)
        decls.append(TypeDecl(
            name: name,
            kind: kind,
            properties: properties,
            enumCases: [],
            componentOverride: SyntaxSupport.marker("component", in: comments),
            stateEnumName: SyntaxSupport.marker("stateEnum", in: comments),
            ignored: SyntaxSupport.flag("ignore", in: comments),
            apiInfo: SyntaxSupport.flag("apiInfo", in: comments),
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
