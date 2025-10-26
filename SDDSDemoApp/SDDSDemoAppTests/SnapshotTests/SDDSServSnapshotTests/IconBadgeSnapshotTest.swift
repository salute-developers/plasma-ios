//
//  IconBadgeSnapshotTest.swift
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

final class IconBadgeSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testIconBadgeSizeLDefault() async throws {
        let appearance = IconBadge.l.default.appearance
        try await runSnapshotTest(view: IconBadgeSizeLDefault(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeMAccentPilled() async throws {
        let appearance = IconBadge.m.pilled.accent.appearance
        try await runSnapshotTest(view: IconBadgeSizeMAccentPilled(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeSPositiveClear() async throws {
        let appearance = IconBadgeClear.s.positive.appearance
        try await runSnapshotTest(view: IconBadgeSizeSPositiveClear(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeXsWarningTransparent() async throws {
        let appearance = IconBadgeTransparent.xs.warning.appearance
        try await runSnapshotTest(view: IconBadgeSizeXsWarningTransparent(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeLNegative() async throws {
        let appearance = IconBadge.l.negative.appearance
        try await runSnapshotTest(view: IconBadgeSizeLNegative(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeMDark() async throws {
        let appearance = IconBadge.m.dark.appearance
        try await runSnapshotTest(view: IconBadgeSizeMDark(appearance: appearance))
    }
    
    @MainActor
    func testIconBadgeSizeSLight() async throws {
        let appearance = IconBadge.s.light.appearance
        try await runSnapshotTest(view: IconBadgeSizeSLight(appearance: appearance))
    }
}
