//
//  CircularProgressPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.10.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class CircularProgressPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testCircularProgressXxlDefaultHomeDS() async throws {
        let appearance = CircularProgressBar.xxl.default.appearance
        try await runSnapshotTest(view: CircularProgressXxlDefault(appearance: appearance))
    }

    @MainActor
    func testCircularProgressXlSecondaryHomeDS() async throws {
        let appearance = CircularProgressBar.xl.secondary.appearance
        try await runSnapshotTest(view: CircularProgressXlSecondary(appearance: appearance))
    }

    @MainActor
    func testCircularProgressLAccentHomeDS() async throws {
        let appearance = CircularProgressBar.l.accent.appearance
        try await runSnapshotTest(view: CircularProgressLAccent(appearance: appearance))
    }

    @MainActor
    func testCircularProgressMGradientHomeDS() async throws {
        let appearance = CircularProgressBar.m.gradient.appearance
        try await runSnapshotTest(view: CircularProgressMGradient(appearance: appearance))
    }

    @MainActor
    func testCircularProgressSInfoHomeDS() async throws {
        let appearance = CircularProgressBar.s.info.appearance
        try await runSnapshotTest(view: CircularProgressSInfo(appearance: appearance))
    }

    @MainActor
    func testCircularProgressXsPositiveHomeDS() async throws {
        let appearance = CircularProgressBar.xs.positive.appearance
        try await runSnapshotTest(view: CircularProgressXsPositive(appearance: appearance))
    }

    @MainActor
    func testCircularProgressXxsWarningHomeDS() async throws {
        let appearance = CircularProgressBar.xxs.warning.appearance
        try await runSnapshotTest(view: CircularProgressXxsWarning(appearance: appearance))
    }

    @MainActor
    func testCircularProgressXxlNegativeNoTrackHomeDS() async throws {
        let appearance = CircularProgressBar.xxl.negative.appearance
        try await runSnapshotTest(view: CircularProgressXxlNegativeNoTrack(appearance: appearance))
    }
}
