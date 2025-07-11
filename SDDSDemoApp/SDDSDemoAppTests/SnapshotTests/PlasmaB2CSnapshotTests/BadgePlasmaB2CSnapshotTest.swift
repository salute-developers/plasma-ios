//
//  BadgePlasmaB2CSnapshotTest.swift
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

final class BadgePlasmaB2CSnapshotTest: XCTestCase {
    
    @MainActor
    func testBadgeSizeLDefaultContentLeftPlasmaB2C() async throws {
        let appearance = Badge.l.default.appearance
        try await runSnapshotTest(view:BadgeSizeLDefaultContentLeft(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeMAccentContentRightPlasmaB2C() async throws {
        let appearance = Badge.m.accent.appearance
        try await runSnapshotTest(view: BadgeSizeMAccentContentRight(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeSPositivePilledPlasmaB2C() async throws {
        let appearance = Badge.s.pilled.positive.appearance
        try await runSnapshotTest(view: BadgeSizeSPositivePilled(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeXsWarningPlasmaB2C() async throws {
        let appearance = Badge.xs.warning.appearance
        try await runSnapshotTest(view: BadgeSizeXsWarning(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeLNegativePlasmaB2C() async throws {
        let appearance = Badge.l.negative.appearance
        try await runSnapshotTest(view: BadgeSizeLNegative(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeMDarkPlasmaB2C() async throws {
        let appearance = Badge.m.dark.appearance
        try await runSnapshotTest(view: BadgeSizeMDark(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeSLightPlasmaB2C() async throws {
        let appearance = Badge.s.light.appearance
        try await runSnapshotTest(view: BadgeSizeSLight(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeLDefaultClearPlasmaB2C() async throws {
        let appearance = BadgeClear.l.default.appearance
        try await runSnapshotTest(view: BadgeSizeLDefaultClear(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeLDefaultTransparentPlasmaB2C() async throws {
        let appearance = BadgeTransparent.l.default.appearance
        try await runSnapshotTest(view: BadgeSizeLDefaultTransparent(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeMNegativeClearPlasmaB2C() async throws {
        let appearance = BadgeClear.m.negative.appearance
        try await runSnapshotTest(view: BadgeSizeMNegativeClear(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeSWarningTransparentPlasmaB2C() async throws {
        let appearance = BadgeTransparent.s.pilled.warning.appearance
        try await runSnapshotTest(view: BadgeSizeSWarningTransparent(appearance: appearance))
    }
}
