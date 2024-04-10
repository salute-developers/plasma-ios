import XCTest
@testable import SDDSThemeBuilderCore

final class GenerateTokensCommandTests: XCTestCase {
    /// SUT
    var generateTokensCommand: GenerateTokensCommand!
    
    // Mocks
    var renderableMock: RenderableMock!
    var contextBuilderMock: ContextBuilderMock!

    override func setUp() {
        super.setUp()
        
        renderableMock = RenderableMock()
        contextBuilderMock = ContextBuilderMock()
    }

    func testGenerateTokensCommand_Success() {
        // given
        guard let jsonData = try? Data(contentsOf: GenerateTokensCommandTests.colorsSchemeURL) else {
            XCTFail("Invalid URL")
            return
        }
        let context = ["key": "value"]
        contextBuilderMock.stubbedResult = .dictionary(context)
        renderableMock.stubbedResult = .generated("Rendered Content")
        
        generateTokensCommand = GenerateTokensCommand(
            name: "Generate Color Tokens",
            schemeURL: GenerateTokensCommandTests.colorsSchemeURL,
            templatesURL: GenerateTokensCommandTests.templatesURL,
            template: StencilTemplate.color,
            generatedOutputURL: GenerateTokensCommandTests.generatedOutputURL,
            templateRender: renderableMock,
            contextBuilder: contextBuilderMock
        )
        
        // when
        let result = generateTokensCommand.run()
        
        // then
        switch result {
        case .success:
            XCTAssert(true, "Generated content successfully")
        default:
            XCTFail("Generation failed")
        }
    }
    
    func testGenerateTokensCommand_Failure_InvalidData() {
        // given
        let invalidURL = GenerateTokensCommandTests.invalidURL
        generateTokensCommand = GenerateTokensCommand(
            name: "Generate Color Tokens",
            schemeURL: invalidURL,
            templatesURL: GenerateTokensCommandTests.templatesURL,
            template: StencilTemplate.color,
            generatedOutputURL: GenerateTokensCommandTests.generatedOutputURL,
            templateRender: renderableMock,
            contextBuilder: contextBuilderMock
        )
        
        // when
        let result = generateTokensCommand.run()
        
        // then
        switch result {
        case .error(let error):
            XCTAssert(error is GeneralError, "Error should be related to invalid file name")
        default:
            XCTFail("Should have failed due to invalid data")
        }
    }

    func testGenerateTokensCommand_Failure_RenderError() {
        // given
        guard let jsonData = try? Data(contentsOf: GenerateTokensCommandTests.colorsSchemeURL) else {
            XCTFail("Invalid URL")
            return
        }
        let context = ["key": "value"]
        contextBuilderMock.stubbedResult = .dictionary(context)
        renderableMock.stubbedResult = .error(GeneralError.invalidFilename)
        
        generateTokensCommand = GenerateTokensCommand(
            name: "Generate Color Tokens",
            schemeURL: GenerateTokensCommandTests.colorsSchemeURL,
            templatesURL: GenerateTokensCommandTests.templatesURL,
            template: StencilTemplate.color,
            generatedOutputURL: GenerateTokensCommandTests.generatedOutputURL,
            templateRender: renderableMock,
            contextBuilder: contextBuilderMock
        )
        
        // when
        let result = generateTokensCommand.run()
        
        // then
        switch result {
        case .error:
            XCTAssert(true, "Render should fail due to rendering error")
        default:
            XCTFail("Render should fail but it didn't")
        }
    }
}

private extension GenerateTokensCommandTests {
    static var templatesURL: URL {
        let bundle = Bundle(for: GenerateTokensCommandTests.self)
        var url = bundle.url(forResource: "ColorToken", withExtension: "stencil")!
        let path = url.pathComponents.dropLast()
        url = URL(string: path.joined(separator: "/"))!
        return url
    }
    
    static var colorsSchemeURL: URL {
        let bundle = Bundle(for: GenerateTokensCommandTests.self)
        let jsonSchema = bundle.url(forResource: "ios_colors", withExtension: "json")!
        return jsonSchema
    }
    
    static var invalidURL: URL {
        URL(fileURLWithPath: "/invalid/path.json")
    }
    
    static var generatedOutputURL: URL {
        URL(fileURLWithPath: "./tmp")
    }
}
