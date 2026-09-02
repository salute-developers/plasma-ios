import Foundation
import SwiftSyntax
import SwiftParser

/// Извлекает `// @DocSample`-сэмплы из Swift-исходника через SwiftSyntax:
/// - `struct X: View` → содержимое `var body: some View { ... }`;
/// - `func x(...)` → тело функции;
/// - обёртка `swiftCodeSnippet { ... }` разворачивается по AST (устойчиво к
///   `{`/`}` в строковых литералах — слабое место текстового парсинга);
/// - `placeholder(<expr>, "текст")` сворачивается в `"текст"`;
/// - текст деиндентируется до минимального общего отступа.
public enum SampleExtractor {

    public static func extract(source: String) -> [ExtractedSample] {
        let tree = Parser.parse(source: source)
        let visitor = DocSampleVisitor(viewMode: .sourceAccurate, source: source)
        visitor.walk(tree)
        return visitor.samples
    }

    // MARK: - Visitor

    private final class DocSampleVisitor: SyntaxVisitor {
        let source: String
        var samples: [ExtractedSample] = []

        init(viewMode: SyntaxTreeViewMode, source: String) {
            self.source = source
            super.init(viewMode: viewMode)
        }

        override func visit(_ node: StructDeclSyntax) -> SyntaxVisitorContinueKind {
            guard let marker = marker(from: node.leadingTrivia) else { return .visitChildren }
            guard isView(node), let body = viewBody(of: node) else { return .visitChildren }
            appendSample(
                name: node.name.text,
                marker: marker,
                kind: "view",
                statements: body
            )
            return .skipChildren
        }

        override func visit(_ node: FunctionDeclSyntax) -> SyntaxVisitorContinueKind {
            guard let marker = marker(from: node.leadingTrivia),
                  let body = node.body else { return .visitChildren }
            appendSample(
                name: node.name.text,
                marker: marker,
                kind: "regular",
                statements: body.statements
            )
            return .skipChildren
        }

        // MARK: - Marker

        private func marker(from trivia: Trivia) -> DocSampleMarker? {
            for piece in trivia {
                if case .lineComment(let text) = piece,
                   let marker = DocSampleMarker.parse(commentText: text) {
                    return marker
                }
            }
            return nil
        }

        // MARK: - View body

        private func isView(_ node: StructDeclSyntax) -> Bool {
            node.inheritanceClause?.inheritedTypes.contains {
                $0.type.trimmedDescription == "View"
            } ?? false
        }

        private func viewBody(of node: StructDeclSyntax) -> CodeBlockItemListSyntax? {
            for member in node.memberBlock.members {
                guard let variable = member.decl.as(VariableDeclSyntax.self),
                      let binding = variable.bindings.first,
                      binding.pattern.trimmedDescription == "body",
                      let accessor = binding.accessorBlock,
                      case .getter(let statements) = accessor.accessors else { continue }
                return statements
            }
            return nil
        }

        // MARK: - Snippet assembly

        private func appendSample(
            name: String,
            marker: DocSampleMarker,
            kind: String,
            statements: CodeBlockItemListSyntax
        ) {
            let effective = unwrapCodeSnippet(statements) ?? statements
            let start = effective.positionAfterSkippingLeadingTrivia.utf8Offset
            let end = effective.endPositionBeforeTrailingTrivia.utf8Offset
            let collapsed = PlaceholderRewriter().rewrite(Syntax(effective))
            let text = deindent(collapsed.description)
            samples.append(ExtractedSample(
                name: name,
                marker: marker,
                kind: kind,
                snippet: text,
                startOffset: start,
                endOffset: end
            ))
        }

        /// Если единственный statement — вызов `swiftCodeSnippet { ... }`,
        /// возвращает содержимое замыкания.
        private func unwrapCodeSnippet(_ statements: CodeBlockItemListSyntax) -> CodeBlockItemListSyntax? {
            guard statements.count == 1,
                  let item = statements.first,
                  let call = item.item.as(FunctionCallExprSyntax.self),
                  call.calledExpression.trimmedDescription == "swiftCodeSnippet",
                  let closure = call.trailingClosure else { return nil }
            return closure.statements
        }

        private func deindent(_ text: String) -> String {
            let lines = text
                .trimmingCharacters(in: .newlines)
                .components(separatedBy: "\n")
            let minIndent = lines
                .filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
                .map { $0.prefix { $0 == " " }.count }
                .min() ?? 0
            return lines
                .map { String($0.dropFirst(min(minIndent, $0.prefix { $0 == " " }.count))) }
                .joined(separator: "\n")
        }
    }

    // MARK: - placeholder(...) collapse

    /// Заменяет `placeholder(<expr>, "текст")` на строковый литерал `"текст"`
    /// (второй аргумент) — как sed-замена в старом экстракторе, но по AST.
    private final class PlaceholderRewriter: SyntaxRewriter {
        override func visit(_ node: FunctionCallExprSyntax) -> ExprSyntax {
            guard node.calledExpression.trimmedDescription == "placeholder",
                  node.arguments.count == 2,
                  let literal = node.arguments.last?.expression.as(StringLiteralExprSyntax.self) else {
                return super.visit(node)
            }
            var replacement = literal.trimmed
            replacement.leadingTrivia = node.leadingTrivia
            replacement.trailingTrivia = node.trailingTrivia
            return ExprSyntax(replacement)
        }
    }
}
