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
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class CheckBoxPlasmaB2CSnapshotTest: XCTestCase {
    
    @MainActor
    func testCheckBoxSizeLNegativePlasmaB2C() async throws {
        let appearance = Checkbox.l.negative.appearance
        try await runSnapshotTest(view: CheckBoxSizeLNegative(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeLNegativeUncheckedPlasmaB2C() async throws {
        let appearance = Checkbox.l.negative.appearance
        try await runSnapshotTest(view: CheckBoxSizeLNegativeUnchecked(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeMPlasmaB2C() async throws {
        let appearance = Checkbox.m.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeM(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeSPlasmaB2C() async throws {
        let appearance = Checkbox.s.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeS(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeSDisabledPlasmaB2C() async throws {
        let appearance = Checkbox.s.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeSDisabled(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeMIndeterminatePlasmaB2C() async throws {
        let appearance = Checkbox.m.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeMIndeterminate(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeMNoLabelNoDescriptionPlasmaB2C() async throws {
        let appearance = Checkbox.m.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeMNoLabelNoDescription(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxGroupSizeMPlasmaB2C() async throws {
        let appearance = Checkbox.m.default.appearance
        let checkBoxGroupAppearance = CheckboxGroup.m.appearance
        try await runSnapshotTest(view: CheckBoxGroupSizeM(appearance: appearance, checkBoxGroupAppearance: checkBoxGroupAppearance))
    }
    
    @MainActor
    func testCheckBoxGroupSizeSPlasmaB2C() async throws {
        let appearance = Checkbox.s.default.appearance
        let checkBoxGroupAppearance = CheckboxGroup.s.appearance
        try await runSnapshotTest(view: CheckBoxGroupSizeS(appearance: appearance, checkBoxGroupAppearance: checkBoxGroupAppearance))
    }
    
    @MainActor
    func testCheckBoxGroupSizeMDisabledPlasmaB2C() async throws {
        let appearance = Checkbox.m.default.appearance
        let checkBoxGroupAppearance = CheckboxGroup.m.appearance
        try await runSnapshotTest(view: CheckBoxGroupSizeMDisabled(appearance: appearance, checkBoxGroupAppearance: checkBoxGroupAppearance))
    }
}
