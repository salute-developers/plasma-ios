//
//  BadgeStylesSaluteSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 08.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class BadgeStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testBadgeSizeLDefaultContentLeftStylesSalute() async throws {
        let appearance = Badge.l.default.appearance
        try await runSnapshotTest(view:BadgeSizeLDefaultContentLeft(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeMAccentContentRightStylesSalute() async throws {
        let appearance = Badge.m.accent.appearance
        try await runSnapshotTest(view: BadgeSizeMAccentContentRight(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeSPositivePilledStylesSalute() async throws {
        let appearance = Badge.s.pilled.positive.appearance
        try await runSnapshotTest(view: BadgeSizeSPositivePilled(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeXsWarningStylesSalute() async throws {
        let appearance = Badge.xs.warning.appearance
        try await runSnapshotTest(view: BadgeSizeXsWarning(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeLNegativeStylesSalute() async throws {
        let appearance = Badge.l.negative.appearance
        try await runSnapshotTest(view: BadgeSizeLNegative(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeMDarkStylesSalute() async throws {
        let appearance = Badge.m.dark.appearance
        try await runSnapshotTest(view: BadgeSizeMDark(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeSLightStylesSalute() async throws {
        let appearance = Badge.s.light.appearance
        try await runSnapshotTest(view: BadgeSizeSLight(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeLDefaultClearStylesSalute() async throws {
        let appearance = BadgeClear.l.default.appearance
        try await runSnapshotTest(view: BadgeSizeLDefaultClear(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeLDefaultTransparentStylesSalute() async throws {
        let appearance = BadgeTransparent.l.default.appearance
        try await runSnapshotTest(view: BadgeSizeLDefaultTransparent(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeMNegativeClearStylesSalute() async throws {
        let appearance = BadgeClear.m.negative.appearance
        try await runSnapshotTest(view: BadgeSizeMNegativeClear(appearance: appearance))
    }
    
    @MainActor
    func testBadgeSizeSWarningTransparentStylesSalute() async throws {
        let appearance = BadgeTransparent.s.pilled.warning.appearance
        try await runSnapshotTest(view: BadgeSizeSWarningTransparent(appearance: appearance))
    }
}
