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
#if PLASMA_THEME
import PlasmaB2CTheme
#elseif SALUTE_THEME
import StylesSaluteTheme
#else
import SDDSServTheme
#endif
import UIKit
import SwiftUI

final class TextFieldSnapshotTest: XCTestCase {
    
    @MainActor
    func testTextFieldSizeLDefaultRequiredStartInnerLabel() async throws {
        try await runSnapshotTest(view: TextFieldSizeLDefaultRequiredStartInnerLabel())
    }
    
    @MainActor
    func testTextFieldSizeMSuccessOuterOptional() async throws {
        try await runSnapshotTest(view: TextFieldSizeMSuccessOuterOptional())
    }
    
    @MainActor
    func testTextFieldSizeSWarningRequiredEndInnerLabel() async throws {
        try await runSnapshotTest(view: TextFieldSizeSWarningRequiredEndInnerLabel())
    }
    
    @MainActor
    func testTextFieldSizeXsErrorInnerOptional() async throws {
        try await runSnapshotTest(view: TextFieldSizeXsErrorInnerOptional())
    }
    
    @MainActor
    func testTextFieldSizeLSuccessRequiredStartOuterLabel() async throws {
        try await runSnapshotTest(view: TextFieldSizeLSuccessRequiredStartOuterLabel())
    }
    
    @MainActor
    func testTextFieldSizeMWarningInnerOptional() async throws {
        try await runSnapshotTest(view: TextFieldSizeMWarningInnerOptional())
    }
    
    @MainActor
    func testTextFieldReadOnly() async throws {
        try await runSnapshotTest(view: TextFieldReadOnly())
    }
    
    @MainActor
    func testTextFieldDisabled() async throws {
        try await runSnapshotTest(view: TextFieldDisabled())
    }
    
    @MainActor
    func testTextFieldSizeMErrorOptionalOuterLabel() async throws {
        try await runSnapshotTest(view: TextFieldSizeMErrorOptionalOuterLabel())
    }
    
    @MainActor
    func testTextFieldSizeSWarningRequiredEndInnerLabelFocused() async throws {
        try await runSnapshotTest(view: TextFieldSizeSWarningRequiredEndInnerLabelFocused())
    }
    
    @MainActor
    func testTextFieldSizeMSuccessChipsOptionalInnerLabel() async throws {
        try await runSnapshotTest(view: TextFieldSizeMSuccessChipsOptionalInnerLabel())
    }
    
    @MainActor
    func testTextFieldSizeSDefaultChipsRequiredEndOuterLabel() async throws {
        try await runSnapshotTest(view: TextFieldSizeSDefaultChipsRequiredEndOuterLabel())
    }
    
    @MainActor
    func testTextFieldInputText() async throws {
        try await runSnapshotTest(view: TextFieldInputText())
    }
    
    @MainActor
    func testTextFieldSizeXlDefaultOptionalInnerLabel() async throws {
        try await runSnapshotTest(view: TextFieldSizeXlDefaultOptionalInnerLabel())
    }
    
    @MainActor
    func testTextFieldSizeLTBTA() async throws {
        try await runSnapshotTest(view: TextFieldSizeLTBTA())
    }
    
    @MainActor
    func testTextFieldSizeLRequiredStartOuterLabelDisabled() async throws {
        try await runSnapshotTest(view: TextFieldSizeLRequiredStartOuterLabelDisabled())
    }
    
    @MainActor
    func testTextFieldSizeLTBTAEmptyValue() async throws {
        try await runSnapshotTest(view: TextFieldSizeLTBTAEmptyValue())
    }
    
    @MainActor
    func testTextFieldSizeLTBTACyrillic() async throws {
        try await runSnapshotTest(view: TextFieldSizeLTBTACyrillic())
    }
    
    @MainActor
    func testTextFieldClearSizeLErrorOptionalInnerLabel() async throws {
        try await runSnapshotTest(view: TextFieldClearSizeLErrorOptionalInnerLabel())
    }
    
    @MainActor
    func testTextFieldClearSizeMWarningInnerLabelRequiredStart() async throws {
        try await runSnapshotTest(view: TextFieldClearSizeMWarningInnerLabelRequiredStart())
    }
    
    @MainActor
    func testTextFieldClearSizeSDefaultOptionalOuter() async throws {
        try await runSnapshotTest(view: TextFieldClearSizeSDefaultOptionalOuter())
    }
    
    @MainActor
    func testTextFieldClearSizeXsSuccessOuterLabelRequireEnd() async throws {
        try await runSnapshotTest(view: TextFieldClearSizeXsSuccessOuterLabelRequireEnd())
    }
    
    @MainActor
    func testTextFieldClearSizeLInnerLabelRequiredEnd() async throws {
        try await runSnapshotTest(view: TextFieldClearSizeLInnerLabelRequiredEnd())
    }
    
    @MainActor
    func testTextFieldClearSizeMErrorInnerRequiredStart() async throws {
        try await runSnapshotTest(view: TextFieldClearSizeMErrorInnerRequiredStart())
    }
    
    @MainActor
    func testTextFieldClearSizeLErrorTBTA() async throws {
        try await runSnapshotTest(view: TextFieldClearSizeLErrorTBTA())
    }
}
