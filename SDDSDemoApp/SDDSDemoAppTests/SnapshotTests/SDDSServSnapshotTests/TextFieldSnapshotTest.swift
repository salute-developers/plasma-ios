//
//  TextFieldSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 03.06.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class TextFieldSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testTextFieldSizeLDefaultRequiredStartInnerLabel() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLDefaultRequiredStartInnerLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMSuccessOuterOptional() async throws {
        let appearance = TextField.m.outerLabel.success.appearance
        try await runSnapshotTest(view: TextFieldSizeMSuccessOuterOptional(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeSWarningRequiredEndInnerLabel() async throws {
        let appearance = TextField.s.innerLabel.requiredEnd.warning.appearance
        try await runSnapshotTest(view: TextFieldSizeSWarningRequiredEndInnerLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeXsErrorInnerOptional() async throws {
        let appearance = TextField.xs.error.appearance
        try await runSnapshotTest(view: TextFieldSizeXsErrorInnerOptional(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLSuccessRequiredStartOuterLabel() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.success.appearance
        try await runSnapshotTest(view: TextFieldSizeLSuccessRequiredStartOuterLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMWarningInnerOptional() async throws {
        let appearance = TextField.m.innerLabel.warning.appearance
        try await runSnapshotTest(view: TextFieldSizeMWarningInnerOptional(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldReadOnly() async throws {
        let appearance = TextField.s.innerLabel.requiredEnd.default.appearance
        try await runSnapshotTest(view: TextFieldReadOnly(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeXsSuccessOptionalOuterLabel() async throws {
        let appearance = TextField.xs.outerLabel.success.appearance
        try await runSnapshotTest(view: TextFieldSizeXsSuccessOptionalOuterLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldDisabled() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldDisabled(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMErrorOptionalOuterLabel() async throws {
        let appearance = TextField.m.outerLabel.error.appearance
        try await runSnapshotTest(view: TextFieldSizeMErrorOptionalOuterLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeSWarningRequiredEndInnerLabelFocused() async throws {
        let appearance = TextField.s.innerLabel.requiredEnd.warning.appearance
        try await runSnapshotTest(view: TextFieldSizeSWarningRequiredEndInnerLabelFocused(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMSuccessChipsOptionalInnerLabel() async throws {
        let appearance = TextField.m.innerLabel.success.appearance
        let chipAppearance = Chip.s.default.appearance
        try await runSnapshotTest(view: TextFieldSizeMSuccessChipsOptionalInnerLabel(appearance: appearance, chipAppearance: chipAppearance))
    }
    
    @MainActor
    func testTextFieldSizeSDefaultChipsRequiredEndOuterLabel() async throws {
        let appearance = TextField.s.outerLabel.requiredEnd.default.appearance
        let chipAppearance = Chip.s.default.appearance
        try await runSnapshotTest(view: TextFieldSizeSDefaultChipsRequiredEndOuterLabel(appearance: appearance, chipAppearance: chipAppearance))
    }
    
    @MainActor
    func testTextFieldInputText() async throws {
        let appearance = TextField.l.innerLabel.warning.appearance
        try await runSnapshotTest(view: TextFieldInputText(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeXlDefaultOptionalInnerLabel() async throws {
        let appearance = TextField.xl.innerLabel.default.appearance
        try await runSnapshotTest(view: TextFieldSizeXlDefaultOptionalInnerLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLTBTA() async throws {
        let appearance = TextField.l.outerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLTBTA(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLRequiredStartOuterLabelDisabled() async throws {
        let appearance = TextField.l.outerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLRequiredStartOuterLabelDisabled(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLTBTAEmptyValue() async throws {
        let appearance = TextField.l.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLTBTAEmptyValue(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLTBTACyrillic() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLTBTACyrillic(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeLErrorOptionalInnerLabel() async throws {
        let appearance = TextFieldClear.l.innerLabel.error.appearance
        try await runSnapshotTest(view: TextFieldClearSizeLErrorOptionalInnerLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeMWarningInnerLabelRequiredStart() async throws {
        let appearance = TextFieldClear.m.innerLabel.requiredStart.warning.appearance
        try await runSnapshotTest(view: TextFieldClearSizeMWarningInnerLabelRequiredStart(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeSDefaultOptionalOuter() async throws {
        let appearance = TextFieldClear.s.outerLabel.default.appearance
        try await runSnapshotTest(view: TextFieldClearSizeSDefaultOptionalOuter(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeXsSuccessOuterLabelRequireEnd() async throws {
        let appearance = TextFieldClear.xs.outerLabel.requiredEnd.success.appearance
        try await runSnapshotTest(view: TextFieldClearSizeXsSuccessOuterLabelRequireEnd(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeLInnerLabelRequiredEnd() async throws {
        let appearance = TextFieldClear.l.innerLabel.requiredEnd.default.appearance
        try await runSnapshotTest(view: TextFieldClearSizeLInnerLabelRequiredEnd(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeMErrorInnerRequiredStart() async throws {
        let appearance = TextFieldClear.l.requiredStart.error.appearance
        try await runSnapshotTest(view: TextFieldClearSizeMErrorInnerRequiredStart(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeLErrorTBTA() async throws {
        let appearance = TextFieldClear.l.requiredStart.error.appearance
        try await runSnapshotTest(view: TextFieldClearSizeLErrorTBTA(appearance: appearance))
    }
}
