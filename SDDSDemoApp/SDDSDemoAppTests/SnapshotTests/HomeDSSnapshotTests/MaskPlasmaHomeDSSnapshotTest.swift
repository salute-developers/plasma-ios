//
//  MaskPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 13.03.2026.
//
@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class MaskPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testMaskPhoneLDefaultAlwaysShowHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        try await runSnapshotTest(view: MaskPhonePlaceholder(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneMDefaultPlaceholderOptionalHomeDS() async throws {
        let appearance = TextField.m.default.appearance
        try await runSnapshotTest(view: MaskPhonePlaceholderOptional(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneSRequiredEndErrorPlaceholderHomeDS() async throws {
        let appearance = TextField.s.requiredEnd.error.appearance
        try await runSnapshotTest(view: MaskPhonePlaceholder(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneSRequiredStartErrorPlaceholderHomeDS() async throws {
        let appearance = TextField.s.requiredStart.error.appearance
        try await runSnapshotTest(view: MaskPhonePlaceholder(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneDisabledHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        try await runSnapshotTest(view: MaskPhoneDisabled(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneReadOnlyHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        try await runSnapshotTest(view: MaskPhoneReadOnly(appearance: appearance))
    }
    
    @MainActor
    func testMaskDateLDefaultHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        try await runSnapshotTest(view: MaskDate(appearance: appearance))
    }
    
    @MainActor
    func testMaskTimeLDefaultRequiredStartHomeDS() async throws {
        let appearance = TextField.l.requiredStart.default.appearance
        try await runSnapshotTest(view: MaskTime(appearance: appearance))
    }
    
    @MainActor
    func testMaskNumberMeErrorRequiredRightHomeDS() async throws {
        let appearance = TextField.m.requiredEnd.error.appearance
        try await runSnapshotTest(view: MaskNumber(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneSErrorTATBHomeDS() async throws {
        let appearance = TextField.s.error.appearance
        try await runSnapshotTest(view: MaskPhoneTBTA(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneTypeLetterHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: TextFieldValue.single("a")))
    }
    
    @MainActor
    func testMaskPhoneTypeDigitHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("7")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskPhoneFullTelephoneHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("1234567890")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskPhoneTypeAnyNumberHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("9")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskPhoneFullFilledTelephoneHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("1234567890a")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskPhoneWithSymbolsHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("!w123ф%е45")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskPhonePartiallyFilledHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("123456!w123ф%е45")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskPhoneFullFilledWithExtraHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("1234567890!w123ф%е45")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskDateTypeHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("121212")
        try await runSnapshotTest(view: MaskDateType(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskDateTypeWithoutYearHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("1212")
        try await runSnapshotTest(view: MaskDateType(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskFullDateTypeHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("12122012")
        try await runSnapshotTest(view: MaskFullDateType(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskTimeInputHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("1234")
        try await runSnapshotTest(view: MaskTimeInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskTimeInputStarWithZeroHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("0830")
        try await runSnapshotTest(view: MaskTimeInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskTimeInputMaxTimeHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("9999")
        try await runSnapshotTest(view: MaskTimeInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskTimeInputWithLetterHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("12а34")
        try await runSnapshotTest(view: MaskTimeInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskNumberInputHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("12345,00")
        try await runSnapshotTest(view: MaskNumberInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskMaxNumberInputHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("999999999999999999,99999")
        try await runSnapshotTest(view: MaskNumberInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskOneNumberInputHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("1")
        try await runSnapshotTest(view: MaskNumberInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskInputWithSymbolsHomeDS() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("!w123ф%е45")
        try await runSnapshotTest(view: MaskNumberInput(appearance: appearance, value: value))
    }
}
