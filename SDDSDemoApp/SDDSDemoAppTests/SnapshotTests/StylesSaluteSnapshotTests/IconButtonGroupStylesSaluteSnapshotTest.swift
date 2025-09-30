//
//  IconButtonGroupStylesSaluteSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 29.09.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class IconButtonGroupStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testIconButtonGroupLGapNoneDefaultHorizontalStylesSalute() async throws {
        let appearance = IconButton.l.default.appearance
        let iconButtonGroupAppearance = IconButtonGroup.l.noGap.default.appearance
        
        try await runSnapshotTest(view: IconButtonGroupAmountThreeHorizontal(
            appearance: appearance, iconButtonGroupAppearance: iconButtonGroupAppearance))
    }
    
    @MainActor
    func testIconButtonGroupMGapDensePilledtHorizontalStylesSalute() async throws {
        let appearance = IconButton.m.pilled.default.appearance
        let iconButtonGroupAppearance = IconButtonGroup.m.dense.pilled.appearance
        
        try await runSnapshotTest(view: IconButtonGroupAmountThreeHorizontal(
            appearance: appearance, iconButtonGroupAppearance: iconButtonGroupAppearance))
    }
    
    @MainActor
    func testIconButtonGroupSGapWideSegmentedHorizontalStylesSalute() async throws {
        let appearance = IconButton.s.default.appearance
        let iconButtonGroupAppearance = IconButtonGroup.s.wide.segmented.appearance
        
        try await runSnapshotTest(view: IconButtonGroupAmountThreeHorizontal(
            appearance: appearance, iconButtonGroupAppearance: iconButtonGroupAppearance))
    }
    
    @MainActor
    func testIconButtonGroupXsGapNoneDefaultVerticalStylesSalute() async throws {
        let appearance = IconButton.xs.default.appearance
        let iconButtonGroupAppearance = IconButtonGroup.xs.noGap.default.appearance
        
        try await runSnapshotTest(view: IconButtonGroupAmountThreeVertical(
            appearance: appearance, iconButtonGroupAppearance: iconButtonGroupAppearance))
    }
    
    @MainActor
    func testIconButtonGroupLAmountTenGapNoneSegmentedHorizontalStylesSalute() async throws {
        let appearance = IconButton.l.default.appearance
        let iconButtonGroupAppearance = IconButtonGroup.l.noGap.segmented.appearance
        
        try await runSnapshotTest(view: IconButtonGroupAmountTenHorizontal(
            appearance: appearance, iconButtonGroupAppearance: iconButtonGroupAppearance), landscape: true
        )
    }
}
