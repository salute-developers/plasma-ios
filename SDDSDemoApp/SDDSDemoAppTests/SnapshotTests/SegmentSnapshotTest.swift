//
//  SegmentSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 29.05.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
#if PLASMA_THEME
import PlasmaB2CTheme
#elseif SALUTE_THEME
import StylesSaluteTheme
#else
import SDDSServTheme
#endif
import UIKit
import SwiftUI

final class SegmentSnapshotTest: XCTestCase {

    @MainActor
    func testSegmentSizeLPrimary() async throws {
        try await runSnapshotTest(view: SegmentSizeLPrimary())
    }

    @MainActor
    func testSegmentSizeMSecondaryPilled() async throws {
        try await runSnapshotTest(view: SegmentSizeMSecondaryPilled())
    }

    @MainActor
    func testSegmentSizeS() async throws {
        try await runSnapshotTest(view: SegmentSizeS())
    }

    @MainActor
    func testSegmentSizeXs() async throws {
        try await runSnapshotTest(view: SegmentSizeXs())
    }

    @MainActor
    func testSegmentSizeLVertical() async throws {
        try await runSnapshotTest(view: SegmentSizeLVertical())
    }

    @MainActor
    func testSegmentDisabled() async throws {
        try await runSnapshotTest(view: SegmentDisabled())
    }

    @MainActor
    func testSegmentSizeSStretch() async throws {
        try await runSnapshotTest(view: SegmentSizeSStretch())
    }

    @MainActor
    func testSegmentSizeLCounter() async throws {
        try await runSnapshotTest(view: SegmentSizeLCounter())
    }
}
