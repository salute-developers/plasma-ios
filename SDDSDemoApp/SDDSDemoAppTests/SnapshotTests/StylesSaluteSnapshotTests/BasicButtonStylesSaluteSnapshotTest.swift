//
//  BasicButtonPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 07.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class BasicButtonStylesSalutenapshotTest: XCTestCase {
    
    @MainActor
    func testButtonLDefaultStylesSalute() async throws {
        let appearance = BasicButton.l.default.appearance
        try await runSnapshotTest(view: ButtonLDefault(appearance: appearance))
    }
    
    @MainActor
    func testButtonMAccentStylesSalute() async throws {
        let appearance = BasicButton.m.accent.appearance
        try await runSnapshotTest(view: ButtonMAccent(appearance: appearance))
    }
    
    @MainActor
    func testButtonSWarningStylesSalute() async throws {
        let appearance = BasicButton.s.warning.appearance
        try await runSnapshotTest(view: ButtonSWarning(appearance: appearance))
    }
    
    @MainActor
    func testButtonXsDarkStylesSalute() async throws {
        let appearance = BasicButton.xs.dark.appearance
        try await runSnapshotTest(view: ButtonXsDark(appearance: appearance))
    }
    
    @MainActor
    func testButtonIsLoadingStylesSalute() async throws {
        let appearance = BasicButton.l.default.appearance
        try await runSnapshotTest(view: ButtonLIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testButtonIsDisabledStylesSalute() async throws {
        let appearance = BasicButton.l.default.appearance
        try await runSnapshotTest(view: ButtonLIsDisabled(appearance: appearance))
    }
    
    @MainActor
    func testButtonLSecondaryStylesSalute() async throws {
        let appearance = BasicButton.l.secondary.appearance
        try await runSnapshotTest(view: ButtonLSecondary(appearance: appearance))
    }
    
    @MainActor
    func testButtonMClearSpaceBetweenStylesSalute() async throws {
        let appearance = BasicButton.m.clear.appearance
        try await runSnapshotTest(view: ButtonMClearSpaceBetween(appearance: appearance))
    }
    
    @MainActor
    func testButtonSPositiveLongTextStylesSalute() async throws {
        let appearance = BasicButton.s.positive.appearance
        try await runSnapshotTest(view: ButtonSPositiveLongText(appearance: appearance))
    }
}
