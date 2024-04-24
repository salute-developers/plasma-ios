import XCTest
@testable import SDDSThemeBuilderCore

final class GenerateColorTokensCommandTests: XCTestCase {
    /// SUT
    var generateColorTokensCommand: GenerateColorTokensCommand!
    
    // Mocks
    var runnableMock: RunnableMock!
    var renderableMock: RenderableMock!

    override func setUp() {
        super.setUp()
        
        runnableMock = RunnableMock()
        renderableMock = RenderableMock()
    }

    func testGenerateColorTokensCommand_Success() {
        // given
        guard let data = try? Data(contentsOf: GenerateColorTokensCommandTests.colorsSchemeURL) else {
            XCTFail("Invalid URL")
            return
        }
        runnableMock.stubbedResult = .data(data)
        renderableMock.stubbedResult = .generated("")
        
        generateColorTokensCommand = GenerateColorTokensCommand(
            templatesURL: GenerateColorTokensCommandTests.templatesURL,
            generatedOutputURL: GenerateColorTokensCommandTests.generatedOutputURL,
            downloadSchemeCommand: runnableMock,
            templateRender: renderableMock
        )
        
        // when
        let result = generateColorTokensCommand.run()
        
        // then
        switch result {
        case .success:
            XCTAssert(true, "Generated content successfully")
        default:
            XCTFail("Generation failed")
        }
    }
    
    func testGenerateColorTokensCommand_Failure_Download() {
        // given
        runnableMock.stubbedResult = .error(URLError(.badServerResponse))
        generateColorTokensCommand = GenerateColorTokensCommand(
            templatesURL: GenerateColorTokensCommandTests.templatesURL,
            generatedOutputURL: GenerateColorTokensCommandTests.generatedOutputURL,
            downloadSchemeCommand: runnableMock,
            templateRender: renderableMock
        )
        
        // when
        let result = generateColorTokensCommand.run()
        
        // then
        switch result {
        case .error(let error):
            XCTAssert(error is URLError, "Error should be related to network failure")
        default:
            XCTFail("Should have failed with network error")
        }
    }

    func testGenerateColorTokensCommand_Failure_Render() {
        // given
        runnableMock.stubbedResult = .data(Data())
        generateColorTokensCommand = GenerateColorTokensCommand(
            templatesURL: GenerateColorTokensCommandTests.templatesURL,
            generatedOutputURL: GenerateColorTokensCommandTests.generatedOutputURL,
            downloadSchemeCommand: runnableMock, 
            templateRender: renderableMock
        )
        
        // when
        let result = generateColorTokensCommand.run()
        
        // then
        switch result {
        case .error:
            XCTAssert(true, "Render should fail due to incorrect data")
        default:
            XCTFail("Render should fail but it didn't")
        }
    }
}

private extension GenerateColorTokensCommandTests {
    static var templatesURL: URL {
        let bundle = Bundle(for: GenerateColorTokensCommandTests.self)
        var url = bundle.url(forResource: "ColorToken", withExtension: "stencil")!
        let path = url.pathComponents.dropLast()
        url = URL(string: path.joined(separator: "/"))!
        return url
    }
    
    static var colorsSchemeURL: URL {
        let bundle = Bundle(for: GenerateColorTokensCommandTests.self)
        let jsonSchema = bundle.url(forResource: "ios_colors", withExtension: "json")!
        return jsonSchema
    }
    
    static var generatedOutputURL: URL {
        URL(fileURLWithPath: "./tmp")
    }
}
