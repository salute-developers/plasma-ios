//
//  SegmentPlasmaB2CSnapshotTest.swift
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

final class SegmentPlasmaB2CSnapshotTest: XCTestCase {
    
    @MainActor
    func testSegmentSizeLPrimaryPlasmaB2C() async throws {
        let segmentItemAppearance = SegmentItem.l.primary.appearance
        let segmentAppearance = Segment.l.primary.appearance
        try await runSnapshotTest(view: SegmentSizeLPrimary(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentSizeMSecondaryPilledPlasmaB2C() async throws {
        let segmentItemAppearance = SegmentItem.m.secondary.appearance
        let segmentAppearance = Segment.m.pilled.secondary.appearance
        try await runSnapshotTest(view: SegmentSizeMSecondaryPilled(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentSizeSPlasmaB2C() async throws {
        let segmentItemAppearance = SegmentItem.s.primary.appearance
        let segmentAppearance = Segment.s.primary.appearance
            try await runSnapshotTest(view: SegmentSizeS(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentSizeXsPlasmaB2C() async throws {
        let segmentItemAppearance = SegmentItem.xs.primary.appearance
        let segmentAppearance = Segment.xs.primary.appearance
        try await runSnapshotTest(view: SegmentSizeXs(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentSizeLVerticalPlasmaB2C() async throws {
        let segmentItemAppearance = SegmentItem.l.primary.appearance
        let segmentAppearance = Segment.l.primary.appearance
        try await runSnapshotTest(view: SegmentSizeLVertical(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentDisabledPlasmaB2C() async throws {
        let segmentItemAppearance = SegmentItem.l.primary.appearance
        let segmentAppearance = Segment.l.primary.appearance
        try await runSnapshotTest(view: SegmentDisabled(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentSizeSStretchPlasmaB2C() async throws {
        let segmentItemAppearance = SegmentItem.s.primary.appearance
        let segmentAppearance = Segment.s.primary.appearance
        try await runSnapshotTest(view: SegmentSizeSStretch(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentSizeLCounterPlasmaB2C() async throws {
        let segmentItemAppearance = SegmentItem.l.primary.appearance
        let segmentAppearance = Segment.l.primary.appearance
        let counterAppearance = Counter.s.accent.appearance
        try await runSnapshotTest(view:SegmentSizeLCounter(
            segmentItemAppearance: segmentItemAppearance,
            segmentAppearance: segmentAppearance,
            counterAppearance: counterAppearance)
        )
    }
}
