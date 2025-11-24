//
//  TabsSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 21.11.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class TabsSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testTabsLDefaultHorizontalFiveDividerScroll() async throws {
        let appearance = TabsDefault.l.horizontal.appearance
        let tabItemAppearance = TabItemDefault.l.horizontal.appearance
        try await runSnapshotTest(view: TabsFiveDividerScroll(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testTabsMVerticalTwentyIconStartValueHasActionCounter() async throws {
        let appearance = TabsDefault.m.vertical.appearance
        let tabItemAppearance = TabItemDefault.m.vertical.appearance
        try await runSnapshotTest(view: TabsTwentyIconStartValueHasActionCounter(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testTabsSHorizontalFiveIconEndStretchHasDivider() async throws {
        let appearance = TabsDefault.s.horizontal.appearance
        let tabItemAppearance = TabItemDefault.s.horizontal.appearance
        try await runSnapshotTest(view: TabsFiveIconEndStretchHasDivider(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testTabsXsHorizontalTenShowAllCounter() async throws {
        let appearance = TabsDefault.xs.horizontal.appearance
        let tabItemAppearance = TabItemDefault.xs.horizontal.appearance
        try await runSnapshotTest(view: TabsTenShowAllCounter(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testTabsLVerticalHasDividerStretch() async throws {
        let appearance = TabsDefault.l.vertical.appearance
        let tabItemAppearance = TabItemDefault.l.vertical.appearance
        try await runSnapshotTest(view: TabsHasDividerStretch(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testTabsDisabled() async throws {
        let appearance = TabsDefault.l.horizontal.appearance
        let tabItemAppearance = TabItemDefault.l.horizontal.appearance
        try await runSnapshotTest(view: TabsDisabled(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testTabsH1ValueFiveScrollHasDivider() async throws {
        let appearance = TabsHeader.h1.appearance
        let tabItemAppearance = TabItemHeader.h1.appearance
        try await runSnapshotTest(view: TabsValueFiveScrollHasDivider(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testTabsH2TwoValueStretch() async throws {
        let appearance = TabsHeader.h2.appearance
        let tabItemAppearance = TabItemHeader.h2.appearance
        try await runSnapshotTest(view: TabsTwoValueStretch(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testTabsH3OneValueStretchShowAllHasAction() async throws {
        let appearance = TabsHeader.h3.appearance
        let tabItemAppearance = TabItemHeader.h3.appearance
        try await runSnapshotTest(view: TabsOneValueShowAllHasAction(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testTabsH4FiveIconEndValueHasActionScrollCounter() async throws {
        let appearance = TabsHeader.h4.appearance
        let tabItemAppearance = TabItemHeader.h4.appearance
        try await runSnapshotTest(view: TabsFiveIconEndValueHasActionScrollCounter(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testTabsH5ValueShowAll() async throws {
        let appearance = TabsHeader.h5.appearance
        let tabItemAppearance = TabItemHeader.h5.appearance
        try await runSnapshotTest(view: TabsValueShowAll(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testIconTabsLHorizontalFiveHasActionScroll() async throws {
        let appearance = IconTabs.l.horizontal.appearance
        let tabItemAppearance = IconTabItem.l.appearance
        try await runSnapshotTest(view: IconTabsFiveHasActionScroll(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testIconTabsMVerticalFiveStretchCounter() async throws {
        let appearance = IconTabs.m.vertical.appearance
        let tabItemAppearance = IconTabItem.m.appearance
        try await runSnapshotTest(view: IconTabsFiveStretchCounter(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testIconTabsSHorizontalShowAllHasAction() async throws {
        let appearance = IconTabs.s.horizontal.appearance
        let tabItemAppearance = IconTabItem.s.appearance
        try await runSnapshotTest(view: IconTabsShowAllHasAction(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testIconTabsXsVerticalHasActionScrollCounter() async throws {
        let appearance = IconTabs.xs.vertical.appearance
        let tabItemAppearance = IconTabItem.xs.appearance
        try await runSnapshotTest(view: IconTabsVerticalHasActionScrollCounter(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
    
    @MainActor
    func testIconTabsLHorizontalHasActionScrollDisabled() async throws {
        let appearance = IconTabs.l.horizontal.appearance
        let tabItemAppearance = IconTabItem.l.appearance
        try await runSnapshotTest(view: IconTabsHorizontalHasActionScrollDisabled(appearance: appearance, tabItemAppearance: tabItemAppearance))
    }
}
