//
//  CheckBoxPlasmaHomeDsSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 12.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class CheckBoxPlasmaHomeDsSnapshotTest: XCTestCase {
    
    @MainActor
    func testCheckBoxSizeLNegativePlasmaHomeDS() async throws {
        let appearance = Checkbox.l.negative.appearance
        try await runSnapshotTest(view: CheckBoxSizeLNegative(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeLNegativeUncheckedPlasmaHomeDS() async throws {
        let appearance = Checkbox.l.negative.appearance
        try await runSnapshotTest(view: CheckBoxSizeLNegativeUnchecked(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeMPlasmaHomeDS() async throws {
        let appearance = Checkbox.m.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeM(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeSPlasmaHomeDS() async throws {
        let appearance = Checkbox.s.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeS(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeSDisabledPlasmaHomeDS() async throws {
        let appearance = Checkbox.s.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeSDisabled(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeMIndeterminatePlasmaHomeDS() async throws {
        let appearance = Checkbox.m.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeMIndeterminate(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeMNoLabelNoDescriptionPlasmaHomeDS() async throws {
        let appearance = Checkbox.m.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeMNoLabelNoDescription(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxGroupSizeMPlasmaHomeDS() async throws {
        let appearance = Checkbox.m.default.appearance
        let checkBoxGroupAppearance = CheckboxGroup.m.appearance
        try await runSnapshotTest(view: CheckBoxGroupSizeM(appearance: appearance, checkBoxGroupAppearance: checkBoxGroupAppearance))
    }
    
    @MainActor
    func testCheckBoxGroupSizeSPlasmaHomeDS() async throws {
        let appearance = Checkbox.s.default.appearance
        let checkBoxGroupAppearance = CheckboxGroup.s.appearance
        try await runSnapshotTest(view: CheckBoxGroupSizeS(appearance: appearance, checkBoxGroupAppearance: checkBoxGroupAppearance))
    }
    
    @MainActor
    func testCheckBoxGroupSizeMDisabledPlasmaHomeDS() async throws {
        let appearance = Checkbox.m.default.appearance
        let checkBoxGroupAppearance = CheckboxGroup.m.appearance
        try await runSnapshotTest(view: CheckBoxGroupSizeMDisabled(appearance: appearance, checkBoxGroupAppearance: checkBoxGroupAppearance))
    }
}
