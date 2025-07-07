//
//  ProgressBarPlasmaB2CSnapshotTest.swift
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

final class ProgressBarPlasmaB2CSnapshotTest: XCTestCase {
    
    @MainActor
    func testProgressBarDefaultPlasmaB2C() async throws {
        let appearance = ProgressBar.default.default.appearance
        try await runSnapshotTest(view: ProgressBarDefault(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarSecondaryPlasmaB2C() async throws {
        let appearance = ProgressBar.default.secondary.appearance
        try await runSnapshotTest(view: ProgressBarSecondary(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarWarningPlasmaB2C() async throws {
        let appearance = ProgressBar.default.warning.appearance
        try await runSnapshotTest(view: ProgressBarWarning(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarPositivePlasmaB2C() async throws {
        let appearance = ProgressBar.default.positive.appearance
        try await runSnapshotTest(view: ProgressBarPositive(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarNegativePlasmaB2C() async throws {
        let appearance = ProgressBar.default.negative.appearance
        try await runSnapshotTest(view: ProgressBarNegative(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarGradientPlasmaB2C() async throws {
        let appearance = ProgressBar.default.gradient.appearance
        try await runSnapshotTest(view: ProgressBarGradient(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarDefaultValueOnePlasmaB2C() async throws {
        let appearance = ProgressBar.default.default.appearance
        try await runSnapshotTest(view: ProgressBarDefaultValueOne(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarAccentPlasmaB2C() async throws {
        let appearance = ProgressBar.default.accent.appearance
        try await runSnapshotTest(view: ProgressBarAccent(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarInfoPlasmaB2C() async throws {
        let appearance = ProgressBar.default.info.appearance
        try await runSnapshotTest(view: ProgressBarInfo(appearance: appearance))
    }
}
