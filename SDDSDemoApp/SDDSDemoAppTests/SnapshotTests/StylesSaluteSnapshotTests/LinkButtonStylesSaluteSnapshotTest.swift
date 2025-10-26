//
//  LinkButtonStylesSaluteSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 08.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class LinkButtonStylesSaluteSnapshotTest: StylesSaluteThemeTestCase {
    
    @MainActor
    func testLinkButtonLDefaultStylesSalute() async throws {
        let appearance = LinkButton.l.default.appearance
        try await runSnapshotTest(view: LinkButtonLDefault(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonLIsLoadingStylesSalute() async throws {
        let appearance = LinkButton.l.default.appearance
        try await runSnapshotTest(view: LinkButtonLIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonLSecondaryStylesSalute() async throws {
        let appearance = LinkButton.l.secondary.appearance
        try await runSnapshotTest(view: LinkButtonLSecondary(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonMAccentStylesSalute() async throws {
        let appearance = LinkButton.m.accent.appearance
        try await runSnapshotTest(view: LinkButtonMAccent(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonLIsDisabledStylesSalute() async throws {
        let appearance = LinkButton.l.default.appearance
        try await runSnapshotTest(view: LinkButtonLIsDisabled(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonSWarningStylesSalute() async throws {
        let appearance = LinkButton.s.warning.appearance
        try await runSnapshotTest(view: LinkButtonSWarning(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonXsNegativeStylesSalute() async throws {
        let appearance = LinkButton.xs.negative.appearance
        try await runSnapshotTest(view: LinkButtonXsNegative(appearance: appearance))
    }
}
