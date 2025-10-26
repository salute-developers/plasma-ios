//
//  IconBadgePlasmaB2CSnapshotTest.swift
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

final class IconBadgePlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testIconBadgeSizeLDefaultPlasmaB2C() async throws {
        let appearance = IconBadge.l.default.appearance
        try await runSnapshotTest(view: IconBadgeSizeLDefault(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeMAccentPilledPlasmaB2C() async throws {
        let appearance = IconBadge.m.pilled.accent.appearance
        try await runSnapshotTest(view: IconBadgeSizeMAccentPilled(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeSPositiveClearPlasmaB2C() async throws {
        let appearance = IconBadgeClear.s.positive.appearance
        try await runSnapshotTest(view: IconBadgeSizeSPositiveClear(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeXsWarningTransparentPlasmaB2C() async throws {
        let appearance = IconBadgeTransparent.xs.warning.appearance
        try await runSnapshotTest(view: IconBadgeSizeXsWarningTransparent(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeLNegativePlasmaB2C() async throws {
        let appearance = IconBadge.l.negative.appearance
        try await runSnapshotTest(view: IconBadgeSizeLNegative(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeMDarkPlasmaB2C() async throws {
        let appearance = IconBadge.m.dark.appearance
        try await runSnapshotTest(view: IconBadgeSizeMDark(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeSLightPlasmaB2C() async throws {
        let appearance = IconBadge.s.light.appearance
        try await runSnapshotTest(view: IconBadgeSizeSLight(appearance: appearance))
    }
}
