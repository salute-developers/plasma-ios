//
//  IconBadgePlasmaHomeDSSnapshotTest.swift
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

final class IconBadgePlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testIconBadgeSizeLDefaultPlasmaHomeDS() async throws {
        let appearance = IconBadge.l.default.appearance
        try await runSnapshotTest(view: IconBadgeSizeLDefault(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeMAccentPilledPlasmaHomeDS() async throws {
        let appearance = IconBadge.m.pilled.accent.appearance
        try await runSnapshotTest(view: IconBadgeSizeMAccentPilled(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeSPositiveClearPlasmaHomeDS() async throws {
        let appearance = IconBadgeClear.s.positive.appearance
        try await runSnapshotTest(view: IconBadgeSizeSPositiveClear(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeXsWarningTransparentPlasmaHomeDS() async throws {
        let appearance = IconBadgeTransparent.xs.warning.appearance
        try await runSnapshotTest(view: IconBadgeSizeXsWarningTransparent(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeLNegativePlasmaHomeDS() async throws {
        let appearance = IconBadge.l.negative.appearance
        try await runSnapshotTest(view: IconBadgeSizeLNegative(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeMDarkPlasmaHomeDS() async throws {
        let appearance = IconBadge.m.dark.appearance
        try await runSnapshotTest(view: IconBadgeSizeMDark(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeSLightPlasmaHomeDS() async throws {
        let appearance = IconBadge.s.light.appearance
        try await runSnapshotTest(view: IconBadgeSizeSLight(appearance: appearance))
    }
}
