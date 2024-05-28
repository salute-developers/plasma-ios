import XCTest
@testable import SDDSThemeBuilderCore

final class TemplateRendererTests: XCTestCase {
    var templateRenderer: TemplateRenderer!
    var templatesURL: URL!
    var contextBuilder: GeneralContextBuilder!

    override func setUp() {
        super.setUp()
        templateRenderer = TemplateRenderer()
        let bundle = Bundle(for: type(of: self))
        templatesURL = bundle.resourceURL
        contextBuilder = GeneralContextBuilder()
    }

    static var shapesURL: URL {
        let bundle = Bundle(for: TemplateRendererTests.self)
        guard let url = bundle.url(forResource: "ios_shape", withExtension: "json") else {
            fatalError("ios_shape.json file not found in test bundle")
        }
        return url
    }

    func testRenderShapesFromJSON_Success() {
        // given
        let template = StencilTemplate.shapeToken
        let jsonData = try! Data(contentsOf: TemplateRendererTests.shapesURL)
        let context = contextBuilder.buildContext(from: jsonData).asDictionary ?? [:]

        // when
        let result = templateRenderer.render(context: context, template: template, templatesURL: templatesURL)

        // then
        switch result {
        case .generated(let renderedContent):
            XCTAssertTrue(renderedContent.contains("Self(cornerRadius: 12)"), "Should correctly render the smallest corner radius")
            XCTAssertTrue(renderedContent.contains("Self(cornerRadius: 32)"), "Should correctly render the largest corner radius")
        default:
            XCTFail("Expected successful rendering of shapes based on JSON")
        }
    }

    func testRenderShapesFromJSON_Failure() {
        // given
        let template = StencilTemplate.shapes
        let jsonData = try! Data(contentsOf: TemplateRendererTests.shapesURL)
        var json = try! JSONSerialization.jsonObject(with: jsonData) as? [String: Any] ?? [:]
        json["round.xxl"] = nil
        let modifiedJsonData = try! JSONSerialization.data(withJSONObject: json)
        let context = contextBuilder.buildContext(from: modifiedJsonData).asDictionary ?? [:]

        // when
        let result = templateRenderer.render(context: context, template: template, templatesURL: templatesURL)

        // then
        if !result.isError {
            XCTFail("Expected failure in rendering due to manipulated JSON")
        }
    }
}
