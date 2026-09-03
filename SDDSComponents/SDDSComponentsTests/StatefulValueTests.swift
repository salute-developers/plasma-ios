import XCTest
@testable import SDDSComponents

/// `StatefulValue` resolves a value against the set of states a component is currently in.
/// The resolution order is load-bearing for every themed component, so it is pinned here.
final class StatefulValueTests: XCTestCase {

    private typealias Item = StatefulValue<Int>.Item

    // MARK: - Matching

    func testResolvesItemWhoseStatesAreSubsetOfActiveStates() {
        let value = StatefulValue<Int>(
            defaultValue: 0,
            values: [Item(states: [InteractiveState.pressed], value: 1)]
        )

        XCTAssertEqual(value.resolvedValue(for: Set([InteractiveState.pressed])), 1)
    }

    func testResolvesItemWhenActiveStatesAreASuperset() {
        let value = StatefulValue<Int>(
            defaultValue: 0,
            values: [Item(states: [InteractiveState.pressed], value: 1)]
        )

        // `pressed` is a subset of {pressed, hovered}, so the item still matches.
        XCTAssertEqual(value.resolvedValue(for: Set([InteractiveState.pressed, .hovered])), 1)
    }

    func testDoesNotResolveItemRequiringMoreStatesThanAreActive() {
        let value = StatefulValue<Int>(
            defaultValue: 0,
            values: [Item(states: [InteractiveState.pressed, .checked], value: 1)]
        )

        XCTAssertEqual(value.resolvedValue(for: Set([InteractiveState.pressed])), 0)
    }

    func testFirstMatchWins() {
        let value = StatefulValue<Int>(
            defaultValue: 0,
            values: [
                Item(states: [InteractiveState.pressed], value: 1),
                Item(states: [InteractiveState.pressed], value: 2)
            ]
        )

        XCTAssertEqual(value.resolvedValue(for: Set([InteractiveState.pressed])), 1)
    }

    func testItemWithNoStatesMatchesEverythingAndShadowsLaterItems() {
        // An unconditional item placed first swallows every lookup — a real hazard when
        // generated themes emit the default variation before the stateful ones.
        let value = StatefulValue<Int>(
            values: [
                Item(states: Set<String>(), value: 42),
                Item(states: [InteractiveState.pressed], value: 1)
            ]
        )

        XCTAssertEqual(value.resolvedValue(for: Set([InteractiveState.pressed])), 42)
    }

    // MARK: - Fallbacks

    func testFallsBackToExplicitFallbackBeforeDefaultValue() {
        let value = StatefulValue<Int>(defaultValue: 7, values: [])

        XCTAssertEqual(value.resolvedValue(for: Set<InteractiveState>(), default: 99), 99)
    }

    func testFallsBackToDefaultValueWhenNothingMatches() {
        let value = StatefulValue<Int>(
            defaultValue: 7,
            values: [Item(states: [InteractiveState.checked], value: 1)]
        )

        XCTAssertEqual(value.resolvedValue(for: Set([InteractiveState.pressed])), 7)
    }

    func testFallsBackToStatelessItemWhenThereIsNoDefaultValue() {
        let value = StatefulValue<Int>(
            values: [
                Item(states: [InteractiveState.checked], value: 1),
                Item(states: Set<String>(), value: 5)
            ]
        )

        XCTAssertEqual(value.resolvedDefaultValue(), 5)
    }

    func testFallsBackToFirstItemWhenThereIsNeitherDefaultNorStatelessItem() {
        let value = StatefulValue<Int>(
            values: [
                Item(states: [InteractiveState.checked], value: 1),
                Item(states: [InteractiveState.pressed], value: 2)
            ]
        )

        XCTAssertEqual(value.resolvedDefaultValue(), 1)
    }

    // MARK: - isStateful

    func testIsStatefulIsFalseWithoutStatefulItems() {
        XCTAssertFalse(StatefulValue<Int>(defaultValue: 1).isStateful())
        XCTAssertFalse(StatefulValue<Int>(values: [Item(states: Set<String>(), value: 1)]).isStateful())
    }

    func testIsStatefulIsTrueWhenAnyItemCarriesStates() {
        let value = StatefulValue<Int>(values: [Item(states: [InteractiveState.error], value: 1)])

        XCTAssertTrue(value.isStateful())
    }

    // MARK: - State keys

    func testInteractiveStateKeysMatchTheConfigContract() {
        // These strings are the keys the design-token config uses; renaming a case must not
        // silently change the wire format.
        XCTAssertEqual(InteractiveState.activated.stateKey, "activated")
        XCTAssertEqual(InteractiveState.textInlined.stateKey, "text-inlined")
        XCTAssertEqual(Set(InteractiveState.allCases.map(\.stateKey)).count, InteractiveState.allCases.count)
    }

    func testItemBuiltFromStatesArrayNormalizesToStateKeys() {
        let item = Item(states: [InteractiveState.pressed, .hovered], value: 1)

        XCTAssertEqual(item.states, ["pressed", "hovered"])
    }

    // MARK: - Value semantics

    func testEquatableComparesValuesAndStates() {
        let lhs = StatefulValue<Int>(defaultValue: 1, values: [Item(states: [InteractiveState.pressed], value: 2)])
        let rhs = StatefulValue<Int>(defaultValue: 1, values: [Item(states: [InteractiveState.pressed], value: 2)])
        let other = StatefulValue<Int>(defaultValue: 1, values: [Item(states: [InteractiveState.pressed], value: 3)])

        XCTAssertEqual(lhs, rhs)
        XCTAssertNotEqual(lhs, other)
    }
}
