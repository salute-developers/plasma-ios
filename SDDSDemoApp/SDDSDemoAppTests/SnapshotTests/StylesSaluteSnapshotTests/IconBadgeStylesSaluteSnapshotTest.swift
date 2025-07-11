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
import StylesSaluteTheme
import UIKit
import SwiftUI

final class IconBadgeStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testIconBadgeSizeLDefaultStylesSalute() async throws {
        let appearance = IconBadge.l.default.appearance
        try await runSnapshotTest(view: IconBadgeSizeLDefault(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeMAccentPilledStylesSalute() async throws {
        let appearance = IconBadge.m.pilled.accent.appearance
        try await runSnapshotTest(view: IconBadgeSizeMAccentPilled(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeSPositiveClearStylesSalute() async throws {
        let appearance = IconBadgeClear.s.positive.appearance
        try await runSnapshotTest(view: IconBadgeSizeSPositiveClear(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeXsWarningTransparentStylesSalute() async throws {
        let appearance = IconBadgeTransparent.xs.warning.appearance
        try await runSnapshotTest(view: IconBadgeSizeXsWarningTransparent(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeLNegativeStylesSalute() async throws {
        let appearance = IconBadge.l.negative.appearance
        try await runSnapshotTest(view: IconBadgeSizeLNegative(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeMDarkStylesSalute() async throws {
        let appearance = IconBadge.m.dark.appearance
        try await runSnapshotTest(view: IconBadgeSizeMDark(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeSLightStylesSalute() async throws {
        let appearance = IconBadge.s.light.appearance
        try await runSnapshotTest(view: IconBadgeSizeSLight(appearance: appearance))
    }
}
