//
//  LinkButtonPlasmaB2CSnapshotTest.swift
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

final class LinkButtonPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testLinkButtonLDefaultPlasmaB2C() async throws {
        let appearance = LinkButton.l.default.appearance
        try await runSnapshotTest(view: LinkButtonLDefault(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonLIsLoadingPlasmaB2C() async throws {
        let appearance = LinkButton.l.default.appearance
        try await runSnapshotTest(view: LinkButtonLIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonLSecondaryPlasmaB2C() async throws {
        let appearance = LinkButton.l.secondary.appearance
        try await runSnapshotTest(view: LinkButtonLSecondary(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonMAccentPlasmaB2C() async throws {
        let appearance = LinkButton.m.accent.appearance
        try await runSnapshotTest(view: LinkButtonMAccent(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonLIsDisabledPlasmaB2C() async throws {
        let appearance = LinkButton.l.default.appearance
        try await runSnapshotTest(view: LinkButtonLIsDisabled(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonSWarningPlasmaB2C() async throws {
        let appearance = LinkButton.s.warning.appearance
        try await runSnapshotTest(view: LinkButtonSWarning(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonXsNegativePlasmaB2C() async throws {
        let appearance = LinkButton.xs.negative.appearance
        try await runSnapshotTest(view: LinkButtonXsNegative(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonXlDefaultPlasmaB2C() async throws {
        let appearance = LinkButton.xl.default.appearance
        try await runSnapshotTest(view: LinkButtonXlDefault(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonXxsDefaultPlasmaB2C() async throws {
        let appearance = LinkButton.xxs.default.appearance
        try await runSnapshotTest(view: LinkButtonXxsDefault(appearance: appearance))
    }
}
