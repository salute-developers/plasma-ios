import XCTest
@testable import SDDSThemeBuilderCore
import Stencil

final class TemplateRendererTests: XCTestCase {
    var templateRenderer: TemplateRenderer!

    override func setUp() {
        super.setUp()
        templateRenderer = TemplateRenderer()
    }

    func testRender_Success() {
        // given
        let template = StencilTemplate.color

        // when
        let result = templateRenderer.render(context: TemplateRendererTests.context, template: template, templatesURL: TemplateRendererTests.templatesURL)

        // then
        switch result {
        case .generated:
            break
        default:
            XCTFail("Expected successful rendering")
        }
    }

    func testRender_TemplateLoadingFailed() {
        // given
        let template = StencilTemplate.color

        // when
        let result = templateRenderer.render(context: TemplateRendererTests.context, template: template, templatesURL: TemplateRendererTests.invalidURL)

        // then
        switch result {
        case .error:
            break
        default:
            XCTFail("Expected failure due to non-existent template")
        }
    }

}

private extension TemplateRendererTests {
    static let context = ["key": "value"]
    
    static var templatesURL: URL {
        let bundle = Bundle(for: GenerateTokensCommandTests.self)
        var url = bundle.url(forResource: "ColorToken", withExtension: "stencil")!
        let path = url.pathComponents.dropLast()
        url = URL(string: path.joined(separator: "/"))!
        return url
    }
    
    static var invalidURL: URL {
        URL(fileURLWithPath: "/invalid/path.json")
    }
}
