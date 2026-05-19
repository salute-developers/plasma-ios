@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
import XCTest
import SDDSServTheme

@MainActor
final class FormItemSnapshotTest: SDDSServThemeTestCase {
    func testFormItemXsDefault() async throws {
        let appearance = FormItem.xs.default.appearance
        try await runSnapshotTest(
            view: FormItemSnapshotCase(appearance: appearance)
        )
    }

    func testFormItemTitleTopRequiredStart() async throws {
        let appearance = FormItem.xs.titleTop.requiredStart.default.appearance
        try await runSnapshotTest(
            view: FormItemSnapshotCase(appearance: appearance)
        )
    }

    func testFormItemTitleStartRequiredEndLongText() async throws {
        let appearance = FormItem.l.titleStart.requiredEnd.positive.appearance
        try await runSnapshotTest(
            view: FormItemSnapshotCase(
                appearance: appearance,
                content: "Very long text content to check wrapping behavior in form item layout and preserve Android parity.",
                title: "Very long title text",
                titleCaption: "Very long title caption",
                caption: "Very long caption text",
                counter: "99/100",
                optional: "Optional"
            )
        )
    }

    func testFormItemDisabledWithHint() async throws {
        let appearance = FormItem.s.requiredStart.warning.appearance
        try await runSnapshotTest(
            view: FormItemSnapshotCase(
                appearance: appearance,
                hasHint: true,
                enabled: false
            )
        )
    }
}
