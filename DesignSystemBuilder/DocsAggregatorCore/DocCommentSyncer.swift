import Foundation
import SwiftSyntax
import SwiftParser

/// Подставляет сниппеты из фикстур в примеры внутри doc-комментариев исходников.
///
/// Формат такой же, как в markdown (`MarkerRenderer`): первая строка swift-фенса —
/// маркер `// @sample: <путь>`, всё до закрывающего фенса считается сгенерированным
/// и переписывается. Маркер остаётся в комментарии как указание на источник; Xcode
/// Quick Help показывает его обычной строкой кода.
///
///     /**
///      ## Example
///
///      ```swift
///      // @sample: SDDSComponentsFixtures/Samples/Card/SDDSCard_Simple.swift
///      SDDSCard { Text("Header") }
///      ```
///      */
///
/// Сэмпл резолвится по basename пути — как и в `MarkerRenderer`, id уникален после
/// дедупликации на этапе `docs extract`, поэтому путь в маркере читаемый, но не
/// обязан совпадать с раскладкой каталогов.
public enum DocCommentSyncer {

    public struct FileChange: Equatable {
        public let file: String
        public let markers: Int

        public init(file: String, markers: Int) {
            self.file = file
            self.markers = markers
        }
    }

    public enum SyncError: Error, CustomStringConvertible, Equatable {
        case unresolvedSample(file: String, line: Int, marker: String)

        public var description: String {
            switch self {
            case let .unresolvedSample(file, line, marker):
                return "\(file):\(line): не найден сэмпл '\(marker)'"
            }
        }
    }

    private static let markerToken = "// @sample:"
    private static let fence = "```"

    /// Переписывает примеры в одном исходнике.
    /// - Returns: новый текст и число обработанных маркеров. Текст равен исходному,
    ///   если менять нечего — решение о записи принимает вызывающий.
    public static func sync(
        source: String,
        snippetsByBasename: [String: String],
        file: String
    ) throws -> (text: String, markers: Int) {
        let docLines = docCommentLineNumbers(in: source)
        guard !docLines.isEmpty else { return (source, 0) }

        let lines = source.components(separatedBy: "\n")
        var output: [String] = []
        var index = 0
        var markers = 0

        while index < lines.count {
            let line = lines[index]
            guard docLines.contains(index), let range = line.range(of: markerToken) else {
                output.append(line)
                index += 1
                continue
            }

            let marker = line[range.upperBound...].trimmingCharacters(in: .whitespaces)
            let basename = (marker as NSString).lastPathComponent
            guard let snippet = snippetsByBasename[basename] else {
                throw SyncError.unresolvedSample(file: file, line: index + 1, marker: marker)
            }

            // Без закрывающего фенса непонятно, где кончается сгенерированный кусок:
            // оставляем строку как есть, чтобы не съесть чужой текст.
            guard let closing = closingFenceIndex(in: lines, after: index, docLines: docLines) else {
                output.append(line)
                index += 1
                continue
            }

            markers += 1
            let prefix = String(line[line.startIndex..<range.lowerBound])
            output.append(line)
            output.append(contentsOf: renderSnippet(snippet, prefix: prefix))
            index = closing
        }

        return (output.joined(separator: "\n"), markers)
    }

    /// Сниппет с отступом комментария; пустые строки без хвостовых пробелов —
    /// их ловит правило trailing_whitespace.
    private static func renderSnippet(_ snippet: String, prefix: String) -> [String] {
        let body = snippet
            .components(separatedBy: "\n")
            .drop { $0.trimmingCharacters(in: .whitespaces).isEmpty }
            .reversed()
            .drop { $0.trimmingCharacters(in: .whitespaces).isEmpty }
            .reversed()
        return body.map { $0.isEmpty ? trimmedTrailing(prefix) : prefix + $0 }
    }

    // MARK: - Helpers

    private static func trimmedTrailing(_ text: String) -> String {
        var value = text
        while let last = value.last, last == " " || last == "\t" { value.removeLast() }
        return value
    }

    /// Содержимое строки без отступа и без `///`-префикса.
    private static func logicalContent(_ line: String) -> String {
        var text = line.trimmingCharacters(in: .whitespaces)
        if text.hasPrefix("///") { text = String(text.dropFirst(3)) }
        if text.hasPrefix("*") { text = String(text.dropFirst(1)) }
        return text.trimmingCharacters(in: .whitespaces)
    }

    private static func closingFenceIndex(in lines: [String], after markerIndex: Int, docLines: Set<Int>) -> Int? {
        var index = markerIndex + 1
        while index < lines.count, docLines.contains(index) {
            if logicalContent(lines[index]).hasPrefix(fence) { return index }
            index += 1
        }
        return nil
    }

    /// Номера строк (0-based), попадающие в doc-комментарии. Через SwiftSyntax, чтобы
    /// не спутать документацию с `///` или `/**` внутри строкового литерала.
    private static func docCommentLineNumbers(in source: String) -> Set<Int> {
        let tree = Parser.parse(source: source)
        let converter = SourceLocationConverter(fileName: "", tree: tree)
        var result: Set<Int> = []

        func collect(_ trivia: Trivia, startingAt position: AbsolutePosition) {
            var offset = position
            for piece in trivia {
                switch piece {
                case .docLineComment, .docBlockComment:
                    let start = converter.location(for: offset).line
                    let end = converter.location(for: offset.advanced(by: piece.sourceLength.utf8Length)).line
                    for line in start...max(start, end) { result.insert(line - 1) }
                default:
                    break
                }
                offset = offset.advanced(by: piece.sourceLength.utf8Length)
            }
        }

        for token in tree.tokens(viewMode: .sourceAccurate) {
            collect(token.leadingTrivia, startingAt: token.position)
            collect(token.trailingTrivia, startingAt: token.endPositionBeforeTrailingTrivia)
        }
        return result
    }
}
