import XCTest
import ThemeCoreStatefulValues

final class StatefulValueTests: XCTestCase {
    func testMostSpecificMatchWinsInEitherOrder() {
        let single = StatefulValue<String>.Item(states: [InteractiveState.pressed], value: "single")
        let pair = StatefulValue<String>.Item(states: [InteractiveState.pressed, .selected], value: "pair")
        let empty = StatefulValue<String>.Item(states: Set<String>(), value: "empty")
        for items in [[empty, single, pair], [pair, single, empty]] {
            let value = StatefulValue(defaultValue: "base", values: items)
            XCTAssertEqual(value.resolvedValue(for: Set([InteractiveState.pressed, .selected])), "pair")
            XCTAssertEqual(value.resolvedValue(for: Set([InteractiveState.pressed])), "single")
        }
    }

    func testTiesKeepFirstEntryAndFallbackIsPreserved() {
        let value = StatefulValue(defaultValue: "base", values: [
            .init(states: [InteractiveState.pressed], value: "first"),
            .init(states: [InteractiveState.selected], value: "second")
        ])
        XCTAssertEqual(value.resolvedValue(for: Set([InteractiveState.pressed, .selected])), "first")
        XCTAssertEqual(value.resolvedValue(for: Set([InteractiveState.hovered])), "base")
        XCTAssertEqual(value.resolvedValue(for: Set([InteractiveState.hovered]), default: "fallback"), "fallback")
    }
}
