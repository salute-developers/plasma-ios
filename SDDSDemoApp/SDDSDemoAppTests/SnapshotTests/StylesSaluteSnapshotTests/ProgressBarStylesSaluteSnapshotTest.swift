//
//  ProgressBarStylesSaluteSnapshotTest.swift
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

final class ProgressBarStylesSaluteSnapshotTest: StylesSaluteThemeTestCase {
    
    @MainActor
    func testProgressBarDefaultStylesSalute() async throws {
        let appearance = ProgressBar.default.default.appearance
        try await runSnapshotTest(view: ProgressBarDefault(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarSecondaryStylesSalute() async throws {
        let appearance = ProgressBar.default.secondary.appearance
        try await runSnapshotTest(view: ProgressBarSecondary(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarWarningStylesSalute() async throws {
        let appearance = ProgressBar.default.warning.appearance
        try await runSnapshotTest(view: ProgressBarWarning(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarPositiveStylesSalute() async throws {
        let appearance = ProgressBar.default.positive.appearance
        try await runSnapshotTest(view: ProgressBarPositive(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarNegativeStylesSalute() async throws {
        let appearance = ProgressBar.default.negative.appearance
        try await runSnapshotTest(view: ProgressBarNegative(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarGradientStylesSalute() async throws {
        let appearance = ProgressBar.default.gradient.appearance
        try await runSnapshotTest(view: ProgressBarGradient(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarDefaultValueOneStylesSalute() async throws {
        let appearance = ProgressBar.default.default.appearance
        try await runSnapshotTest(view: ProgressBarDefaultValueOne(appearance: appearance))
    }
    
    @MainActor
    func testProgressBarAccentStylesSalute() async throws {
        let appearance = ProgressBar.default.accent.appearance
        try await runSnapshotTest(view: ProgressBarAccent(appearance: appearance))
    }
}
