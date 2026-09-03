import XCTest
import CoreText
@testable import SDDSComponents

/// Регистрация вшитых шрифтов: контракт `FontsService.register(embeddedFonts:)`.
///
/// Положительный путь на настоящих шрифтах проверяется в тестах демо-приложения —
/// там доступны сгенерированные темы. Здесь закреплено поведение на некорректных
/// данных: оно должно быть предсказуемым, а не приводить к падению.
final class EmbeddedFontTests: XCTestCase {

    func testRejectsPayloadThatIsNotBase64() {
        let font = EmbeddedFont(filename: "Broken.otf", base64: "не base64 ни разу")

        XCTAssertFalse(FontsService.shared.register(embeddedFont: font))
    }

    func testRejectsBase64ThatIsNotAFont() {
        // Валидный base64, но внутри не шрифт — CGFont создать не удастся.
        let payload = Data("это просто текст, а не otf".utf8).base64EncodedString()
        let font = EmbeddedFont(filename: "NotAFont.otf", base64: payload)

        XCTAssertFalse(FontsService.shared.register(embeddedFont: font))
    }

    func testEmptyListIsSuccess() {
        // Тема на системном шрифте (PlasmaHomeDS) отдаёт пустой список — это не ошибка.
        XCTAssertTrue(FontsService.shared.register(embeddedFonts: []))
    }

    func testOneBadFontFailsTheWholeBatchButDoesNotStopIt() {
        let fonts = [
            EmbeddedFont(filename: "Bad1.otf", base64: "%%%"),
            EmbeddedFont(filename: "Bad2.otf", base64: "%%%")
        ]

        XCTAssertFalse(FontsService.shared.register(embeddedFonts: fonts))
    }

    func testIgnoresWhitespaceInsidePayload() {
        // Сгенерированный Swift переносит base64 по строкам, поэтому переводы строк
        // внутри полезной нагрузки — норма, а не повод отказать.
        let payload = Data("не шрифт".utf8).base64EncodedString()
        let wrapped = payload.enumerated().map { index, character in
            index > 0 && index % 4 == 0 ? "\n\(character)" : String(character)
        }.joined()

        // Данные всё ещё не шрифт, но декодирование base64 обязано пройти:
        // отказ должен случиться на CGFont, а не на разборе строки.
        XCTAssertNotNil(Data(base64Encoded: wrapped, options: .ignoreUnknownCharacters))
        XCTAssertFalse(FontsService.shared.register(embeddedFont: .init(filename: "W.otf", base64: wrapped)))
    }
}
