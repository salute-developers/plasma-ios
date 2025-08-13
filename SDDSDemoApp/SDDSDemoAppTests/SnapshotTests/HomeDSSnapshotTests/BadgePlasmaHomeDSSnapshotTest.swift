//
//  BadgePlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 12.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class BadgePlasmaHomeDSSnapshotTest: XCTestCase {
    
    @MainActor
    func testBadgeSizeLDefaultContentLeftPlasmaHomeDS() async throws {
        let appearance = Badge.l.default.appearance
        try await runSnapshotTest(view:BadgeSizeLDefaultContentLeft(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeMAccentContentRightPlasmaHomeDS() async throws {
        let appearance = Badge.m.accent.appearance
        try await runSnapshotTest(view: BadgeSizeMAccentContentRight(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeSPositivePilledPlasmaHomeDS() async throws {
        let appearance = Badge.s.pilled.positive.appearance
        try await runSnapshotTest(view: BadgeSizeSPositivePilled(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeXsWarningPlasmaHomeDS() async throws {
        let appearance = Badge.xs.warning.appearance
        try await runSnapshotTest(view: BadgeSizeXsWarning(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeLNegativePlasmaHomeDS() async throws {
        let appearance = Badge.l.negative.appearance
        try await runSnapshotTest(view: BadgeSizeLNegative(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeMDarkPlasmaHomeDS() async throws {
        let appearance = Badge.m.dark.appearance
        try await runSnapshotTest(view: BadgeSizeMDark(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeSLightPlasmaHomeDS() async throws {
        let appearance = Badge.s.light.appearance
        try await runSnapshotTest(view: BadgeSizeSLight(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeLDefaultClearPlasmaHomeDS() async throws {
        let appearance = BadgeClear.l.default.appearance
        try await runSnapshotTest(view: BadgeSizeLDefaultClear(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeLDefaultTransparentPlasmaHomeDS() async throws {
        let appearance = BadgeTransparent.l.default.appearance
        try await runSnapshotTest(view: BadgeSizeLDefaultTransparent(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeMNegativeClearPlasmaHomeDS() async throws {
        let appearance = BadgeClear.m.negative.appearance
        try await runSnapshotTest(view: BadgeSizeMNegativeClear(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeSWarningTransparentPlasmaHomeDS() async throws {
        let appearance = BadgeTransparent.s.pilled.warning.appearance
        try await runSnapshotTest(view: BadgeSizeSWarningTransparent(appearance: appearance))
    }
}
