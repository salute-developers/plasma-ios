import XCTest
@testable import SDDSThemeBuilderCore

final class TypographyContextBuilderTests: XCTestCase {
    var typographyContextBuilder: TypographyContextBuilder!
    var mockFontFamiliesContainer: FontFamiliesContainer!

    override func setUp() {
        super.setUp()
        let boldFontURL = TypographyContextBuilderTests.fontURL(forResource: "SBSansDisplay-Bold", withExtension: "otf")

        let displayFonts = [
            Font(link: boldFontURL, weight: .light, style: .normal)
        ]

        mockFontFamiliesContainer = FontFamiliesContainer(items: [
            .display: FontFamily(name: "SBSansDisplay", fonts: displayFonts)
        ])
        
        let metaURL = GradientContextBuilderTests.fileURL(forResource: "meta", withExtension: "json")
        let scheme = DecodeCommand<Scheme>(url: metaURL).run().asScheme!

        typographyContextBuilder = TypographyContextBuilder(fontFamiliesContainer: mockFontFamiliesContainer, metaScheme: scheme)
    }

    static func fontURL(forResource resource: String, withExtension ext: String) -> URL {
        let bundle = Bundle(for: TypographyContextBuilderTests.self)
        guard let url = bundle.url(forResource: resource, withExtension: ext) else {
            fatalError("Font file \(resource).\(ext) not found in test bundle")
        }
        return url
    }

    func testBuildContext_Success() {
        // given
        let jsonData = """
        {
            "screen-s.header.h1.bold": {
                "fontFamilyRef": "font-family.display",
                "weight": "light",
                "style": "normal",
                "size": 28,
                "lineHeight": 34,
                "kerning": 0
            }
        }
        """.data(using: .utf8)!

        // when
        let result = typographyContextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .dictionary(let context):
            XCTAssertNotNil(context["json"], "Context should contain 'json' key")
            if let json = context["json"] as? [String: Any],
               let header = json["headerH1Bold"] as? [String: Any],
               let small = header["small"] as? [String: Any] {
                XCTAssertEqual(small["fontName"] as? String, "SBSansDisplay-Bold")
            } else {
                XCTFail("JSON structure is not as expected")
            }
        default:
            XCTFail("Expected successful context build")
        }
    }

    func testBuildContext_InvalidTokenFormat() {
        // given
        let jsonData = """
        {
            "subHeader": {
                "fontFamilyRef": "display",
                "weight": "ultralight",
                "style": "invalidStyle"
            }
        }
        """.data(using: .utf8)!

        // when
        let result = typographyContextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .error(let error):
            XCTAssertTrue(true, error.localizedDescription)
        default:
            XCTFail("Expected failure due to invalid token format")
        }
    }

    func testBuildContext_InvalidScreenSize() {
        // given
        let jsonData = """
        {
            "invalidScreen.header": {
                "fontFamilyRef": "display",
                "weight": "bold",
                "style": "normal"
            }
        }
        """.data(using: .utf8)!

        // when
        let result = typographyContextBuilder.buildContext(from: jsonData)

        // then
        if !result.isError {
            XCTFail("Expected failure due to invalid screen size")
        }
    }
    
    func testBuildContext_FallbackScreenSize_SmallAndLarge() {
        // given
        let jsonData = """
        {
            "screen-s.header.h1.bold": {
                "fontFamilyRef": "font-family.display",
                "weight": "light",
                "style": "normal",
                "size": 28,
                "lineHeight": 34,
                "kerning": 0
            },
            "screen-l.header.h1.bold": {
                "fontFamilyRef": "font-family.display",
                "weight": "light",
                "style": "normal",
                "size": 32,
                "lineHeight": 38,
                "kerning": 0
            }
        }
        """.data(using: .utf8)!

        // when
        let result = typographyContextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .dictionary(let context):
            XCTAssertNotNil(context["json"], "Context should contain 'json' key")
            if let json = context["json"] as? [String: Any],
               let header = json["headerH1Bold"] as? [String: Any],
               let small = header["small"] as? [String: Any],
               let medium = header["medium"] as? [String: Any],
               let large = header["large"] as? [String: Any] {
                XCTAssertEqual(small["fontName"] as? String, "SBSansDisplay-Bold")
                XCTAssertEqual(medium["fontName"] as? String, "SBSansDisplay-Bold")
                XCTAssertEqual(large["fontName"] as? String, "SBSansDisplay-Bold")
                XCTAssertEqual(medium["size"] as? Int, 28)
                XCTAssertEqual(medium["lineHeight"] as? Int, 34)
                XCTAssertEqual(medium["kerning"] as? Int, 0)
            } else {
                XCTFail("JSON structure is not as expected")
            }
        default:
            XCTFail("Expected successful context build")
        }
    }

    func testBuildContext_FallbackScreenSize_MissingMediumAndSmall() {
        // given
        let jsonData = """
        {
            "screen-l.header.h1.bold": {
                "fontFamilyRef": "font-family.display",
                "weight": "light",
                "style": "normal",
                "size": 32,
                "lineHeight": 38,
                "kerning": 0
            }
        }
        """.data(using: .utf8)!

        // when
        let result = typographyContextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .dictionary(let context):
            XCTAssertNotNil(context["json"], "Context should contain 'json' key")
            if let json = context["json"] as? [String: Any],
               let header = json["headerH1Bold"] as? [String: Any],
               let small = header["small"] as? [String: Any],
               let medium = header["medium"] as? [String: Any],
               let large = header["large"] as? [String: Any] {
                XCTAssertEqual(small["fontName"] as? String, "SBSansDisplay-Bold")
                XCTAssertEqual(medium["fontName"] as? String, "SBSansDisplay-Bold")
                XCTAssertEqual(large["fontName"] as? String, "SBSansDisplay-Bold")
                XCTAssertEqual(small["size"] as? Int, 32)
                XCTAssertEqual(small["lineHeight"] as? Int, 38)
                XCTAssertEqual(small["kerning"] as? Int, 0)
                XCTAssertEqual(medium["size"] as? Int, 32)
                XCTAssertEqual(medium["lineHeight"] as? Int, 38)
                XCTAssertEqual(medium["kerning"] as? Int, 0)
            } else {
                XCTFail("JSON structure is not as expected")
            }
        default:
            XCTFail("Expected successful context build")
        }
    }

    func testBuildContext_FallbackScreenSize_MissingSmallAndLarge() {
        // given
        let jsonData = """
        {
            "screen-m.header.h1.bold": {
                "fontFamilyRef": "font-family.display",
                "weight": "light",
                "style": "normal",
                "size": 30,
                "lineHeight": 36,
                "kerning": 0
            }
        }
        """.data(using: .utf8)!

        // when
        let result = typographyContextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .dictionary(let context):
            XCTAssertNotNil(context["json"], "Context should contain 'json' key")
            if let json = context["json"] as? [String: Any],
               let header = json["headerH1Bold"] as? [String: Any],
               let small = header["small"] as? [String: Any],
               let medium = header["medium"] as? [String: Any],
               let large = header["large"] as? [String: Any] {
                XCTAssertEqual(small["fontName"] as? String, "SBSansDisplay-Bold")
                XCTAssertEqual(medium["fontName"] as? String, "SBSansDisplay-Bold")
                XCTAssertEqual(large["fontName"] as? String, "SBSansDisplay-Bold")
                XCTAssertEqual(small["size"] as? Int, 30)
                XCTAssertEqual(small["lineHeight"] as? Int, 36)
                XCTAssertEqual(small["kerning"] as? Int, 0)
                XCTAssertEqual(large["size"] as? Int, 30)
                XCTAssertEqual(large["lineHeight"] as? Int, 36)
                XCTAssertEqual(large["kerning"] as? Int, 0)
            } else {
                XCTFail("JSON structure is not as expected")
            }
        default:
            XCTFail("Expected successful context build")
        }
    }

    func testBuildContext_FallbackScreenSize_AllSizesPresent() {
        // given
        let jsonData = """
        {
            "screen-s.header.h1.bold": {
                "fontFamilyRef": "font-family.display",
                "weight": "light",
                "style": "normal",
                "size": 28,
                "lineHeight": 34,
                "kerning": 0
            },
            "screen-m.header.h1.bold": {
                "fontFamilyRef": "font-family.display",
                "weight": "light",
                "style": "normal",
                "size": 30,
                "lineHeight": 36,
                "kerning": 0
            },
            "screen-l.header.h1.bold": {
                "fontFamilyRef": "font-family.display",
                "weight": "light",
                "style": "normal",
                "size": 32,
                "lineHeight": 38,
                "kerning": 0
            }
        }
        """.data(using: .utf8)!

        // when
        let result = typographyContextBuilder.buildContext(from: jsonData)

        // then
        switch result {
        case .dictionary(let context):
            XCTAssertNotNil(context["json"], "Context should contain 'json' key")
            if let json = context["json"] as? [String: Any],
               let header = json["headerH1Bold"] as? [String: Any],
               let small = header["small"] as? [String: Any],
               let medium = header["medium"] as? [String: Any],
               let large = header["large"] as? [String: Any] {
                XCTAssertEqual(small["fontName"] as? String, "SBSansDisplay-Bold")
                XCTAssertEqual(medium["fontName"] as? String, "SBSansDisplay-Bold")
                XCTAssertEqual(large["fontName"] as? String, "SBSansDisplay-Bold")
                XCTAssertEqual(small["size"] as? Int, 28)
                XCTAssertEqual(small["lineHeight"] as? Int, 34)
                XCTAssertEqual(small["kerning"] as? Int, 0)
                XCTAssertEqual(medium["size"] as? Int, 30)
                XCTAssertEqual(medium["lineHeight"] as? Int, 36)
                XCTAssertEqual(medium["kerning"] as? Int, 0)
                XCTAssertEqual(large["size"] as? Int, 32)
                XCTAssertEqual(large["lineHeight"] as? Int, 38)
                XCTAssertEqual(large["kerning"] as? Int, 0)
            } else {
                XCTFail("JSON structure is not as expected")
            }
        default:
            XCTFail("Expected successful context build")
        }
    }

    // MARK: - FontFamilyOverride

    func testBuildContext_FontFamilyOverride_systemSFPro_replacesFontName() {
        // given
        let metaURL = GradientContextBuilderTests.fileURL(forResource: "meta", withExtension: "json")
        let scheme = DecodeCommand<Scheme>(url: metaURL).run().asScheme!
        let builder = TypographyContextBuilder(
            fontFamiliesContainer: mockFontFamiliesContainer,
            metaScheme: scheme,
            fontFamilyOverride: .systemSFPro
        )

        let jsonData = """
        {
            "screen-s.header.h1.bold": {
                "fontFamilyRef": "font-family.display",
                "weight": "light",
                "style": "normal",
                "size": 28,
                "lineHeight": 34,
                "kerning": 0
            }
        }
        """.data(using: .utf8)!

        // when
        let result = builder.buildContext(from: jsonData)

        // then
        switch result {
        case .dictionary(let context):
            guard let json = context["json"] as? [String: Any],
                  let header = json["headerH1Bold"] as? [String: Any],
                  let small = header["small"] as? [String: Any] else {
                XCTFail("Expected token tree shape")
                return
            }
            XCTAssertEqual(small["fontName"] as? String, "SF Pro",
                "override must replace resolved upstream font name with system sentinel")
            // Остальные поля токена должны сохраниться без изменений.
            XCTAssertEqual(small["size"] as? Int, 28)
            XCTAssertEqual(small["lineHeight"] as? Int, 34)
            XCTAssertEqual(small["weight"] as? String, "light")
            XCTAssertEqual(small["style"] as? String, "normal")
        default:
            XCTFail("Expected successful context build")
        }
    }

    func testBuildContext_FontFamilyOverride_none_preservesFontName() {
        // given — builder из setUp использует .none по умолчанию.

        let jsonData = """
        {
            "screen-s.header.h1.bold": {
                "fontFamilyRef": "font-family.display",
                "weight": "light",
                "style": "normal",
                "size": 28,
                "lineHeight": 34,
                "kerning": 0
            }
        }
        """.data(using: .utf8)!

        // when
        let result = typographyContextBuilder.buildContext(from: jsonData)

        // then — sentinel SF Pro не подставляется, upstream имя сохраняется.
        switch result {
        case .dictionary(let context):
            guard let json = context["json"] as? [String: Any],
                  let header = json["headerH1Bold"] as? [String: Any],
                  let small = header["small"] as? [String: Any] else {
                XCTFail("Expected token tree shape")
                return
            }
            XCTAssertEqual(small["fontName"] as? String, "SBSansDisplay-Bold")
        default:
            XCTFail("Expected successful context build")
        }
    }

    func testBuildContext_FontFamilyOverride_systemSFPro_failsLoudOnMissingUpstreamFont() {
        // given — override не должен скрывать дрейф upstream-схемы.
        // Контейнер шрифтов есть, но не содержит запрашиваемых weight/style →
        // findFont вернёт nil → токен молча пропускается. Это тот fail-loud,
        // который мы намеренно сохраняем.
        let metaURL = GradientContextBuilderTests.fileURL(forResource: "meta", withExtension: "json")
        let scheme = DecodeCommand<Scheme>(url: metaURL).run().asScheme!
        let builder = TypographyContextBuilder(
            fontFamiliesContainer: mockFontFamiliesContainer,
            metaScheme: scheme,
            fontFamilyOverride: .systemSFPro
        )

        // mock содержит только weight = .light, запросим .bold.
        let jsonData = """
        {
            "screen-s.header.h1.bold": {
                "fontFamilyRef": "font-family.display",
                "weight": "bold",
                "style": "normal",
                "size": 28,
                "lineHeight": 34,
                "kerning": 0
            }
        }
        """.data(using: .utf8)!

        // when
        let result = builder.buildContext(from: jsonData)

        // then — populateMissingScreenSizes падает, потому что токен пропущен.
        XCTAssertTrue(result.isError,
            "override must NOT mask upstream font lookup failure — that's the validation we keep")
    }

    func testBuildContext_NoAvailableSizes() {
        // given
        let jsonData = """
        {
            "header.h1.bold": {
                "fontFamilyRef": "font-family.display",
                "weight": "light",
                "style": "normal"
            }
        }
        """.data(using: .utf8)!

        // when
        let result = typographyContextBuilder.buildContext(from: jsonData)

        // then
        if !result.isError {
            XCTFail("Expected failure due to no available sizes")
        }
    }
}
