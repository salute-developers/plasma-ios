import XCTest
import CoreText
import SDDSThemeCore
import SDDSServTheme

/// Шрифты тем вшиты в исходники и регистрируются в `Theme.initialize()`.
///
/// Тест проверяет не «функция вернула true», а что `CTFont` отдаёт именно наш шрифт,
/// а не системную подстановку: при неудачной регистрации текст молча отрисуется
/// системным, и поймать это можно было бы только глазами по снапшотам.
final class EmbeddedThemeFontTests: XCTestCase {

    private static let themeInitialized: Void = {
        SDDSServTheme.Theme.initialize()
    }()

    override func setUp() {
        super.setUp()
        _ = Self.themeInitialized
    }

    func testThemeShipsEmbeddedFonts() {
        XCTAssertFalse(
            FontsManifest.embedded.isEmpty,
            "у темы с собственным шрифтовым семейством список вшитых шрифтов не может быть пустым"
        )
    }

    func testEveryEmbeddedFontResolvesToItselfAndNotToAFallback() {
        for font in FontsManifest.embedded {
            let postScriptName = (font.filename as NSString).deletingPathExtension
            let descriptor = CTFontDescriptorCreateWithNameAndSize(postScriptName as CFString, 16)
            let resolved = CTFontCopyPostScriptName(CTFontCreateWithFontDescriptor(descriptor, 16, nil)) as String

            XCTAssertEqual(
                resolved,
                postScriptName,
                "система подставила '\(resolved)' вместо '\(postScriptName)' — шрифт не зарегистрирован"
            )
        }
    }

    func testEmbeddedPayloadsDecodeIntoFonts() {
        for font in FontsManifest.embedded {
            guard let data = Data(base64Encoded: font.base64, options: .ignoreUnknownCharacters) else {
                return XCTFail("\(font.filename): полезная нагрузка не декодируется из base64")
            }
            XCTAssertGreaterThan(data.count, 1024, "\(font.filename): подозрительно маленькая нагрузка")
            XCTAssertNotNil(
                CGDataProvider(data: data as CFData).flatMap(CGFont.init),
                "\(font.filename): данные не являются шрифтом"
            )
        }
    }

    func testRepeatedInitializeIsNotAnError() {
        // initialize() может вызываться повторно (тесты, переключение тенанта);
        // уже зарегистрированный шрифт не должен считаться ошибкой.
        for font in FontsManifest.embedded {
            XCTAssertTrue(
                FontsService.shared.register(embeddedFont: font),
                "повторная регистрация \(font.filename) вернула ошибку"
            )
        }
    }
}
