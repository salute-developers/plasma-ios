//
//  MaskSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 11.12.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class MaskSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testMaskPhoneLDefaultAlwaysShow() async throws {
        let appearance = TextField.l.outerLabel.default.appearance
        try await runSnapshotTest(view: MaskPhonePlaceholder(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneMSuccessPlaceholderOptional() async throws {
        let appearance = TextField.m.outerLabel.success.appearance
        try await runSnapshotTest(view: MaskPhonePlaceholderOptional(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneSWarningPlaceholder() async throws {
        let appearance = TextField.s.outerLabel.requiredEnd.warning.appearance
        try await runSnapshotTest(view: MaskPhonePlaceholder(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneXsErrorPlaceholder() async throws {
        let appearance = TextField.xs.outerLabel.requiredStart.error.appearance
        try await runSnapshotTest(view: MaskPhonePlaceholder(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneDisabled() async throws {
        let appearance = TextField.l.outerLabel.default.appearance
        try await runSnapshotTest(view: MaskPhoneDisabled(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneReadOnly() async throws {
        let appearance = TextField.l.outerLabel.default.appearance
        try await runSnapshotTest(view: MaskPhoneReadOnly(appearance: appearance))
    }
    
    @MainActor
    func testMaskDateXlDefaultOuterLabel() async throws {
        let appearance = TextField.xl.outerLabel.default.appearance
        try await runSnapshotTest(view: MaskDate(appearance: appearance))
    }
    
    @MainActor
    func testMaskTimeLSuccessRequiredStart() async throws {
        let appearance = TextField.l.requiredStart.success.appearance
        try await runSnapshotTest(view: MaskTime(appearance: appearance))
    }
    
    @MainActor
    func testMaskNumberMWarningtOuterLabelRequiredRight() async throws {
        let appearance = TextField.m.outerLabel.requiredEnd.warning.appearance
        try await runSnapshotTest(view: MaskNumber(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneSErrorTATB() async throws {
        let appearance = TextField.s.error.appearance
        try await runSnapshotTest(view: MaskPhoneTBTA(appearance: appearance))
    }
    
    @MainActor
    func testMaskPhoneTypeLetter() async throws {
        let appearance = TextField.l.default.appearance
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: TextFieldValue.single("a")))
    }
    
    @MainActor
    func testMaskPhoneTypeDigit() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("7")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskPhoneFullTelephone() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("1234567890")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskPhoneTypeAnyNumber() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("9")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskPhoneFullFilledTelephone() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("1234567890a")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskPhoneWithSymbols() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("!w123ф%е45")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskPhonePartiallyFilled() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("123456!w123ф%е45")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskPhoneFullFilledWithExtra() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("1234567890!w123ф%е45")
        try await runSnapshotTest(view: MaskPhoneInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskDateType() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("121212")
        try await runSnapshotTest(view: MaskDateType(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskDateTypeWithoutYear() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("1212")
        try await runSnapshotTest(view: MaskDateType(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskFullDateType() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("12122012")
        try await runSnapshotTest(view: MaskFullDateType(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskTimeInput() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("1234")
        try await runSnapshotTest(view: MaskTimeInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskTimeInputStarWithZero() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("0830")
        try await runSnapshotTest(view: MaskTimeInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskTimeInputMaxTime() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("9999")
        try await runSnapshotTest(view: MaskTimeInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskTimeInputWithLetter() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("12а34")
        try await runSnapshotTest(view: MaskTimeInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskNumberInput() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("12345,00")
        try await runSnapshotTest(view: MaskNumberInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskMaxNumberInput() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("999999999999999999,99999")
        try await runSnapshotTest(view: MaskNumberInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskOneNumberInput() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("1")
        try await runSnapshotTest(view: MaskNumberInput(appearance: appearance, value: value))
    }
    
    @MainActor
    func testMaskInputWithSymbols() async throws {
        let appearance = TextField.l.default.appearance
        let value = TextFieldValue.single("!w123ф%е45")
        try await runSnapshotTest(view: MaskNumberInput(appearance: appearance, value: value))
    }
}
