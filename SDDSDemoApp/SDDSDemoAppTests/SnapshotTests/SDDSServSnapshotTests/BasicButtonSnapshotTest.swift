//
//  BasicButtonSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 15.04.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI


final class BasicButtonSnapshotTest: XCTestCase {
    
    @MainActor
    func testButtonLDefault() async throws {
        let appearance = BasicButton.l.default.appearance
        try await runSnapshotTest(view: ButtonLDefault(appearance: appearance))
    }
    
    @MainActor
    func testButtonMAccent() async throws {
        let appearance = BasicButton.m.accent.appearance
        try await runSnapshotTest(view: ButtonMAccent(appearance: appearance))
    }
    
    @MainActor
    func testButtonSWarning() async throws {
        let appearance = BasicButton.s.warning.appearance
        try await runSnapshotTest(view: ButtonSWarning(appearance: appearance))
    }
    
    @MainActor
    func testButtonXsDark() async throws {
        let appearance = BasicButton.xs.dark.appearance
        try await runSnapshotTest(view: ButtonXsDark(appearance: appearance))
    }
    
    @MainActor
    func testButtonIsLoading() async throws {
        let appearance = BasicButton.l.default.appearance
        try await runSnapshotTest(view: ButtonLIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testButtonIsDisabled() async throws {
        let appearance = BasicButton.l.default.appearance
        try await runSnapshotTest(view: ButtonLIsDisabled(appearance: appearance))
    }
    
    @MainActor
    func testButtonLSecondary() async throws {
        let appearance = BasicButton.l.secondary.appearance
        try await runSnapshotTest(view: ButtonLSecondary(appearance: appearance))
    }
    
    @MainActor
    func testButtonMClearSpaceBetween() async throws {
        let appearance = BasicButton.m.clear.appearance
        try await runSnapshotTest(view: ButtonMClearSpaceBetween(appearance: appearance))
    }
    
    @MainActor
    func testButtonSPositiveLongText() async throws {
        let appearance = BasicButton.s.positive.appearance
        try await runSnapshotTest(view: ButtonSPositiveLongText(appearance: appearance))
    }
    
    @MainActor
    func testButtonXlDefault() async throws {
        let appearance = BasicButton.xl.default.appearance
        try await runSnapshotTest(view: ButtonXlDefault(appearance: appearance))
    }
    
    @MainActor
    func testButtonXxsDefault() async throws {
        let appearance = BasicButton.xxs.default.appearance
        try await runSnapshotTest(view:ButtonXxsDefault(appearance: appearance))
    }
}
