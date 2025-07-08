//
//  SegmentStylesSaluteSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 08.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class SegmentStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testSegmentSizeLPrimaryStylesSalute() async throws {
        let segmentItemAppearance = SegmentItem.l.primary.appearance
        let segmentAppearance = Segment.l.primary.appearance
        try await runSnapshotTest(view: SegmentSizeLPrimary(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentSizeMSecondaryPilledStylesSalute() async throws {
        let segmentItemAppearance = SegmentItem.m.secondary.appearance
        let segmentAppearance = Segment.m.pilled.secondary.appearance
        try await runSnapshotTest(view: SegmentSizeMSecondaryPilled(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentSizeSStylesSalute() async throws {
        let segmentItemAppearance = SegmentItem.s.primary.appearance
        let segmentAppearance = Segment.s.primary.appearance
            try await runSnapshotTest(view: SegmentSizeS(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentSizeXsStylesSalute() async throws {
        let segmentItemAppearance = SegmentItem.xs.primary.appearance
        let segmentAppearance = Segment.xs.primary.appearance
        try await runSnapshotTest(view: SegmentSizeXs(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentSizeLVerticalStylesSalute() async throws {
        let segmentItemAppearance = SegmentItem.l.primary.appearance
        let segmentAppearance = Segment.l.primary.appearance
        try await runSnapshotTest(view: SegmentSizeLVertical(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentDisabledStylesSalute() async throws {
        let segmentItemAppearance = SegmentItem.l.primary.appearance
        let segmentAppearance = Segment.l.primary.appearance
        try await runSnapshotTest(view: SegmentDisabled(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentSizeSStretchStylesSalute() async throws {
        let segmentItemAppearance = SegmentItem.s.primary.appearance
        let segmentAppearance = Segment.s.primary.appearance
        try await runSnapshotTest(view: SegmentSizeSStretch(segmentItemAppearance: segmentItemAppearance, segmentAppearance: segmentAppearance))
    }

    @MainActor
    func testSegmentSizeLCounterStylesSalute() async throws {
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
