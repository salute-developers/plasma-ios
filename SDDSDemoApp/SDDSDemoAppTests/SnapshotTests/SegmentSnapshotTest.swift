//
//  SegmentSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 19.05.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class SegmentSnapshotTest: XCTestCase {
    
    func testSegmentItemSizeLPrimary() async throws {
        try await runSnapshotTest(view: SegmentItemSizeLPrimary())
    }
    
    func testSegmentItemSizeMSecondaryPilled() async throws {
        try await runSnapshotTest(view: SegmentItemSizeMSecondaryPilled())
    }
    
    func testSegmentItemSizeSPrimary() async throws {
        try await runSnapshotTest(view: SegmentItemSizeSPrimary())
    }
    
    func testSegmentItemSizeXsCounter() async throws {
        try await runSnapshotTest(view: SegmentItemSizeXsCounter())
    }
    
    func testSegmentItemSizeDisabled() async throws {
        try await runSnapshotTest(view: SegmentItemSizeDisabled())
    }
    
    func testSegmentSizeLPrimary() async throws {
        try await runSnapshotTest(view: SegmentSizeLPrimary())
    }
    
    func testSegmentSizeMSecondaryPilled() async throws {
        try await runSnapshotTest(view: SegmentSizeMSecondaryPilled())
    }
    
    func testSegmentSizeS() async throws {
        try await runSnapshotTest(view: SegmentSizeS())
    }
    
    func testSegmentSizeXs() async throws {
        try await runSnapshotTest(view: SegmentSizeXs())
    }
    
    func testSegmentSizeLVertical() async throws {
        try await runSnapshotTest(view: SegmentSizeLVertical())
    }
    
    func testSegmentDisabled() async throws {
        try await runSnapshotTest(view: SegmentDisabled())
    }
    
    func testSegmentSizeSStretch() async throws {
        try await runSnapshotTest(view: SegmentSizeSStretch())
    }
    
    func testSegmentSizeLCounter() async throws {
        try await runSnapshotTest(view: SegmentSizeLCounter())
    }
}
