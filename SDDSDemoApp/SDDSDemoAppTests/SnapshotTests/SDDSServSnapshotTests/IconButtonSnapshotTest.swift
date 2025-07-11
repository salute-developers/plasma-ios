//
//  IconButtonSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 17.04.2025.
//
@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class IconButtonSnapshotTest: XCTestCase {
    
    @MainActor
    func testIсonButtonLDefault() async throws {
        let appearance = IconButton.l.default.appearance
        try await runSnapshotTest(view: IсonButtonLDefault(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonMAccent() async throws {
        let appearance = IconButton.m.accent.appearance
        try await runSnapshotTest(view: IconButtonMAccent(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonSWarning() async throws {
        let appearance = IconButton.s.warning.appearance
        try await runSnapshotTest(view: IconButtonSWarning(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonXsDark() async throws {
        let appearance = IconButton.xs.dark.appearance
        try await runSnapshotTest(view: IconButtonXsDark(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonIsLoading() async throws {
        let appearance = IconButton.l.default.appearance
        try await runSnapshotTest(view: IconButtonIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonIsDisabled() async throws {
        let appearance = IconButton.l.default.appearance
        try await runSnapshotTest(view: IconButtonIsDisabled(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonLSecondaryPilled() async throws {
        let appearance = IconButton.l.pilled.secondary.appearance
        try await runSnapshotTest(view: IconButtonLSecondaryPilled(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonMClear() async throws {
        let appearance = IconButton.m.clear.appearance
        try await runSnapshotTest(view: IconButtonMClear(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonSPositive() async throws {
        let appearance = IconButton.s.positive.appearance
        try await runSnapshotTest(view: IconButtonSPositive(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonXsNegativePilledIsLoading() async throws {
        let appearance = IconButton.xs.pilled.negative.appearance
        try await runSnapshotTest(view: IconButtonXsNegativePilledIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonLWhite() async throws {
        let appearance = IconButton.l.white.appearance
        try await runSnapshotTest(view: IconButtonLWhite(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonXlDefault() async throws {
        let appearance = IconButton.xl.default.appearance
        try await runSnapshotTest(view: IconButtonXlDefault(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonXxsDefault() async throws {
        let appearance = IconButton.xxs.default.appearance
        try await runSnapshotTest(view: IconButtonXxsDefault(appearance: appearance))
    }
}
