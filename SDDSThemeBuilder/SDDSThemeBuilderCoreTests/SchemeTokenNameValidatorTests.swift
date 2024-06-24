import XCTest
@testable import SDDSThemeBuilderCore

class Validator: SchemeTokenNameValidator {}

class SchemeTokenNameValidatorTests: XCTestCase {
    
    var validator: Validator!
    var scheme: Scheme!

    override func setUp() {
        super.setUp()
        validator = Validator()
        
        let metaURL = GradientContextBuilderTests.fileURL(forResource: "meta", withExtension: "json")
        scheme = DecodeCommand<Scheme>(url: metaURL).run().asScheme!
    }

    func testValidateExistingTokens() {
        XCTAssertNoThrow(try validator.validateTokenName("dark.text.default.primary-hover", .color, scheme: scheme))
        XCTAssertNoThrow(try validator.validateTokenName("dark.text.default.accent-gradient-hover", .gradient, scheme: scheme))
        XCTAssertNoThrow(try validator.validateTokenName("round.xxs", .shape, scheme: scheme))
        XCTAssertNoThrow(try validator.validateTokenName("screen-s.display.l.normal", .typography, scheme: scheme))
        XCTAssertNoThrow(try validator.validateTokenName("down.soft.s", .shadow, scheme: scheme))
    }
    
    func testValidateMissingTokens() {
        XCTAssertThrowsError(try validator.validateTokenName("nonexistent.color.token", .color, scheme: scheme)) { error in
            XCTAssertTrue(true)
        }
        XCTAssertThrowsError(try validator.validateTokenName("nonexistent.gradient.token", .gradient, scheme: scheme)) { error in
            XCTAssertTrue(true)
        }
        XCTAssertThrowsError(try validator.validateTokenName("nonexistent.shape.token", .shape, scheme: scheme)) { error in
            XCTAssertTrue(true)
        }
        XCTAssertThrowsError(try validator.validateTokenName("nonexistent.typography.token", .typography, scheme: scheme)) { error in
            XCTAssertTrue(true)
        }
        XCTAssertThrowsError(try validator.validateTokenName("nonexistent.shadow.token", .shadow, scheme: scheme)) { error in
            XCTAssertTrue(true)
        }
    }
    
    func testValidateDuplicateTokens() {
        let duplicateTokens = [
            Token(type: .color, name: "dark.text.default.primary-hover", tags: ["dark", "text", "default", "primary-hover"], displayName: "textPrimaryHover", description: "Основной цвет текста", enabled: true),
            Token(type: .color, name: "dark.text.default.primary-hover", tags: ["dark", "text", "default", "primary-hover"], displayName: "textPrimaryHover", description: "Основной цвет текста", enabled: true),
            Token(type: .gradient, name: "dark.text.default.accent-gradient-hover", tags: ["dark", "text", "default", "accent-gradient-hover"], displayName: "textAccentGradientHover", description: "Акцентный цвет с градиентом", enabled: true),
            Token(type: .gradient, name: "dark.text.default.accent-gradient-hover", tags: ["dark", "text", "default", "accent-gradient-hover"], displayName: "textAccentGradientHover", description: "Акцентный цвет с градиентом", enabled: true),
            Token(type: .shape, name: "round.xxs", tags: ["round", "xxs"], displayName: "roundXxs", description: "borderRadius xxs", enabled: true),
            Token(type: .shape, name: "round.xxs", tags: ["round", "xxs"], displayName: "roundXxs", description: "borderRadius xxs", enabled: true),
            Token(type: .typography, name: "screen-s.display.l.normal", tags: ["screen-s", "display", "l", "normal"], displayName: "screenSDisplayL", description: "typography s display-l", enabled: true),
            Token(type: .typography, name: "screen-s.display.l.normal", tags: ["screen-s", "display", "l", "normal"], displayName: "screenSDisplayL", description: "typography s display-l", enabled: true),
            Token(type: .shadow, name: "down.soft.s", tags: ["down", "soft", "s"], displayName: "shadowDownSoftS", description: "shadow down soft s", enabled: true),
            Token(type: .shadow, name: "down.soft.s", tags: ["down", "soft", "s"], displayName: "shadowDownSoftS", description: "shadow down soft s", enabled: true)
        ]
        
        let duplicateScheme = Scheme(name: "caldera_online", version: "0.1.0", color: Style(mode: [.dark], category: [.text], subcategory: [.default]), gradient: Style(mode: [.dark], category: [.text], subcategory: [.default]), shadow: ShadowStyle(direction: [.down], kind: [.soft], size: [.small]), shape: ShapeStyle(kind: [.round], size: [.xxs]), typography: TypographyStyle(screen: [.screenS], kind: [.display], size: [.large], weight: [.normal]), fontFamily: FontFamiliesContainerStyle(kind: [.text]), tokens: duplicateTokens)
        
        XCTAssertThrowsError(try validator.validateTokenName("dark.text.default.primary-hover", .color, scheme: duplicateScheme)) { error in
            XCTAssertTrue(true)
        }
        XCTAssertThrowsError(try validator.validateTokenName("dark.text.default.accent-gradient-hover", .gradient, scheme: duplicateScheme)) { error in
            XCTAssertTrue(true)
        }
        XCTAssertThrowsError(try validator.validateTokenName("round.xxs", .shape, scheme: duplicateScheme)) { error in
            XCTAssertTrue(true)
        }
        XCTAssertThrowsError(try validator.validateTokenName("screen-s.display.l.normal", .typography, scheme: duplicateScheme)) { error in
            XCTAssertTrue(true)
        }
        XCTAssertThrowsError(try validator.validateTokenName("down.soft.s", .shadow, scheme: duplicateScheme)) { error in
            XCTAssertTrue(true)
        }
    }
}
