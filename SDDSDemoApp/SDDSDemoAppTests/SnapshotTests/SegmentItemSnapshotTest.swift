//
//  SegmentItemSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 25.06.2025.
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

final class SegmentItemSnapshotTest: XCTestCase {
    
    @MainActor
    func testSegmentItemSizeLPrimary() async throws {
        try await runSnapshotTest(view: SegmentItemSizeLPrimary())
    }

    @MainActor
    func testSegmentItemSizeMSecondaryPilled() async throws {
        try await runSnapshotTest(view: SegmentItemSizeMSecondaryPilled())
    }

    @MainActor
    func testSegmentItemSizeSPrimary() async throws {
        try await runSnapshotTest(view: SegmentItemSizeSPrimary())
    }

    @MainActor
    func testSegmentItemSizeXsCounter() async throws {
        try await runSnapshotTest(view: SegmentItemSizeXsCounter())
    }

    @MainActor
    func testSegmentItemSizeDisabled() async throws {
        try await runSnapshotTest(view: SegmentItemSizeDisabled())
    }
}
