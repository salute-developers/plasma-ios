//
//  ButtonGroupSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 29.09.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class ButtonGroupSnapshotTest: XCTestCase {
    
    @MainActor
    func testButtonGroupLDefaultNoGap() async throws {
        let appearance = BasicButton.l.default.appearance
        let buttonGroupAppearance = BasicButtonGroup.l.noGap.default.appearance

        try await runSnapshotTest(view: ButtonGroupLDefaultNoGap(
            appearance: appearance,
            buttonGroupAppearance: buttonGroupAppearance), landscape: true
        )
    }
    
    @MainActor
    func testButtonGroupMDenseDefaultHorizontal() async throws {
        let appearance = BasicButton.m.default.appearance
        let buttonGroupAppearance = BasicButtonGroup.m.dense.default.appearance

        try await runSnapshotTest(view: ButtonGroupMDenseDefaultHorizontal(
            appearance: appearance,
            buttonGroupAppearance: buttonGroupAppearance)
        )
    }
    
    @MainActor
    func testButtonGroupSWideDefaultSegmentedHorizontal() async throws {
        let appearance = BasicButton.s.default.appearance
        let buttonGroupAppearance = BasicButtonGroup.s.wide.segmented.appearance

        try await runSnapshotTest(view: ButtonGroupSWideDefaultSegmentedHorizontal(
            appearance: appearance,
            buttonGroupAppearance: buttonGroupAppearance)
        )
    }
    
    @MainActor
    func testButtonGroupXsGapNoneDefaultVertical() async throws {
        let appearance = BasicButton.xs.default.appearance
        let buttonGroupAppearance = BasicButtonGroup.xs.noGap.default.appearance

        try await runSnapshotTest(view: ButtonGroupXsGapNoneDefaultVertical(
            appearance: appearance,
            buttonGroupAppearance: buttonGroupAppearance)
        )
    }
    
    @MainActor
    func testButtonGroupXxsItemCountTenDefaultSegmented() async throws {
        let appearance = BasicButton.xxs.default.appearance
        let buttonGroupAppearance = BasicButtonGroup.xxs.noGap.segmented.appearance

        try await runSnapshotTest(view: ButtonGroupXxsItemCountTenDefaultSegmented(
            appearance: appearance,
            buttonGroupAppearance: buttonGroupAppearance), landscape: true
        )
    }
}
