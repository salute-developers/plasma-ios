//
//  FomrItemPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 22.05.2026.
//
@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

@MainActor
final class FormItemPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    func testFormItemDefaultPlasmaHomeDS() async throws {
        let appearance = FormItem.default.appearance
        try await runSnapshotTest(view: FormItemLDefault(appearance: appearance))
    }
    
    func testFormItemPositivePlasmaHomeDS() async throws {
        let appearance = FormItem.default.positive.appearance
        try await runSnapshotTest(view: FormItemMRequredStartPositive(appearance: appearance))
    }
    
    func testFormItemNegativePlasmaHomeDS() async throws {
        let appearance = FormItem.default.negative.appearance
        try await runSnapshotTest(view: FormItemSRequiredEndNegative(appearance: appearance))
    }
    
    func testFormItemWarningPlasmaHomeDS() async throws {
        let appearance = FormItem.default.warning.appearance
        try await runSnapshotTest(view: FormItemXsTitleTopWarning(appearance: appearance))
    }
    
    func testFormItemNoCaptionIconLongTitlePlasmaHomeDS() async throws {
        let appearance = FormItem.default.appearance
        try await runSnapshotTest(view: FormItemLTitleTopRequiredStartDefault(appearance: appearance))
    }
    
    func testFormItemLongTitleCaptionPlasmaHomeDS() async throws {
        let appearance = FormItem.default.positive.appearance
        try await runSnapshotTest(view: FormItemLTitleTopRequiredEndPositive(appearance: appearance))
    }
    
    func testFormItemLongContentPlasmaHomeDS() async throws {
        let appearance = FormItem.default.negative.appearance
        try await runSnapshotTest(view: FormItemLTitleStartNegative(appearance: appearance))
    }
    
    func testFormItemNoHintNoTitleCaptionPlasmaHomeDS() async throws {
        let appearance = FormItem.default.warning.appearance
        try await runSnapshotTest(view: FormItemLTitleStartRequiredStartWarning(appearance: appearance))
    }
    
    func testFormItemDefaultNoHintNoTitleCaptionPlasmaHomeDS() async throws {
        let appearance = FormItem.default.appearance
        try await runSnapshotTest(view: FormItemLTitleStartRequiredEndDefault(appearance: appearance))
    }
    
    func testFormItemDisabledPlasmaHomeDS() async throws {
        let appearance = FormItem.default.positive.appearance
        try await runSnapshotTest(view: FormItemDisabledXsTitleStartRequiredStartPositive(appearance: appearance))
    }
}
