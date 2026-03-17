//
//  NavigationBarPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 13.03.2026.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class NavigationBarPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testNavBarMainPageNoBackgroundInlineCenterInlineHomeDS() async throws {
        let appearance = NavigationBarMainPage.default.appearance
        try await runSnapshotTest(view: NavBarMainPageNoBackgroundInlineCenterInline(appearance: appearance))
    }
    
    @MainActor
    func testNavBarInternalPageNoBackgroundRoundedHomeDS() async throws {
        let appearance = NavigationBarInternalPage.default.appearance
        try await runSnapshotTest(view: NavBarInternalPageNoBackgroundRounded(appearance: appearance))
    }
    
    @MainActor
    func testNavBarInternalPageHasBackgroundLongTextContentHomeDS() async throws {
        let appearance = NavigationBarInternalPage.default.appearance
        try await runSnapshotTest(view: NavBarInternalPageHasBackgroundLongTextContent(appearance: appearance))
    }
    
    @MainActor
    func testNavBarInternalPageHasBackgroundRoundedNoContentHomeDS() async throws {
        let appearance = NavigationBarInternalPage.default.appearance
        try await runSnapshotTest(view: NavBarInternalPageHasBackgroundRoundedNoContent(appearance: appearance))
    }
    
    @MainActor
    func testNavBarInternalPageHasBackgroundShadowHomeDS() async throws {
        let appearance = NavigationBarInternalPage.default.appearance
        try await runSnapshotTest(view: NavBarInternalPageHasBackgroundShadow(appearance: appearance))
    }
    
    @MainActor
    func testNavBarInternalPageHasBackgroundShadowRoundedHomeDS() async throws {
        let appearance = NavigationBarInternalPage.default.appearance
        try await runSnapshotTest(view: NavBarInternalPageHasBackgroundShadowRounded(appearance: appearance))
    }
}
