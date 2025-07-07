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
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class BasicButtonPlasmaB2CSnapshotTest: XCTestCase {
    
    @MainActor
    func testButtonLDefaultPlasmaB2C() async throws {
        let appearance = BasicButton.l.default.appearance
        try await runSnapshotTest(view: ButtonLDefault(appearance: appearance))
    }
    
    @MainActor
    func testButtonMAccentPlasmaB2C() async throws {
        let appearance = BasicButton.m.accent.appearance
        try await runSnapshotTest(view: ButtonMAccent(appearance: appearance))
    }
    
    @MainActor
    func testButtonSWarningPlasmaB2C() async throws {
        let appearance = BasicButton.s.warning.appearance
        try await runSnapshotTest(view: ButtonSWarning(appearance: appearance))
    }
    
    @MainActor
    func testButtonXsDarkPlasmaB2C() async throws {
        let appearance = BasicButton.xs.dark.appearance
        try await runSnapshotTest(view: ButtonXsDark(appearance: appearance))
    }
    
    @MainActor
    func testButtonIsLoadingPlasmaB2C() async throws {
        let appearance = BasicButton.l.default.appearance
        try await runSnapshotTest(view: ButtonLIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testButtonIsDisabledPlasmaB2C() async throws {
        let appearance = BasicButton.l.default.appearance
        try await runSnapshotTest(view: ButtonLIsDisabled(appearance: appearance))
    }
    
    @MainActor
    func testButtonLSecondaryPlasmaB2C() async throws {
        let appearance = BasicButton.l.secondary.appearance
        try await runSnapshotTest(view: ButtonLSecondary(appearance: appearance))
    }
    
    @MainActor
    func testButtonMClearSpaceBetweenPlasmaB2C() async throws {
        let appearance = BasicButton.m.clear.appearance
        try await runSnapshotTest(view: ButtonMClearSpaceBetween(appearance: appearance))
    }
    
    @MainActor
    func testButtonSPositiveLongTextPlasmaB2C() async throws {
        let appearance = BasicButton.s.positive.appearance
        try await runSnapshotTest(view: ButtonSPositiveLongText(appearance: appearance))
    }
    
    @MainActor
    func testButtonXlDefaultPlasmaB2C() async throws {
        let appearance = BasicButton.xl.default.appearance
        try await runSnapshotTest(view: ButtonXlDefault(appearance: appearance))
    }
    
    @MainActor
    func testButtonXxsDefaultPlasmaB2C() async throws {
        let appearance = BasicButton.xxs.default.appearance
        try await runSnapshotTest(view:ButtonXxsDefault(appearance: appearance))
    }
}
