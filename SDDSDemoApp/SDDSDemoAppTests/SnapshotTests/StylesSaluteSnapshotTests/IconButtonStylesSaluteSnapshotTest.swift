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
import StylesSaluteTheme
import UIKit
import SwiftUI

final class IconButtonStylesSaluteSnapshotTest: StylesSaluteThemeTestCase {
    
    @MainActor
    func testIсonButtonLDefaultStylesSalute() async throws {
        let appearance = IconButton.l.default.appearance
        try await runSnapshotTest(view: IсonButtonLDefault(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonMAccentStylesSalute() async throws {
        let appearance = IconButton.m.accent.appearance
        try await runSnapshotTest(view: IconButtonMAccent(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonSWarningStylesSalute() async throws {
        let appearance = IconButton.s.warning.appearance
        try await runSnapshotTest(view: IconButtonSWarning(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonXsDarkStylesSalute() async throws {
        let appearance = IconButton.xs.dark.appearance
        try await runSnapshotTest(view: IconButtonXsDark(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonIsLoadingStylesSalute() async throws {
        let appearance = IconButton.l.default.appearance
        try await runSnapshotTest(view: IconButtonIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonIsDisabledStylesSalute() async throws {
        let appearance = IconButton.l.default.appearance
        try await runSnapshotTest(view: IconButtonIsDisabled(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonLSecondaryPilledStylesSalute() async throws {
        let appearance = IconButton.l.pilled.secondary.appearance
        try await runSnapshotTest(view: IconButtonLSecondaryPilled(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonMClearStylesSalute() async throws {
        let appearance = IconButton.m.clear.appearance
        try await runSnapshotTest(view: IconButtonMClear(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonSPositiveStylesSalute() async throws {
        let appearance = IconButton.s.positive.appearance
        try await runSnapshotTest(view: IconButtonSPositive(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonXsNegativePilledIsLoadingStylesSalute() async throws {
        let appearance = IconButton.xs.pilled.negative.appearance
        try await runSnapshotTest(view: IconButtonXsNegativePilledIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonLWhiteStylesSalute() async throws {
        let appearance = IconButton.l.white.appearance
        try await runSnapshotTest(view: IconButtonLWhite(appearance: appearance))
    }
}
