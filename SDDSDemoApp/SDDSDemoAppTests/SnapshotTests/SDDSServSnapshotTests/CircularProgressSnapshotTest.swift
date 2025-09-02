//
//  CircularProgressSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 29.05.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSservTheme
import UIKit
import SwiftUI

final class CircularProgressSnapshotTest: XCTestCase {

    @MainActor
    func testCircularProgressXxlDefault() async throws {
        let appearance = CircularProgressBar.xxl.default.appearance
        try await runSnapshotTest(view: CircularProgressXxlDefault(appearance: appearance))
    }

    @MainActor
    func testCircularProgressXlSecondary() async throws {
        let appearance = CircularProgressBar.xl.secondary.appearance
        try await runSnapshotTest(view: CircularProgressXlSecondary(appearance: appearance))
    }

    @MainActor
    func testCircularProgressLAccent() async throws {
        let appearance = CircularProgressBar.l.accent.appearance
        try await runSnapshotTest(view: CircularProgressLAccent(appearance: appearance))
    }

    @MainActor
    func testCircularProgressMGradient() async throws {
        let appearance = CircularProgressBar.m.gradient.appearance
        try await runSnapshotTest(view: CircularProgressMGradient(appearance: appearance))
    }

    @MainActor
    func testCircularProgressSInfo() async throws {
        let appearance = CircularProgressBar.s.info.appearance
        try await runSnapshotTest(view: CircularProgressSInfo(appearance: appearance))
    }

    @MainActor
    func testCircularProgressXsPositive() async throws {
        let appearance = CircularProgressBar.xs.positive.appearance
        try await runSnapshotTest(view: CircularProgressXsPositive(appearance: appearance))
    }

    @MainActor
    func testCircularProgressXxsWarning() async throws {
        let appearance = CircularProgressBar.xxs.warning.appearance
        try await runSnapshotTest(view: CircularProgressXxsWarning(appearance: appearance))
    }

    @MainActor
    func testCircularProgressXxlNegativeNoTrack() async throws {
        let appearance = CircularProgressBar.xxl.negative.appearance
        try await runSnapshotTest(view: CircularProgressXxlNegativeNoTrack(appearance: appearance))
    }
}
