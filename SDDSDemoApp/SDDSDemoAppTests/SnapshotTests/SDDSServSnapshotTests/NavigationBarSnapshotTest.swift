//
//  NavigationBarSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.11.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class NavigationBarSnapshotTest : SDDSServThemeTestCase {
    
    @MainActor
    func testNavBarMainPageNoBackgroundInlineCenterInline() async throws {
        let appearance = NavigationBarMainPage.noBackground.appearance
        try await runSnapshotTest(view: NavBarMainPageNoBackgroundInlineCenterInline(appearance: appearance))
    }
    
    @MainActor
    func testNavBarInternalPageNoBackgroundRounded() async throws {
        let appearance = NavigationBarInternalPage.noBackground.rounded.appearance
        try await runSnapshotTest(view: NavBarInternalPageNoBackgroundRounded(appearance: appearance))
    }
    
    @MainActor
    func testNavBarInternalPageHasBackgroundLongTextContent() async throws {
        let appearance = NavigationBarInternalPage.hasBackground.appearance
        try await runSnapshotTest(view: NavBarInternalPageHasBackgroundLongTextContent(appearance: appearance))
    }
    
    @MainActor
    func testNavBarInternalPageHasBackgroundRoundedNoContent() async throws {
        let appearance = NavigationBarInternalPage.hasBackground.rounded.appearance
        try await runSnapshotTest(view: NavBarInternalPageHasBackgroundRoundedNoContent(appearance: appearance))
    }
    
    @MainActor
    func testNavBarInternalPageHasBackgroundShadow() async throws {
        let appearance = NavigationBarInternalPage.hasBackground.shadow.appearance
        try await runSnapshotTest(view: NavBarInternalPageHasBackgroundShadow(appearance: appearance))
    }
    
    @MainActor
    func testNavBarInternalPageHasBackgroundShadowRounded() async throws {
        let appearance = NavigationBarInternalPage.hasBackground.shadow.rounded.appearance
        try await runSnapshotTest(view: NavBarInternalPageHasBackgroundShadowRounded(appearance: appearance))
    }
}
