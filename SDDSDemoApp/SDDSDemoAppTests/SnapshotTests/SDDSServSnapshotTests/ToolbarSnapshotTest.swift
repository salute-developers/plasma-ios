//
//  ToolbarSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 11.03.2026.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class ToolbarSnapshotTest : SDDSServThemeTestCase {
    
    @MainActor
    func testToolbarLHorizontalHasShadow() async throws {
        let appearance = ToolbarHorizontal.l.hasShadow.appearance
        let buttonAppearance = BasicButton.m.default.appearance
        let iconButtonAppearance = IconButton.m.default.appearance
        try await runSnapshotTest(view: ToolbarNoDivider(
            appearance: appearance,
            buttonAppearance: buttonAppearance,
            iconButtonAppearance: iconButtonAppearance)
        )
    }
    
    @MainActor
    func testToolbarMVertical() async throws {
        let appearance = ToolbarVertical.m.appearance
        let buttonAppearance = BasicButton.s.default.appearance
        let iconButtonAppearance = IconButton.s.default.appearance
        try await runSnapshotTest(view: ToolbarNoDivider(
            appearance: appearance,
            buttonAppearance: buttonAppearance,
            iconButtonAppearance: iconButtonAppearance)
        )
    }
    
    @MainActor
    func testToolbarSHorizontal() async throws {
        let appearance = ToolbarHorizontal.s.appearance
        let buttonAppearance = BasicButton.xs.default.appearance
        let iconButtonAppearance = IconButton.xs.default.appearance
        try await runSnapshotTest(view: ToolbarNoDivider(
            appearance: appearance,
            buttonAppearance: buttonAppearance,
            iconButtonAppearance: iconButtonAppearance)
        )
    }
    
    @MainActor
    func testToolbarXsHorizontal() async throws {
        let appearance = ToolbarHorizontal.xs.appearance
        let buttonAppearance = BasicButton.xxs.default.appearance
        let iconButtonAppearance = IconButton.xxs.default.appearance
        try await runSnapshotTest(view: ToolbarNoDivider(
            appearance: appearance,
            buttonAppearance: buttonAppearance,
            iconButtonAppearance: iconButtonAppearance)
        )
    }
    
    @MainActor
    func testToolbarLHorizontalHasDivider() async throws {
        let appearance = ToolbarHorizontal.l.appearance
        let buttonAppearance = BasicButton.m.default.appearance
        let iconButtonAppearance = IconButton.m.default.appearance
        try await runSnapshotTest(view: ToolbarHasDivider(
            appearance: appearance,
            buttonAppearance: buttonAppearance,
            iconButtonAppearance: iconButtonAppearance)
        )
    }
}
