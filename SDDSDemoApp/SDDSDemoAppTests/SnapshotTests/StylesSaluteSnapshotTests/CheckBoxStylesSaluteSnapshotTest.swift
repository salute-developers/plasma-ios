//
//  CheckBoxPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 07.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class CheckBoxStylesSalutenapshotTest: XCTestCase {
    
    @MainActor
    func testCheckBoxSizeMStylesSalute() async throws {
        let appearance = Checkbox.m.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeM(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeSStylesSalute() async throws {
        let appearance = Checkbox.s.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeS(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeSDisabledStylesSalute() async throws {
        let appearance = Checkbox.s.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeSDisabled(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeMIndeterminateStylesSalute() async throws {
        let appearance = Checkbox.m.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeMIndeterminate(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeMNoLabelNoDescriptionStylesSalute() async throws {
        let appearance = Checkbox.m.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeMNoLabelNoDescription(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxGroupSizeMStylesSalute() async throws {
        let appearance = Checkbox.m.default.appearance
        let checkBoxGroupAppearance = CheckboxGroup.m.appearance
        try await runSnapshotTest(view: CheckBoxGroupSizeM(appearance: appearance, checkBoxGroupAppearance: checkBoxGroupAppearance))
    }
    
    @MainActor
    func testCheckBoxGroupSizeSStylesSalute() async throws {
        let appearance = Checkbox.s.default.appearance
        let checkBoxGroupAppearance = CheckboxGroup.s.appearance
        try await runSnapshotTest(view: CheckBoxGroupSizeS(appearance: appearance, checkBoxGroupAppearance: checkBoxGroupAppearance))
    }
    
    @MainActor
    func testCheckBoxGroupSizeMDisabledStylesSalute() async throws {
        let appearance = Checkbox.m.default.appearance
        let checkBoxGroupAppearance = CheckboxGroup.m.appearance
        try await runSnapshotTest(view: CheckBoxGroupSizeMDisabled(appearance: appearance, checkBoxGroupAppearance: checkBoxGroupAppearance))
    }
}
