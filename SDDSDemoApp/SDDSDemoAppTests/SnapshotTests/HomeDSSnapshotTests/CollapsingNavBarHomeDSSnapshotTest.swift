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
    func testCollapsingNavBarTitleDescStartAbsoultePlasmaHomeDS() async throws {
        let appearance = CollapsingNavigationBarMainPage.default.appearance
        try await runSnapshotTest(view: CollapsingNavBarTitleDescStartAbsoulte(appearance: appearance))
    }
    
    @MainActor
    func testCollapsingNavBarLongExpandedTitleDescPlasmaHomeDS() async throws {
        let appearance = CollapsingNavigationBarMainPage.default.appearance
    
        try await runSnapshotTest(view: CollapsingNavBarLongExpandedTitleDesc(appearance: appearance))
    }
    
    @MainActor
    func testCollapsingNavBarLongContentPlasmaHomeDS() async throws {
        let appearance = CollapsingNavigationBarMainPage.default.appearance
        
        try await runSnapshotTest(view: CollapsingNavBarLongContent(appearance: appearance))
    }
    
    @MainActor
    func testCollapsingNavBarNoActionStartRelativePlasmaHomeDS() async throws {
        let appearance = CollapsingNavigationBarInternalPage.default.appearance
        
        try await runSnapshotTest(view: CollapsingNavBarNoActionStartRelative(appearance: appearance))
    }
    
    @MainActor
    func testCollapsingNavigationBarLongDescriptionCollapsedPlasmaHomeDS() async throws { // не видно текста
        let appearance = CollapsingNavigationBarMainPage.default.appearance
        
        try await runSnapshotTest(view: CollapsingNavigationBarLongDescriptionCollapsed(appearance: appearance))
    }
    
    @MainActor
    func testCollapsingNavigationBarNoActionStartAbsolutePlasmaHomeDS() async throws {
        let appearance = CollapsingNavigationBarInternalPage.default.appearance
        
        try await runSnapshotTest(view: CollapsingNavigationBarNoActionStartAbsolute(appearance: appearance))
    }
    
    @MainActor
    func testCollapsingNavigationBarCollapsedTextEndAbsolutePlasmaHomeDS() async throws {
        let appearance = CollapsingNavigationBarInternalPage.default.appearance
        
        try await runSnapshotTest(view: CollapsingNavigationBarCollapsedTextEndAbsolute(appearance: appearance))
    }
    
    @MainActor
    func testCollapsingNavigationBarEndAbsolutePlasmaHomeDS() async throws {
        let appearance = CollapsingNavigationBarInternalPage.default.appearance
        
        try await runSnapshotTest(view: CollapsingNavigationBarEndAbsolute(appearance: appearance))
    }
    
    @MainActor
    func testCollapsingNavigationBarStartAbsolutePlasmaHomeDS() async throws {
        let appearance = CollapsingNavigationBarMainPage.default.appearance
        
        try await runSnapshotTest(view: CollapsingNavigationBarStartAbsolute(appearance: appearance))
    }
    
    @MainActor
    func testCollapsingNavigationBarCollapsedCenterAbsolutePlasmaHomeDS() async throws { // не видно текста
        let appearance = CollapsingNavigationBarMainPage.default.appearance
    
        try await runSnapshotTest(view: CollapsingNavigationBarCollapsedCenterAbsolute(appearance: appearance))
    }
    
    @MainActor
    func testCollapsingNavigationBarCollapsedEndAbsolutePlasmaHomeDS() async throws {
        let appearance = CollapsingNavigationBarMainPage.default.appearance
        
        try await runSnapshotTest(view: CollapsingNavigationBarCollapsedEndAbsolute(appearance: appearance))
    }
}
