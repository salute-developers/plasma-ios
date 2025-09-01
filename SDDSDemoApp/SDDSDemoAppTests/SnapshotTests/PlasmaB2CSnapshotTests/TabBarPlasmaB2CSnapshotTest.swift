//
//  TabBarPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 01.09.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class TabBarPlasmaB2CSnapshotTest: XCTestCase {
    
    @MainActor
    func testTabBarClearLDefaultExtraTypeNonePlasmaB2C() async throws {
        let appearance = TabBarClear.l.default.appearance

        try await runSnapshotTest(view: TabBarClearLDefaultExtraTypeNone(appearance: appearance))
    }
    
    @MainActor
    func testTabBarHasLabelClearMSecondaryCounterPlasmaB2C() async throws {
        let appearance = TabBarHasLabelClear.m.secondary.appearance
        
        try await runSnapshotTest(view: TabBarHasLabelClearMSecondaryCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarHasLabelSolidLAccentIndicatorPlasmaB2C() async throws {
        let appearance = TabBarHasLabel.l.accent.appearance
        
        try await runSnapshotTest(view: TabBarHasLabelSolidLAccentIndicator(appearance: appearance))
    }
    
    @MainActor
    func testTabBarIslandClearLShadowDefaultPlasmaB2C() async throws {
        let appearance = TabBarIslandClear.l.shadow.default.appearance
        
        try await runSnapshotTest(view: TabBarIslandClearLShadowDefault(appearance: appearance))
    }
    
    @MainActor
    func testTabBarIslandHasLabelClearLShadowSecondaryCounterPlasmaB2C() async throws {
        let appearance = TabBarIslandHasLabelClear.l.shadow.secondary.appearance
        
        try await runSnapshotTest(view: TabBarIslandHasLabelClearLShadowSecondaryCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarHasLabelSolidLShadowAccentCounterPlasmaB2C() async throws {
        let appearance = TabBarHasLabel.l.shadow.accent.appearance
        
        try await runSnapshotTest(view: TabBarHasLabelSolidLShadowAccentCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarIslandSolidLDefaultCounterPlasmaB2C() async throws {
        let appearance = TabBarIsland.l.default.appearance
        
        try await runSnapshotTest(view: TabBarIslandSolidLDefaultCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarSolidLRoundedDefaultIndicatorPlasmaB2C() async throws {
        let appearance = TabBar.l.rounded.default.appearance
        
        try await runSnapshotTest(view: TabBarSolidLRoundedDefaultIndicator(appearance: appearance))
    }
    
    @MainActor
    func testTabBarClearMRoundedSecondaryCounterPlasmaB2C() async throws {
        let appearance = TabBarClear.m.rounded.secondary.appearance
        
        try await runSnapshotTest(view: TabBarClearMRoundedSecondaryCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarHasLabelSolidLDividerDefaultCounterPlasmaB2C() async throws {
        let appearance = TabBarHasLabelClear.l.divider.default.appearance
        
        try await runSnapshotTest(view: TabBarHasLabelSolidLDividerDefaultCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarSolidLDividerSecondarytCounterPlasmaB2C() async throws {
        let appearance = TabBar.l.divider.secondary.appearance
        
        try await runSnapshotTest(view: TabBarSolidLDividerSecondarytCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarClearLDividerAccenttCounterPlasmaB2C() async throws {
        let appearance = TabBarClear.l.divider.accent.appearance
        
        try await runSnapshotTest(view: TabBarClearLDividerAccenttCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarClearLDividerRoundedDefaultPlasmaB2C() async throws {
        let appearance = TabBarClear.l.divider.rounded.default.appearance
        
        try await runSnapshotTest(view: TabBarClearLDividerRoundedDefault(appearance: appearance))
    }
    
    @MainActor
    func testTabBarClearLDividerRoundedSecondaryPlasmaB2C() async throws {
        let appearance = TabBarClear.l.divider.rounded.secondary.appearance
        
        try await runSnapshotTest(view: TabBarClearLDividerRoundedSecondary(appearance: appearance))
    }
    
    @MainActor
    func testTabBarSolidLDividerRoundedAccentPlasmaB2C() async throws {
        let appearance = TabBar.l.divider.rounded.accent.appearance
        
        try await runSnapshotTest(view: TabBarSolidLDividerRoundedAccent(appearance: appearance))
    }
    
    @MainActor
    func testTabBarSolidLShadowRoundedAccentPlasmaB2C() async throws {
        let appearance = TabBar.l.shadow.rounded.accent.appearance
        
        try await runSnapshotTest(view: TabBarSolidLShadowRoundedAccent(appearance: appearance))
    }
    
    @MainActor
    func testTabBarSolidLShadowRoundedSecondaryPlasmaB2C() async throws {
        let appearance = TabBar.l.shadow.rounded.secondary.appearance
        
        try await runSnapshotTest(view: TabBarSolidLShadowRoundedSecondary(appearance: appearance))
    }
    
    @MainActor
    func testTabBarSolidLShadowRoundedDefaultPlasmaB2C() async throws {
        let appearance = TabBar.l.shadow.rounded.default.appearance
        
        try await runSnapshotTest(view: TabBarSolidLShadowRoundedDefault(appearance: appearance))
    }
}
