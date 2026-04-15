@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
import SDDSServTheme
import SwiftUI
import XCTest

final class TextIconPrimitivesSnapshotTest: SDDSServThemeTestCase {

    @MainActor
    func testTextSolidColor() async throws {
        try await runSnapshotTest(view: TextPrimitiveSolidColor())
    }

    @MainActor
    func testTextGradient() async throws {
        try await runSnapshotTest(view: TextPrimitiveGradient())
    }

    @MainActor
    func testTextTruncationEnv() async throws {
        try await runSnapshotTest(view: TextPrimitiveLineLimitFromEnv())
    }

    @MainActor
    func testIconSolidColor() async throws {
        try await runSnapshotTest(view: IconPrimitiveSolidColor())
    }

    @MainActor
    func testIconGradient() async throws {
        try await runSnapshotTest(view: IconPrimitiveGradient())
    }

    @MainActor
    func testIconEnvSizeOverride() async throws {
        try await runSnapshotTest(view: IconPrimitiveEnvSizeVsOverride())
    }
}
