//
//  ButtonGroupPlasmaHomeDSSnapshotTest.swift
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

final class ButtonGroupPlasmaHomeDSSnapshotTest: XCTestCase {
    
    @MainActor
    func testButtonGroupMDefaultNoGapHomeDS() async throws {
        let appearance = BasicButton.m.default.appearance
        let buttonGroupAppearance = BasicButtonGroup.m.noGap.default.appearance

        try await runSnapshotTest(view: ButtonGroupLDefaultNoGap(
            appearance: appearance,
            buttonGroupAppearance: buttonGroupAppearance), landscape: true
        )
    }
    
    @MainActor
    func testButtonGroupMDenseDefaultHorizontalHomeDS() async throws {
        let appearance = BasicButton.m.default.appearance
        let buttonGroupAppearance = BasicButtonGroup.m.dense.default.appearance

        try await runSnapshotTest(view: ButtonGroupMDenseDefaultHorizontal(
            appearance: appearance,
            buttonGroupAppearance: buttonGroupAppearance)
        )
    }
    
    @MainActor
    func testButtonGroupSWideDefaultSegmentedHorizontalHomeDS() async throws {
        let appearance = BasicButton.s.default.appearance
        let buttonGroupAppearance = BasicButtonGroup.s.wide.segmented.appearance

        try await runSnapshotTest(view: ButtonGroupSWideDefaultSegmentedHorizontal(
            appearance: appearance,
            buttonGroupAppearance: buttonGroupAppearance)
        )
    }
    
    @MainActor
    func testButtonGroupXsGapNoneDefaultVerticalHomeDS() async throws {
        let appearance = BasicButton.xs.default.appearance
        let buttonGroupAppearance = BasicButtonGroup.xs.noGap.default.appearance

        try await runSnapshotTest(view: ButtonGroupXsGapNoneDefaultVertical(
            appearance: appearance,
            buttonGroupAppearance: buttonGroupAppearance)
        )
    }
    
    @MainActor
    func testButtonGroupXsItemCountTenDefaultSegmentedHomeDS() async throws {
        let appearance = BasicButton.xs.default.appearance
        let buttonGroupAppearance = BasicButtonGroup.xs.noGap.segmented.appearance

        try await runSnapshotTest(
            view: ButtonGroupXxsItemCountTenDefaultSegmented(
            appearance: appearance,
            buttonGroupAppearance: buttonGroupAppearance),landscape: true
        )
    }
}
