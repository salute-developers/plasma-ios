//
//  CollapsingNavBarHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 20.02.2026.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI
import Combine

final class CollapsingNavBarHomeDSSnapshotTest : PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testCollapsingNavBarTitleDescStartAbsoulte() async throws {
        let appearance = CollapsingNavigationBarMainPage.default.appearance
        try await runSnapshotTest(view: CollapsingNavBarTitleDescStartAbsoulte(appearance: appearance))
    }
    
    @MainActor
    func testCollapsingNavBarLongExpandedTitleDesc() async throws {
        let appearance = CollapsingNavigationBarMainPage.default.appearance
    
        try await runSnapshotTest(view: CollapsingNavBarLongExpandedTitleDesc(appearance: appearance))
    }
}
