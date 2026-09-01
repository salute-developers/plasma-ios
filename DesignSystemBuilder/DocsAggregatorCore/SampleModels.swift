import Foundation

/// Запись реестра сэмплов (`samples.json`): офсеты указывают на извлечённый
/// фрагмент в ИСХОДНОМ .swift-файле, `snippetPath` — на файл извлечённого
/// сниппета относительно каталога сниппетов.
public struct SampleRecord: Codable, Equatable {
    public let id: String
    /// `view` (struct: View) либо `regular` (func).
    public let kind: String
    /// `<модуль>.<подпуть>.<имя>` — у Swift нет пакетов, путь задаёт конвенция каталогов.
    public let fqName: String
    /// Путь исходника относительно корня репозитория.
    public let file: String
    public let snippetPath: String
    public let snippetStartOffset: Int
    public let snippetEndOffset: Int

    /// Не сериализуется: признак «скриншот не нужен» из маркера
    /// (`needScreenshot=false`) — используется генератором скриншот-тестов.
    public var needScreenshot: Bool = true

    enum CodingKeys: String, CodingKey {
        case id, kind, fqName, file, snippetPath, snippetStartOffset, snippetEndOffset
    }

    public init(
        id: String, kind: String, fqName: String, file: String,
        snippetPath: String, snippetStartOffset: Int, snippetEndOffset: Int,
        needScreenshot: Bool = true
    ) {
        self.id = id
        self.kind = kind
        self.fqName = fqName
        self.file = file
        self.snippetPath = snippetPath
        self.snippetStartOffset = snippetStartOffset
        self.snippetEndOffset = snippetEndOffset
        self.needScreenshot = needScreenshot
    }
}

/// Распарсенный маркер `// @DocSample [id=<имя>] [needScreenshot=false]`.
/// Bare-форма даёт дефолты: id = имя декларации, needScreenshot = true.
public struct DocSampleMarker: Equatable {
    public let id: String?
    public let needScreenshot: Bool

    public init(id: String? = nil, needScreenshot: Bool = true) {
        self.id = id
        self.needScreenshot = needScreenshot
    }

    /// Парсит текст комментария; `nil`, если это не `@DocSample`-маркер.
    public static func parse(commentText: String) -> DocSampleMarker? {
        var text = commentText.trimmingCharacters(in: .whitespaces)
        guard text.hasPrefix("//") else { return nil }
        text = String(text.dropFirst(2)).trimmingCharacters(in: .whitespaces)
        guard text == "@DocSample" || text.hasPrefix("@DocSample ") else { return nil }
        text = String(text.dropFirst("@DocSample".count))

        var id: String?
        var needScreenshot = true
        for token in text.split(separator: " ") {
            let parts = token.split(separator: "=", maxSplits: 1)
            guard parts.count == 2 else { continue }
            let key = parts[0].trimmingCharacters(in: .whitespaces)
            let value = parts[1].trimmingCharacters(in: CharacterSet(charactersIn: " \"'"))
            switch key {
            case "id": id = value.isEmpty ? nil : value
            case "needScreenshot": needScreenshot = (value as NSString).boolValue
            default: break
            }
        }
        return DocSampleMarker(id: id, needScreenshot: needScreenshot)
    }
}

/// Результат извлечения одного сэмпла из исходника.
public struct ExtractedSample: Equatable {
    public let name: String
    public let marker: DocSampleMarker
    public let kind: String
    /// Извлечённый (после unwrap/placeholder/деиндента) текст сниппета.
    public let snippet: String
    /// Офсеты фрагмента в исходном .swift-файле (UTF-8).
    public let startOffset: Int
    public let endOffset: Int

    public var id: String { marker.id ?? name }

    public init(name: String, marker: DocSampleMarker, kind: String, snippet: String, startOffset: Int, endOffset: Int) {
        self.name = name
        self.marker = marker
        self.kind = kind
        self.snippet = snippet
        self.startOffset = startOffset
        self.endOffset = endOffset
    }
}
