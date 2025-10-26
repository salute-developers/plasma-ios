//
//  TextFieldPlasmaHomeDSSnapshotTest.swift
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

final class TextFieldPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testTextFieldSizeLDefaultRequiredStartInnerLabelHomeDS() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLDefaultRequiredStartInnerLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMDefaultHomeDS() async throws {
        let appearance = TextField.m.default.appearance
        try await runSnapshotTest(view: TextFieldSizeMSuccessOuterOptional(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeSDefaultRequiredEndInnerLabelHomeDS() async throws {
        let appearance = TextField.s.innerLabel.requiredEnd.default.appearance
        try await runSnapshotTest(view: TextFieldSizeSWarningRequiredEndInnerLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeSErrorInnerOptionalHomeDS() async throws {
        let appearance = TextField.s.error.appearance
        try await runSnapshotTest(view: TextFieldSizeXsErrorInnerOptional(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLDefaultRequiredStartHomeDS() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLSuccessRequiredStartOuterLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMDefaultInnerOptionalHomeDS() async throws {
        let appearance = TextField.m.innerLabel.default.appearance
        try await runSnapshotTest(view: TextFieldSizeMWarningInnerOptional(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldReadOnlyHomeDS() async throws {
        let appearance = TextField.s.innerLabel.requiredEnd.default.appearance
        try await runSnapshotTest(view: TextFieldReadOnly(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeSDefaultHomeDS() async throws {
        let appearance = TextField.s.default.appearance
        try await runSnapshotTest(view: TextFieldSizeXsSuccessOptionalOuterLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldDisabledHomeDS() async throws {
        let appearance = TextField.l.innerLabel.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldDisabled(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeMErrorHomeDS() async throws {
        let appearance = TextField.m.error.appearance
        try await runSnapshotTest(view: TextFieldSizeMErrorOptionalOuterLabel(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeSDefaultRequiredEndInnerLabelFocusedHomeDS() async throws {
        let appearance = TextField.s.innerLabel.requiredEnd.default.appearance
        try await runSnapshotTest(view: TextFieldSizeSWarningRequiredEndInnerLabelFocused(appearance: appearance))
    }
        
    @MainActor
    func testTextFieldInputTextHomeDS() async throws {
        let appearance = TextField.l.innerLabel.default.appearance
        try await runSnapshotTest(view: TextFieldInputText(appearance: appearance))
    }
    
    @MainActor
    func testTextFieldSizeLTBTAHomeDS() async throws {
        let appearance = TextField.l.requiredStart.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLTBTA(appearance: appearance))
    }

    @MainActor
    func testTextFieldSizeLTBTAEmptyValueHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        try await runSnapshotTest(view: TextFieldSizeLTBTAEmptyValue(appearance: appearance))
    }
}
