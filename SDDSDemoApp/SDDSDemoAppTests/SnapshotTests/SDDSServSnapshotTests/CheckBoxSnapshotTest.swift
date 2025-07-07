//
//  CheckBoxSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class CheckBoxSnapshotTest: XCTestCase {
    
    @MainActor
    func testCheckBoxSizeLNegative() async throws {
        let appearance = Checkbox.l.negative.appearance
        try await runSnapshotTest(view: CheckBoxSizeLNegative(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeLNegativeUnchecked() async throws {
        let appearance = Checkbox.l.negative.appearance
        try await runSnapshotTest(view: CheckBoxSizeLNegativeUnchecked(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeM() async throws {
        let appearance = Checkbox.m.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeM(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeS() async throws {
        let appearance = Checkbox.s.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeS(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeSDisabled() async throws {
        let appearance = Checkbox.s.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeSDisabled(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeMIndeterminate() async throws {
        let appearance = Checkbox.m.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeMIndeterminate(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxSizeMNoLabelNoDescription() async throws {
        let appearance = Checkbox.m.default.appearance
        try await runSnapshotTest(view: CheckBoxSizeMNoLabelNoDescription(appearance: appearance))
    }
    
    @MainActor
    func testCheckBoxGroupSizeM() async throws {
        let appearance = Checkbox.m.default.appearance
        let checkBoxGroupAppearance = CheckboxGroup.m.appearance
        try await runSnapshotTest(view: CheckBoxGroupSizeM(appearance: appearance, checkBoxGroupAppearance: checkBoxGroupAppearance))
    }
    
    @MainActor
    func testCheckBoxGroupSizeS() async throws {
        let appearance = Checkbox.s.default.appearance
        let checkBoxGroupAppearance = CheckboxGroup.s.appearance
        try await runSnapshotTest(view: CheckBoxGroupSizeS(appearance: appearance, checkBoxGroupAppearance: checkBoxGroupAppearance))
    }
    
    @MainActor
    func testCheckBoxGroupSizeMDisabled() async throws {
        let appearance = Checkbox.m.default.appearance
        let checkBoxGroupAppearance = CheckboxGroup.m.appearance
        try await runSnapshotTest(view: CheckBoxGroupSizeMDisabled(appearance: appearance, checkBoxGroupAppearance: checkBoxGroupAppearance))
    }
}
