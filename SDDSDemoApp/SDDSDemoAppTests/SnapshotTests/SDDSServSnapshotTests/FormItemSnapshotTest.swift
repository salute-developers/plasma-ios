//
//  FormItemSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 21.05.2026.
//
@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

@MainActor
final class FormItemSnapshotTest: SDDSServThemeTestCase {
    
    func testFormItemLDefault() async throws {
        let appearance = FormItem.l.default.appearance
        try await runSnapshotTest(view: FormItemLDefault(appearance: appearance))
    }
    
    func testFormItemMRequredStartPositive() async throws {
        let appearance = FormItem.m.requiredStart.positive.appearance
        try await runSnapshotTest(view: FormItemMRequredStartPositive(appearance: appearance))
    }
    
    func testFormItemSRequiredEndNegative() async throws {
        let appearance = FormItem.s.requiredEnd.negative.appearance
        try await runSnapshotTest(view: FormItemSRequiredEndNegative(appearance: appearance))
    }
    
    func testFormItemXsTitleTopWarning() async throws {
        let appearance = FormItem.xs.titleTop.warning.appearance
        try await runSnapshotTest(view: FormItemXsTitleTopWarning(appearance: appearance))
    }
    
    func testFormItemLTitleTopRequiredStartDefault() async throws {
        let appearance = FormItem.l.titleTop.requiredStart.default.appearance
        try await runSnapshotTest(view: FormItemLTitleTopRequiredStartDefault(appearance: appearance))
    }
    
    func testFormItemLTitleTopRequiredEndPositive() async throws {
        let appearance = FormItem.l.titleTop.requiredEnd.positive.appearance
        try await runSnapshotTest(view: FormItemLTitleTopRequiredEndPositive(appearance: appearance))
    }
    
    func testFormItemLTitleStartNegative() async throws {
        let appearance = FormItem.l.titleStart.negative.appearance
        try await runSnapshotTest(view: FormItemLTitleStartNegative(appearance: appearance))
    }
    
    func testFormItemLTitleStartRequiredStartWarning() async throws {
        let appearance = FormItem.l.titleStart.requiredStart.warning.appearance
        try await runSnapshotTest(view: FormItemLTitleStartRequiredStartWarning(appearance: appearance))
    }
    
    func testFormItemLTitleStartRequiredEndDefault() async throws {
        let appearance = FormItem.l.titleStart.requiredEnd.default.appearance
        try await runSnapshotTest(view: FormItemLTitleStartRequiredEndDefault(appearance: appearance))
    }
    
    func testFormItemDisabled() async throws {
        let appearance = FormItem.xs.titleStart.requiredStart.positive.appearance
        try await runSnapshotTest(view: FormItemDisabledXsTitleStartRequiredStartPositive(appearance: appearance))
    }
}
