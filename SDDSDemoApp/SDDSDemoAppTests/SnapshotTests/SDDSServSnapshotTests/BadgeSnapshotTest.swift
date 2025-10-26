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

final class BadgeSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testBadgeSizeLDefaultContentLeft() async throws {
        let appearance = Badge.l.default.appearance
        try await runSnapshotTest(view:BadgeSizeLDefaultContentLeft(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeMAccentContentRight() async throws {
        let appearance = Badge.m.accent.appearance
        try await runSnapshotTest(view: BadgeSizeMAccentContentRight(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeSPositivePilled() async throws {
        let appearance = Badge.s.pilled.positive.appearance
        try await runSnapshotTest(view: BadgeSizeSPositivePilled(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeXsWarning() async throws {
        let appearance = Badge.xs.warning.appearance
        try await runSnapshotTest(view: BadgeSizeXsWarning(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeLNegative() async throws {
        let appearance = Badge.l.negative.appearance
        try await runSnapshotTest(view: BadgeSizeLNegative(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeMDark() async throws {
        let appearance = Badge.m.dark.appearance
        try await runSnapshotTest(view: BadgeSizeMDark(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeSLight() async throws {
        let appearance = Badge.s.light.appearance
        try await runSnapshotTest(view: BadgeSizeSLight(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeLDefaultClear() async throws {
        let appearance = BadgeClear.l.default.appearance
        try await runSnapshotTest(view: BadgeSizeLDefaultClear(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeLDefaultTransparent() async throws {
        let appearance = BadgeTransparent.l.default.appearance
        try await runSnapshotTest(view: BadgeSizeLDefaultTransparent(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeMNegativeClear() async throws {
        let appearance = BadgeClear.m.negative.appearance
        try await runSnapshotTest(view: BadgeSizeMNegativeClear(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeSWarningTransparent() async throws {
        let appearance = BadgeTransparent.s.pilled.warning.appearance
        try await runSnapshotTest(view: BadgeSizeSWarningTransparent(appearance: appearance))
    }
}
