@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
import XCTest
import PlasmaHomeDSTheme

@MainActor
final class FormItemPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    func testFormItemDefaultPlasmaHomeDS() async throws {
        let appearance = FormItem.default.appearance
        try await runSnapshotTest(
            view: FormItemSnapshotCase(appearance: appearance)
        )
    }

    func testFormItemPositivePlasmaHomeDS() async throws {
        let appearance = FormItem.positive.appearance
        try await runSnapshotTest(
            view: FormItemSnapshotCase(
                appearance: appearance,
                hasHint: true,
                hasCaptionIcon: false
            )
        )
    }

    func testFormItemNegativePlasmaHomeDSDisabled() async throws {
        let appearance = FormItem.negative.appearance
        try await runSnapshotTest(
            view: FormItemSnapshotCase(
                appearance: appearance,
                enabled: false,
                titleCaption: nil,
                counter: "42"
            )
        )
    }
}
