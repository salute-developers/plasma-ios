//
//  LinkButtonSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 17.04.2025.
//
@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
import XCTest
import SDDSservTheme
import UIKit
import SwiftUI

final class LinkButtonSnapshotTest: XCTestCase {
    
    @MainActor
    func testLinkButtonLDefault() async throws {
        let appearance = LinkButton.l.default.appearance
        try await runSnapshotTest(view: LinkButtonLDefault(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonLIsLoading() async throws {
        let appearance = LinkButton.l.default.appearance
        try await runSnapshotTest(view: LinkButtonLIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonLSecondary() async throws {
        let appearance = LinkButton.l.secondary.appearance
        try await runSnapshotTest(view: LinkButtonLSecondary(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonMAccent() async throws {
        let appearance = LinkButton.m.accent.appearance
        try await runSnapshotTest(view: LinkButtonMAccent(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonLIsDisabled() async throws {
        let appearance = LinkButton.l.default.appearance
        try await runSnapshotTest(view: LinkButtonLIsDisabled(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonSWarning() async throws {
        let appearance = LinkButton.s.warning.appearance
        try await runSnapshotTest(view: LinkButtonSWarning(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonXsNegative() async throws {
        let appearance = LinkButton.xs.negative.appearance
        try await runSnapshotTest(view: LinkButtonXsNegative(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonXlDefault() async throws {
        let appearance = LinkButton.xl.default.appearance
        try await runSnapshotTest(view: LinkButtonXlDefault(appearance: appearance))
    }
    
    @MainActor
    func testLinkButtonXxsDefault() async throws {
        let appearance = LinkButton.xxs.default.appearance
        try await runSnapshotTest(view: LinkButtonXxsDefault(appearance: appearance))
    }
}
