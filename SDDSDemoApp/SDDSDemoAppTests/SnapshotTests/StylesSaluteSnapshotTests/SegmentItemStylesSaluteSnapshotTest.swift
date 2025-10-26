//
//  SegmentItemStylesSaluteSnapshotTest.swift
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

final class SegmentItemStylesSaluteSnapshotTest: StylesSaluteThemeTestCase {
    
    @MainActor
    func testSegmentItemSizeLPrimaryStylesSalute() async throws {
        let appearance = SegmentItem.l.primary.appearance
        try await runSnapshotTest(view: SegmentItemSizeLPrimary(segmentItemAppearance: appearance))
    }

    @MainActor
    func testSegmentItemSizeMSecondaryPilledStylesSalute() async throws {
        let appearance = SegmentItem.m.pilled.secondary.appearance
        try await runSnapshotTest(view: SegmentItemSizeMSecondaryPilled(segmentItemAppearance: appearance))
    }

    @MainActor
    func testSegmentItemSizeSPrimaryStylesSalute() async throws {
        let appearance = SegmentItem.s.primary.appearance
        try await runSnapshotTest(view: SegmentItemSizeSPrimary(segmentItemAppearance: appearance))
    }

    @MainActor
    func testSegmentItemSizeXsCounterStylesSalute() async throws {
        let appearance = SegmentItem.xs.pilled.primary.appearance
        let counterAppearance = Counter.xxs.default.appearance
        try await runSnapshotTest(view: SegmentItemSizeXsCounter(segmentItemAppearance: appearance, counterAppearance: counterAppearance))
    }

    @MainActor
    func testSegmentItemSizeDisabledStylesSalute() async throws {
        let appearance = SegmentItem.l.primary.appearance
        try await runSnapshotTest(view: SegmentItemSizeDisabled(segmentItemAppearance: appearance))
    }
}
