//
//  BasicButtonPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 12.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class BasicButtonPlasmaHomeDSSnapshotTest: XCTestCase {
    
    @MainActor
    func testButtonMDefaultPlasmaHomeDS() async throws {
        let appearance = BasicButton.m.default.appearance
        try await runSnapshotTest(view: ButtonLDefault(appearance: appearance))
    }
    
    @MainActor
    func testButtonSWarningPlasmaHomeDS() async throws {
        let appearance = BasicButton.s.warning.appearance
        try await runSnapshotTest(view: ButtonSWarning(appearance: appearance))
    }
    
    @MainActor
    func testButtonSClearPlasmaHomeDS() async throws {
        let appearance = BasicButton.s.clear.appearance
        try await runSnapshotTest(view: ButtonXsDark(appearance: appearance))
    }
    
    @MainActor
    func testButtonIsLoadingPlasmaHomeDS() async throws {
        let appearance = BasicButton.m.default.appearance
        try await runSnapshotTest(view: ButtonLIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testButtonIsDisabledPlasmaHomeDS() async throws {
        let appearance = BasicButton.m.default.appearance
        try await runSnapshotTest(view: ButtonLIsDisabled(appearance: appearance))
    }
    
    @MainActor
    func testButtonMSecondaryPlasmaHomeDS() async throws {
        let appearance = BasicButton.m.secondary.appearance
        try await runSnapshotTest(view: ButtonLSecondary(appearance: appearance))
    }
    
    @MainActor
    func testButtonMClearSpaceBetweenPlasmaHomeDS() async throws {
        let appearance = BasicButton.m.clear.appearance
        try await runSnapshotTest(view: ButtonMClearSpaceBetween(appearance: appearance))
    }
    
    @MainActor
    func testButtonSPositiveLongTextPlasmaHomeDS() async throws {
        let appearance = BasicButton.s.default.appearance
        try await runSnapshotTest(view: ButtonSPositiveLongText(appearance: appearance))
    }
        
    @MainActor
    func testButtonSNegativePlasmaHomeDS() async throws {
        let appearance = BasicButton.s.negative.appearance
        try await runSnapshotTest(view:ButtonXxsDefault(appearance: appearance))
    }
}
