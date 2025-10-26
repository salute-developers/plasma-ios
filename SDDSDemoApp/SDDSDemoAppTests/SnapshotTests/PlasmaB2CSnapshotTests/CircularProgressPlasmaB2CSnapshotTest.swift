//
//  CircularProgressPlasmaB2CSnapshotTest.swift
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

final class CircularProgressPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testCircularProgressXxlDefaultPlasmaB2C() async throws {
        let appearance = CircularProgressBar.xxl.default.appearance
        try await runSnapshotTest(view: CircularProgressXxlDefault(appearance: appearance))
    }

    @MainActor
    func testCircularProgressXlSecondaryPlasmaB2C() async throws {
        let appearance = CircularProgressBar.xl.secondary.appearance
        try await runSnapshotTest(view: CircularProgressXlSecondary(appearance: appearance))
    }

    @MainActor
    func testCircularProgressLAccentPlasmaB2C() async throws {
        let appearance = CircularProgressBar.l.accent.appearance
        try await runSnapshotTest(view: CircularProgressLAccent(appearance: appearance))
    }

    @MainActor
    func testCircularProgressMGradientPlasmaB2C() async throws {
        let appearance = CircularProgressBar.m.gradient.appearance
        try await runSnapshotTest(view: CircularProgressMGradient(appearance: appearance))
    }

    @MainActor
    func testCircularProgressSInfoPlasmaB2C() async throws {
        let appearance = CircularProgressBar.s.info.appearance
        try await runSnapshotTest(view: CircularProgressSInfo(appearance: appearance))
    }

    @MainActor
    func testCircularProgressXsPositivePlasmaB2C() async throws {
        let appearance = CircularProgressBar.xs.positive.appearance
        try await runSnapshotTest(view: CircularProgressXsPositive(appearance: appearance))
    }

    @MainActor
    func testCircularProgressXxsWarningPlasmaB2C() async throws {
        let appearance = CircularProgressBar.xxs.warning.appearance
        try await runSnapshotTest(view: CircularProgressXxsWarning(appearance: appearance))
    }

    @MainActor
    func testCircularProgressXxlNegativeNoTrackPlasmaB2C() async throws {
        let appearance = CircularProgressBar.xxl.negative.appearance
        try await runSnapshotTest(view: CircularProgressXxlNegativeNoTrack(appearance: appearance))
    }
}
