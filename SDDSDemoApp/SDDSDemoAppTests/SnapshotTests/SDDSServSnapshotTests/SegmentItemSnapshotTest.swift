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
import SDDSservTheme
import UIKit
import SwiftUI

final class SegmentItemSnapshotTest: XCTestCase {
    
    @MainActor
    func testSegmentItemSizeLPrimary() async throws {
        let appearance = SegmentItem.l.primary.appearance
        try await runSnapshotTest(view: SegmentItemSizeLPrimary(segmentItemAppearance: appearance))
    }

    @MainActor
    func testSegmentItemSizeMSecondaryPilled() async throws {
        let appearance = SegmentItem.m.pilled.secondary.appearance
        try await runSnapshotTest(view: SegmentItemSizeMSecondaryPilled(segmentItemAppearance: appearance))
    }

    @MainActor
    func testSegmentItemSizeSPrimary() async throws {
        let appearance = SegmentItem.s.primary.appearance
        try await runSnapshotTest(view: SegmentItemSizeSPrimary(segmentItemAppearance: appearance))
    }

    @MainActor
    func testSegmentItemSizeXsCounter() async throws {
        let appearance = SegmentItem.xs.pilled.primary.appearance
        let counterAppearance = Counter.xxs.default.appearance
        try await runSnapshotTest(view: SegmentItemSizeXsCounter(segmentItemAppearance: appearance, counterAppearance: counterAppearance))
    }

    @MainActor
    func testSegmentItemSizeDisabled() async throws {
        let appearance = SegmentItem.l.primary.appearance
        try await runSnapshotTest(view: SegmentItemSizeDisabled(segmentItemAppearance: appearance))
    }
}
