//
//  TabBarPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.10.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class TabBarPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testTabBarDefaultNoneHomeDS() async throws {
        let appearance = TabBar.default.appearance
        try await runSnapshotTest(view: TabBarIslandClearLShadowDefault(appearance: appearance))
    }
    
    @MainActor
    func testTabBarCounterHomeDS() async throws {
        let appearance = TabBar.default.appearance
        try await runSnapshotTest(view: TabBarIslandHasLabelClearLShadowSecondaryCounter(appearance: appearance))
    }
    
    @MainActor
    func testTabBarIndicatorHomeDS() async throws {
        let appearance = TabBar.default.appearance
        try await runSnapshotTest(view: TabBarIslandIndicator(appearance: appearance))
    }
    
    @MainActor
    func testTabBarCustomWeightHomeDS() async throws {
        let appearance = TabBar.default.appearance
        try await runSnapshotTest(view: TabBarIslandCustomWeight(appearance: appearance))
    }
}
