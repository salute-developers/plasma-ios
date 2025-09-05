//
//  TabBarSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 03.09.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class TabBarSnapshotTest: XCTestCase {
    
    @MainActor
    func testTabBarClearLDefaultExtraTypeNone() async throws {
        let appearance = TabBarClear.l.default.appearance

        try await runSnapshotTest(view: TabBarClearLDefaultExtraTypeNone(appearance: appearance))
    }
    
    @MainActor
    func testTabBarHasLabelClearMSecondaryCounter() async throws {
        let appearance = TabBarHasLabelClear.m.secondary.appearance
        
        try await runSnapshotTest(view: TabBarHasLabelClearMSecondaryCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarHasLabelSolidLAccentIndicator() async throws {
        let appearance = TabBarHasLabel.l.accent.appearance
        
        try await runSnapshotTest(view: TabBarHasLabelSolidLAccentIndicator(appearance: appearance))
    }
    
    @MainActor
    func testTabBarIslandClearLShadowDefault() async throws {
        let appearance = TabBarIslandClear.l.shadow.default.appearance
        
        try await runSnapshotTest(view: TabBarIslandClearLShadowDefault(appearance: appearance))
    }
    
    @MainActor
    func testTabBarIslandHasLabelClearLShadowSecondaryCounter() async throws {
        let appearance = TabBarIslandHasLabelClear.l.shadow.secondary.appearance
        
        try await runSnapshotTest(view: TabBarIslandHasLabelClearLShadowSecondaryCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarHasLabelSolidLShadowAccentCounter() async throws {
        let appearance = TabBarHasLabel.l.shadow.accent.appearance
        
        try await runSnapshotTest(view: TabBarHasLabelSolidLShadowAccentCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarIslandSolidLDefaultCounter() async throws {
        let appearance = TabBarIsland.l.default.appearance
        
        try await runSnapshotTest(view: TabBarIslandSolidLDefaultCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarSolidLRoundedDefaultIndicator() async throws {
        let appearance = TabBar.l.rounded.default.appearance
        
        try await runSnapshotTest(view: TabBarSolidLRoundedDefaultIndicator(appearance: appearance))
    }
    
    @MainActor
    func testTabBarClearMRoundedSecondaryCounter() async throws {
        let appearance = TabBarClear.m.rounded.secondary.appearance
        
        try await runSnapshotTest(view: TabBarClearMRoundedSecondaryCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarHasLabelSolidLDividerDefaultCounter() async throws {
        let appearance = TabBarHasLabelClear.l.divider.default.appearance
        
        try await runSnapshotTest(view: TabBarHasLabelSolidLDividerDefaultCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarSolidLDividerSecondarytCounter() async throws {
        let appearance = TabBar.l.divider.secondary.appearance
        
        try await runSnapshotTest(view: TabBarSolidLDividerSecondarytCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarClearLDividerAccenttCounter() async throws {
        let appearance = TabBarClear.l.divider.accent.appearance
        
        try await runSnapshotTest(view: TabBarClearLDividerAccenttCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarClearLDividerRoundedDefault() async throws {
        let appearance = TabBarClear.l.divider.rounded.default.appearance
        
        try await runSnapshotTest(view: TabBarClearLDividerRoundedDefault(appearance: appearance))
    }
    
    @MainActor
    func testTabBarClearLDividerRoundedSecondary() async throws {
        let appearance = TabBarClear.l.divider.rounded.secondary.appearance
        
        try await runSnapshotTest(view: TabBarClearLDividerRoundedSecondary(appearance: appearance))
    }
    
    @MainActor
    func testTabBarSolidLDividerRoundedAccent() async throws {
        let appearance = TabBar.l.divider.rounded.accent.appearance
        
        try await runSnapshotTest(view: TabBarSolidLDividerRoundedAccent(appearance: appearance))
    }
    
    @MainActor
    func testTabBarSolidLShadowRoundedAccent() async throws {
        let appearance = TabBar.l.shadow.rounded.accent.appearance
        
        try await runSnapshotTest(view: TabBarSolidLShadowRoundedAccent(appearance: appearance))
    }
    
    @MainActor
    func testTabBarSolidLShadowRoundedSecondary() async throws {
        let appearance = TabBar.l.shadow.rounded.secondary.appearance
        
        try await runSnapshotTest(view: TabBarSolidLShadowRoundedSecondary(appearance: appearance))
    }
    
    @MainActor
    func testTabBarSolidLShadowRoundedDefault() async throws {
        let appearance = TabBar.l.shadow.rounded.default.appearance
        
        try await runSnapshotTest(view: TabBarSolidLShadowRoundedDefault(appearance: appearance))
    }
}
