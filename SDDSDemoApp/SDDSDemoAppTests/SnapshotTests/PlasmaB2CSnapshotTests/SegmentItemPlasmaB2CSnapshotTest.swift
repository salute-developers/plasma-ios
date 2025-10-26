//
//  SegmentItemPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 07.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class SegmentItemPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testSegmentItemSizeLPrimaryPlasmaB2C() async throws {
        let appearance = SegmentItem.l.primary.appearance
        try await runSnapshotTest(view: SegmentItemSizeLPrimary(segmentItemAppearance: appearance))
    }

    @MainActor
    func testSegmentItemSizeMSecondaryPilledPlasmaB2C() async throws {
        let appearance = SegmentItem.m.pilled.secondary.appearance
        try await runSnapshotTest(view: SegmentItemSizeMSecondaryPilled(segmentItemAppearance: appearance))
    }

    @MainActor
    func testSegmentItemSizeSPrimaryPlasmaB2C() async throws {
        let appearance = SegmentItem.s.primary.appearance
        try await runSnapshotTest(view: SegmentItemSizeSPrimary(segmentItemAppearance: appearance))
    }

    @MainActor
    func testSegmentItemSizeXsCounterPlasmaB2C() async throws {
        let appearance = SegmentItem.xs.pilled.primary.appearance
        let counterAppearance = Counter.xxs.default.appearance
        try await runSnapshotTest(view: SegmentItemSizeXsCounter(segmentItemAppearance: appearance, counterAppearance: counterAppearance))
    }

    @MainActor
    func testSegmentItemSizeDisabledPlasmaB2C() async throws {
        let appearance = SegmentItem.l.primary.appearance
        try await runSnapshotTest(view: SegmentItemSizeDisabled(segmentItemAppearance: appearance))
    }
}
