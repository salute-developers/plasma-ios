// Сгенерировано scripts/integration/generate_integration_project.rb — не править руками.
import XCTest
import SwiftUI
import SDDSThemeCore
import SDDSComponents
import SDDSIcons
@testable import IntegrationPlasmaB2CTheme

/// Hosted-тесты: процесс — само приложение IntegrationPlasmaB2CTheme. Падение на старте
/// (Theme.initialize, рендер ContentView) валит xcodebuild test целиком.
final class IntegrationTests: XCTestCase {
    func testThemeInitializes() {
        let done = expectation(description: "Theme.initialize completes")
        IntegrationTheme.initialize { done.fulfill() }
        // Шрифты FontsService качает с CDN; успех загрузки не проверяем — только завершение.
        wait(for: [done], timeout: 60)
    }

    func testColorTokenResolves() {
        let color = UIColor(IntegrationTheme.primaryTextColor.color(for: .light))
        var alpha: CGFloat = 0
        XCTAssertTrue(color.getRed(nil, green: nil, blue: nil, alpha: &alpha))
        XCTAssertGreaterThan(alpha, 0, "textDefaultPrimary должен быть непрозрачным")
    }

    @MainActor
    func testComponentsRender() {
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 390, height: 844))
        let host = UIHostingController(rootView: ContentView())
        window.rootViewController = host
        window.makeKeyAndVisible()
        host.view.layoutIfNeeded()
        XCTAssertGreaterThan(host.view.bounds.width, 0)
        XCTAssertGreaterThan(host.view.bounds.height, 0)
    }

    func testIconAssetLoads() {
        // SwiftGen падает fatalError, если ресурс не доехал в бандл SDDSIcons.framework.
        XCTAssertGreaterThan(Asset.addFill24.uiImage.size.width, 0)
    }
}
