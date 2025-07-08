//
//  TextFieldStylesSaluteSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 08.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class TextFieldStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testTextFieldSizeLDefaultRequiredStartInnerLabelStylesSalute() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLDefaultRequiredStartInnerLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMSuccessOuterOptionalStylesSalute() async throws {
        let appearance = TextField.m.outerLabel.success.appearance
        try await runSnapshotTest(view: TextFieldSizeMSuccessOuterOptional(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeSWarningRequiredEndInnerLabelStylesSalute() async throws {
        let appearance = TextField.s.innerLabel.requiredEnd.warning.appearance
        try await runSnapshotTest(view: TextFieldSizeSWarningRequiredEndInnerLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeXsErrorInnerOptionalStylesSalute() async throws {
        let appearance = TextField.xs.error.appearance
        try await runSnapshotTest(view: TextFieldSizeXsErrorInnerOptional(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLSuccessRequiredStartOuterLabelStylesSalute() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.success.appearance
        try await runSnapshotTest(view: TextFieldSizeLSuccessRequiredStartOuterLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMWarningInnerOptionalStylesSalute() async throws {
        let appearance = TextField.m.innerLabel.warning.appearance
        try await runSnapshotTest(view: TextFieldSizeMWarningInnerOptional(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldReadOnlyStylesSalute() async throws {
        let appearance = TextField.s.innerLabel.requiredEnd.default.appearance
        try await runSnapshotTest(view: TextFieldReadOnly(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeXsSuccessOptionalOuterLabelStylesSalute() async throws {
        let appearance = TextField.xs.outerLabel.success.appearance
        try await runSnapshotTest(view: TextFieldSizeXsSuccessOptionalOuterLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldDisabledStylesSalute() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldDisabled(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMErrorOptionalOuterLabelStylesSalute() async throws {
        let appearance = TextField.m.outerLabel.error.appearance
        try await runSnapshotTest(view: TextFieldSizeMErrorOptionalOuterLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeSWarningRequiredEndInnerLabelFocusedStylesSalute() async throws {
        let appearance = TextField.s.innerLabel.requiredEnd.warning.appearance
        try await runSnapshotTest(view: TextFieldSizeSWarningRequiredEndInnerLabelFocused(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMSuccessChipsOptionalInnerLabelStylesSalute() async throws {
        let appearance = TextField.m.innerLabel.success.appearance
        let chipAppearance = Chip.s.default.appearance
        try await runSnapshotTest(view: TextFieldSizeMSuccessChipsOptionalInnerLabel(
            appearance: appearance, chipAppearance: chipAppearance)
        )
    }
    
    @MainActor
    func testTextFieldSizeSDefaultChipsRequiredEndOuterLabelStylesSalute() async throws {
        let appearance = TextField.s.outerLabel.requiredEnd.default.appearance
        let chipAppearance = Chip.s.default.appearance
        try await runSnapshotTest(view: TextFieldSizeSDefaultChipsRequiredEndOuterLabel(
            appearance: appearance, chipAppearance: chipAppearance)
        )
    }
    
    @MainActor
    func testTextFieldInputTextStylesSalute() async throws {
        let appearance = TextField.l.innerLabel.warning.appearance
        try await runSnapshotTest(view: TextFieldInputText(appearance: appearance))
    }
        
    @MainActor
    func testTextFieldSizeLTBTAStylesSalute() async throws {
        let appearance = TextField.l.outerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLTBTA(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLRequiredStartOuterLabelDisabledStylesSalute() async throws {
        let appearance = TextField.l.outerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLRequiredStartOuterLabelDisabled(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLTBTAEmptyValueStylesSalute() async throws {
        let appearance = TextField.l.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLTBTAEmptyValue(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLTBTACyrillicStylesSalute() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLTBTACyrillic(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeLErrorOptionalInnerLabelStylesSalute() async throws {
        let appearance = TextFieldClear.l.innerLabel.error.appearance
        try await runSnapshotTest(view: TextFieldClearSizeLErrorOptionalInnerLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeMWarningInnerLabelRequiredStartStylesSalute() async throws {
        let appearance = TextFieldClear.m.innerLabel.requiredStart.warning.appearance
        try await runSnapshotTest(view: TextFieldClearSizeMWarningInnerLabelRequiredStart(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeSDefaultOptionalOuterStylesSalute() async throws {
        let appearance = TextFieldClear.s.outerLabel.default.appearance
        try await runSnapshotTest(view: TextFieldClearSizeSDefaultOptionalOuter(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeXsSuccessOuterLabelRequireEndStylesSalute() async throws {
        let appearance = TextFieldClear.xs.outerLabel.requiredEnd.success.appearance
        try await runSnapshotTest(view: TextFieldClearSizeXsSuccessOuterLabelRequireEnd(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeLInnerLabelRequiredEndStylesSalute() async throws {
        let appearance = TextFieldClear.l.innerLabel.requiredEnd.default.appearance
        try await runSnapshotTest(view: TextFieldClearSizeLInnerLabelRequiredEnd(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeMErrorInnerRequiredStartStylesSalute() async throws {
        let appearance = TextFieldClear.l.requiredStart.error.appearance
        try await runSnapshotTest(view: TextFieldClearSizeMErrorInnerRequiredStart(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldClearSizeLErrorTBTAStylesSalute() async throws {
        let appearance = TextFieldClear.l.requiredStart.error.appearance
        try await runSnapshotTest(view: TextFieldClearSizeLErrorTBTA(appearance: appearance))
    }
}
