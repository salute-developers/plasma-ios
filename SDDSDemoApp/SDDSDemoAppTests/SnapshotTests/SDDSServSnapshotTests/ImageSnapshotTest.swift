@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
import SDDSServTheme
import SwiftUI
import XCTest

final class ImageSnapshotTest: SDDSServThemeTestCase {

    @MainActor
    func testImageRatio16x9() async throws {
        let appearance = Image.ratio_16_9.appearance
        try await runSnapshotTest(view: ImageRatio16x9Photo(appearance: appearance))
    }

    @MainActor
    func testImageRatio1x1() async throws {
        let appearance = Image.ratio_1_1.appearance
        try await runSnapshotTest(view: ImageRatio1x1Photo(appearance: appearance))
    }

    @MainActor
    func testImageRatio1x2() async throws {
        let appearance = Image.ratio_1_2.appearance
        try await runSnapshotTest(view: ImageRatio1x2Photo(appearance: appearance))
    }
}
