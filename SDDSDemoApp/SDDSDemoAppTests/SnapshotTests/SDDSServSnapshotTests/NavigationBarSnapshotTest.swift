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
    func testNavigationBarMainPageNoBackgroundInlineCenterInline() async throws {
        let appearance = NavigationBarMainPage.noBackground.appearance
        try await runSnapshotTest(view: NavigationBarMainPageNoBackgroundInlineCenterInline(appearance: appearance))
    }
    
    @MainActor
    func testNavigationBarInternalPageNoBackgroundRounded() async throws {
        let appearance = NavigationBarInternalPage.noBackground.rounded.appearance
        try await runSnapshotTest(view: NavigationBarInternalPageNoBackgroundRounded(appearance: appearance))
    }
    
    @MainActor
    func testNavigationBarInternalPageHasBackgroundLongTextContent() async throws {
        let appearance = NavigationBarInternalPage.hasBackground.appearance
        try await runSnapshotTest(view: NavigationBarInternalPageHasBackgroundLongTextContent(appearance: appearance))
    }
    
    @MainActor
    func testNavigationBarInternalPageHasBackgroundRoundedNoContent() async throws {
        let appearance = NavigationBarInternalPage.hasBackground.rounded.appearance
        try await runSnapshotTest(view: NavigationBarInternalPageHasBackgroundRoundedNoContent(appearance: appearance))
    }
    
    @MainActor
    func testNavigationBarInternalPageHasBackgroundShadow() async throws {
        let appearance = NavigationBarInternalPage.hasBackground.shadow.appearance
        try await runSnapshotTest(view: NavigationBarInternalPageHasBackgroundShadow(appearance: appearance))
    }
    
    @MainActor
    func testNavigationBarInternalPageHasBackgroundShadowRounded() async throws {
        let appearance = NavigationBarInternalPage.hasBackground.shadow.rounded.appearance
        try await runSnapshotTest(view: NavigationBarInternalPageHasBackgroundShadowRounded(appearance: appearance))
    }
}
