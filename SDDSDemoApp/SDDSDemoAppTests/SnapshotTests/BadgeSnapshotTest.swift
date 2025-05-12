//
//  BadgeSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class BadgeSnapshotTest: XCTestCase {
    
    func testBadgeSizeLDefaultContentLeft() async throws {
        try await runSnapshotTest(view:BadgeSizeLDefaultContentLeft())
    }
    
    func testBadgeSizeMAccentContentRight() async throws {
        try await runSnapshotTest(view: BadgeSizeMAccentContentRight())
    }
    
    func testBadgeSizeSPositivePilled() async throws {
        try await runSnapshotTest(view: BadgeSizeSPositivePilled())
    }
    
    func testBadgeSizeXsWarning() async throws {
        try await runSnapshotTest(view: BadgeSizeXsWarning())
    }
    
    func testBadgeSizeLNegative() async throws {
        try await runSnapshotTest(view: BadgeSizeLNegative())
    }
    
    func testBadgeSizeMDark() async throws {
        try await runSnapshotTest(view: BadgeSizeMDark())
    }
    
    func testBadgeSizeSLight() async throws {
        try await runSnapshotTest(view: BadgeSizeSLight())
    }
    
    func testBadgeSizeLDefaultClear() async throws {
        try await runSnapshotTest(view: BadgeSizeLDefaultClear())
    }
    
    func testBadgeSizeLDefaultTransparent() async throws {
        try await runSnapshotTest(view: BadgeSizeLDefaultTransparent())
    }
    
    func testBadgeSizeMNegativeClear() async throws {
        try await runSnapshotTest(view: BadgeSizeMNegativeClear())
    }
    
    func testBadgeSizeSWarningTransparent() async throws {
        try await runSnapshotTest(view: BadgeSizeSWarningTransparent())
    }
}
