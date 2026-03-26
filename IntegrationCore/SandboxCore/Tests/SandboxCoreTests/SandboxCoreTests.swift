import XCTest
@testable import SandboxCore

final class SandboxCoreTests: XCTestCase {
    func testRegistryDeduplicatesById() {
        let registry = StoryRegistry()
        let descriptor = StoryDescriptor(
            id: "button.story",
            title: "Button",
            componentKey: "button",
            uiStateType: "EmptyUiState",
            makeDefaultState: { EmptyUiState() }
        )

        registry.register(descriptor)
        registry.register(descriptor)

        XCTAssertEqual(registry.allStories().count, 1)
    }
}
