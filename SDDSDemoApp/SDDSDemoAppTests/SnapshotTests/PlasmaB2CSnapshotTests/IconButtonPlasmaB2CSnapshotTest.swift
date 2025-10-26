//
//  IconButtonPlasmaB2CSnapshotTest.swift
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

final class IconButtonPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testIсonButtonLDefaultPlasmaB2C() async throws {
        let appearance = IconButton.l.default.appearance
        try await runSnapshotTest(view: IсonButtonLDefault(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonMAccentPlasmaB2C() async throws {
        let appearance = IconButton.m.accent.appearance
        try await runSnapshotTest(view: IconButtonMAccent(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonSWarningPlasmaB2C() async throws {
        let appearance = IconButton.s.warning.appearance
        try await runSnapshotTest(view: IconButtonSWarning(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonXsDarkPlasmaB2C() async throws {
        let appearance = IconButton.xs.dark.appearance
        try await runSnapshotTest(view: IconButtonXsDark(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonIsLoadingPlasmaB2C() async throws {
        let appearance = IconButton.l.default.appearance
        try await runSnapshotTest(view: IconButtonIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonIsDisabledPlasmaB2C() async throws {
        let appearance = IconButton.l.default.appearance
        try await runSnapshotTest(view: IconButtonIsDisabled(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonLSecondaryPilledPlasmaB2C() async throws {
        let appearance = IconButton.l.pilled.secondary.appearance
        try await runSnapshotTest(view: IconButtonLSecondaryPilled(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonMClearPlasmaB2C() async throws {
        let appearance = IconButton.m.clear.appearance
        try await runSnapshotTest(view: IconButtonMClear(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonSPositivePlasmaB2C() async throws {
        let appearance = IconButton.s.positive.appearance
        try await runSnapshotTest(view: IconButtonSPositive(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonXsNegativePilledIsLoadingPlasmaB2C() async throws {
        let appearance = IconButton.xs.pilled.negative.appearance
        try await runSnapshotTest(view: IconButtonXsNegativePilledIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonLWhitePlasmaB2C() async throws {
        let appearance = IconButton.l.white.appearance
        try await runSnapshotTest(view: IconButtonLWhite(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonXlDefaultPlasmaB2C() async throws {
        let appearance = IconButton.xl.default.appearance
        try await runSnapshotTest(view: IconButtonXlDefault(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonXxsDefaultPlasmaB2C() async throws {
        let appearance = IconButton.xxs.default.appearance
        try await runSnapshotTest(view: IconButtonXxsDefault(appearance: appearance))
    }
}
