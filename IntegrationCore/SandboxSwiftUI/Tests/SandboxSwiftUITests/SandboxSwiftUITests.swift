import XCTest
@testable import SandboxCore
@testable import SandboxSwiftUI

final class SandboxSwiftUITests: XCTestCase {
    private struct TestTheme: SandboxThemeProvider {
        let id: String
        let title: String

        func variantNames(for component: ComponentKey) -> [String] { [] }
        func appearanceNames(for component: ComponentKey, variant: String) -> [String] { [] }
    }

    private struct TestStory: Story {
        static let id = "test.story"
        static let title = "Test Story"
        static let componentKey: ComponentKey = "test.component"
        static let defaultState = EmptyUiState()
    }

    func testSandboxStoryItemUsesDescriptorId() {
        let descriptor = StoryDescriptor(TestStory.self)
        let item = SandboxStoryItem(descriptor: descriptor, render: { _ in
            fatalError("Render should not be called in this test")
        })

        XCTAssertEqual(item.id, TestStory.id)
    }

    func testThemeManagerRegistersThemeForContainerUsage() {
        let manager = ThemeManager.shared
        manager.reset()

        manager.register(TestTheme(id: "test-theme", title: "Test Theme"))

        XCTAssertEqual(manager.themes.count, 1)
        XCTAssertEqual(manager.currentTheme?.id, "test-theme")
    }
}
