//
//  TextFieldPlasmaB2CSnapshotTest.swift
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

final class TextFieldPlasmaB2CSnapshotTest: XCTestCase {
    
    @MainActor
    func testTextFieldSizeLDefaultRequiredStartInnerLabelPlasmaB2C() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLDefaultRequiredStartInnerLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMSuccessOuterOptionalPlasmaB2C() async throws {
        let appearance = TextField.m.outerLabel.success.appearance
        try await runSnapshotTest(view: TextFieldSizeMSuccessOuterOptional(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeSWarningRequiredEndInnerLabelPlasmaB2C() async throws {
        let appearance = TextField.s.innerLabel.requiredEnd.warning.appearance
        try await runSnapshotTest(view: TextFieldSizeSWarningRequiredEndInnerLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeXsErrorInnerOptionalPlasmaB2C() async throws {
        let appearance = TextField.xs.error.appearance
        try await runSnapshotTest(view: TextFieldSizeXsErrorInnerOptional(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLSuccessRequiredStartOuterLabelPlasmaB2C() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.success.appearance
        try await runSnapshotTest(view: TextFieldSizeLSuccessRequiredStartOuterLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMWarningInnerOptionalPlasmaB2C() async throws {
        let appearance = TextField.m.innerLabel.warning.appearance
        try await runSnapshotTest(view: TextFieldSizeMWarningInnerOptional(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldReadOnlyPlasmaB2C() async throws {
        let appearance = TextField.s.innerLabel.requiredEnd.default.appearance
        try await runSnapshotTest(view: TextFieldReadOnly(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeXsSuccessOptionalOuterLabelPlasmaB2C() async throws {
        let appearance = TextField.xs.outerLabel.success.appearance
        try await runSnapshotTest(view: TextFieldSizeXsSuccessOptionalOuterLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldDisabledPlasmaB2C() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldDisabled(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMErrorOptionalOuterLabelPlasmaB2C() async throws {
        let appearance = TextField.m.outerLabel.error.appearance
        try await runSnapshotTest(view: TextFieldSizeMErrorOptionalOuterLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeSWarningRequiredEndInnerLabelFocusedPlasmaB2C() async throws {
        let appearance = TextField.s.innerLabel.requiredEnd.warning.appearance
        try await runSnapshotTest(view: TextFieldSizeSWarningRequiredEndInnerLabelFocused(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMSuccessChipsOptionalInnerLabelPlasmaB2C() async throws {
        let appearance = TextField.m.innerLabel.success.appearance
        let chipAppearance = Chip.s.default.appearance
        try await runSnapshotTest(view: TextFieldSizeMSuccessChipsOptionalInnerLabel(
            appearance: appearance, chipAppearance: chipAppearance)
        )
    }
    
    @MainActor
    func testTextFieldSizeSDefaultChipsRequiredEndOuterLabelPlasmaB2C() async throws {
        let appearance = TextField.s.outerLabel.requiredEnd.default.appearance
        let chipAppearance = Chip.s.default.appearance
        try await runSnapshotTest(view: TextFieldSizeSDefaultChipsRequiredEndOuterLabel(
            appearance: appearance, chipAppearance: chipAppearance)
        )
    }
    
    @MainActor
    func testTextFieldInputTextPlasmaB2C() async throws {
        let appearance = TextField.l.innerLabel.warning.appearance
        try await runSnapshotTest(view: TextFieldInputText(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeXlDefaultOptionalInnerLabelPlasmaB2C() async throws {
        let appearance = TextField.xl.innerLabel.default.appearance
        try await runSnapshotTest(view: TextFieldSizeXlDefaultOptionalInnerLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLTBTAPlasmaB2C() async throws {
        let appearance = TextField.l.outerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLTBTA(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLRequiredStartOuterLabelDisabledPlasmaB2C() async throws {
        let appearance = TextField.l.outerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLRequiredStartOuterLabelDisabled(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLTBTAEmptyValuePlasmaB2C() async throws {
        let appearance = TextField.l.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLTBTAEmptyValue(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLTBTACyrillicPlasmaB2C() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLTBTACyrillic(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeLErrorOptionalInnerLabelPlasmaB2C() async throws {
        let appearance = TextFieldClear.l.innerLabel.error.appearance
        try await runSnapshotTest(view: TextFieldClearSizeLErrorOptionalInnerLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeMWarningInnerLabelRequiredStartPlasmaB2C() async throws {
        let appearance = TextFieldClear.m.innerLabel.requiredStart.warning.appearance
        try await runSnapshotTest(view: TextFieldClearSizeMWarningInnerLabelRequiredStart(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeSDefaultOptionalOuterPlasmaB2C() async throws {
        let appearance = TextFieldClear.s.outerLabel.default.appearance
        try await runSnapshotTest(view: TextFieldClearSizeSDefaultOptionalOuter(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeXsSuccessOuterLabelRequireEndPlasmaB2C() async throws {
        let appearance = TextFieldClear.xs.outerLabel.requiredEnd.success.appearance
        try await runSnapshotTest(view: TextFieldClearSizeXsSuccessOuterLabelRequireEnd(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeLInnerLabelRequiredEndPlasmaB2C() async throws {
        let appearance = TextFieldClear.l.innerLabel.requiredEnd.default.appearance
        try await runSnapshotTest(view: TextFieldClearSizeLInnerLabelRequiredEnd(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeMErrorInnerRequiredStartPlasmaB2C() async throws {
        let appearance = TextFieldClear.l.requiredStart.error.appearance
        try await runSnapshotTest(view: TextFieldClearSizeMErrorInnerRequiredStart(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeLErrorTBTAPlasmaB2C() async throws {
        let appearance = TextFieldClear.l.requiredStart.error.appearance
        try await runSnapshotTest(view: TextFieldClearSizeLErrorTBTA(appearance: appearance))
    }
}
