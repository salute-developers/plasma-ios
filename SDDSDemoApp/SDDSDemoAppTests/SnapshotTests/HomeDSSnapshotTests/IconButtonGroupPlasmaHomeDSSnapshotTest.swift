//
//  IconButtonGroupPlasmaHomeDSSnapshotTest.swift
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

final class IconButtonGroupPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testIconButtonGroupMGapNoneDefaultHorizontalHomeDS() async throws {
        let appearance = IconButton.m.default.appearance
        let iconButtonGroupAppearance = IconButtonGroup.m.noGap.appearance
        
        try await runSnapshotTest(view: IconButtonGroupAmountThreeHorizontal(
            appearance: appearance, iconButtonGroupAppearance: iconButtonGroupAppearance))
    }
    
    @MainActor
    func testIconButtonGroupMGapDensePilledtHorizontalHomeDS() async throws {
        let appearance = IconButton.m.default.appearance
        let iconButtonGroupAppearance = IconButtonGroup.m.dense.pilled.appearance
        
        try await runSnapshotTest(view: IconButtonGroupAmountThreeHorizontal(
            appearance: appearance, iconButtonGroupAppearance: iconButtonGroupAppearance))
    }
    
    @MainActor
    func testIconButtonGroupSGapWideSegmentedHorizontalHomeDS() async throws {
        let appearance = IconButton.s.default.appearance
        let iconButtonGroupAppearance = IconButtonGroup.s.wide.segmented.appearance
        
        try await runSnapshotTest(view: IconButtonGroupAmountThreeHorizontal(
            appearance: appearance, iconButtonGroupAppearance: iconButtonGroupAppearance))
    }
    
    @MainActor
    func testIconButtonGroupXsGapNoneDefaultVerticalHomeDS() async throws {
        let appearance = IconButton.xs.default.appearance
        let iconButtonGroupAppearance = IconButtonGroup.xs.noGap.appearance
        
        try await runSnapshotTest(view: IconButtonGroupAmountThreeVertical(
            appearance: appearance, iconButtonGroupAppearance: iconButtonGroupAppearance))
    }
    
    @MainActor
    func testIconButtonGroupLAmountTenGapNoneSegmentedHorizontalHomeDS() async throws {
        let appearance = IconButton.l.default.appearance
        let iconButtonGroupAppearance = IconButtonGroup.l.noGap.segmented.appearance
        
        try await runSnapshotTest(view: IconButtonGroupAmountTenHorizontal(
            appearance: appearance, iconButtonGroupAppearance: iconButtonGroupAppearance), landscape: true
        )
    }
}
