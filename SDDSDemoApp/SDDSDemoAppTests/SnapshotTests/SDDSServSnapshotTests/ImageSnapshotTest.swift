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
    
    @MainActor
    func testImageRatio3x4() async throws {
        let appearance = Image.ratio_3_4.appearance
        try await runSnapshotTest(view: ImageRatio3x4Photo(appearance: appearance))
    }
    
    @MainActor
    func testImageRatio4x3() async throws {
        let appearance = Image.ratio_4_3.appearance
        try await runSnapshotTest(view: ImageRatio4x3Photo(appearance: appearance))
    }
    
    @MainActor
    func testImageRatio9x16() async throws {
        let appearance = Image.ratio_9_16.appearance
        try await runSnapshotTest(view: ImageRatio9x16Photo(appearance: appearance))
    }
    
    @MainActor
    func testImageRatio2x1() async throws {
        let appearance = Image.ratio_2_1.appearance
        try await runSnapshotTest(view: ImageRatio2x1Photo(appearance: appearance))
    }
}
