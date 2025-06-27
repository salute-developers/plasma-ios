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
#if PLASMA_THEME
import PlasmaB2CTheme
#elseif SALUTE_THEME
import StylesSaluteTheme
#else
import SDDSServTheme
#endif
import UIKit
import SwiftUI

final class BadgeSnapshotTest: XCTestCase {
    
    @MainActor
    func testBadgeSizeLDefaultContentLeft() async throws {
        try await runSnapshotTest(view:BadgeSizeLDefaultContentLeft())
    }
    
    @MainActor
    func testBadgeSizeMAccentContentRight() async throws {
        try await runSnapshotTest(view: BadgeSizeMAccentContentRight())
    }
    
    @MainActor
    func testBadgeSizeSPositivePilled() async throws {
        try await runSnapshotTest(view: BadgeSizeSPositivePilled())
    }
    
    @MainActor
    func testBadgeSizeXsWarning() async throws {
        try await runSnapshotTest(view: BadgeSizeXsWarning())
    }
    
    @MainActor
    func testBadgeSizeLNegative() async throws {
        try await runSnapshotTest(view: BadgeSizeLNegative())
    }
    
    @MainActor
    func testBadgeSizeMDark() async throws {
        try await runSnapshotTest(view: BadgeSizeMDark())
    }
    
    @MainActor
    func testBadgeSizeSLight() async throws {
        try await runSnapshotTest(view: BadgeSizeSLight())
    }
    
    @MainActor
    func testBadgeSizeLDefaultClear() async throws {
        try await runSnapshotTest(view: BadgeSizeLDefaultClear())
    }
    
    @MainActor
    func testBadgeSizeLDefaultTransparent() async throws {
        try await runSnapshotTest(view: BadgeSizeLDefaultTransparent())
    }
    
    @MainActor
    func testBadgeSizeMNegativeClear() async throws {
        try await runSnapshotTest(view: BadgeSizeMNegativeClear())
    }
    
    @MainActor
    func testBadgeSizeSWarningTransparent() async throws {
        try await runSnapshotTest(view: BadgeSizeSWarningTransparent())
    }
}
