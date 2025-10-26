//
//  IndicatorPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 07.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class IndicatorStylesSaluteSnapshotTest: StylesSaluteThemeTestCase {
    
    @MainActor
    func testIndicatorLDefaultStylesSalute() async throws {
        let appearance = Indicator.l.default.appearance
        try await runSnapshotTest(view: IndicatorLDefault(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorMAccentStylesSalute() async throws {
        let appearance = Indicator.m.accent.appearance
        try await runSnapshotTest(view: IndicatorMAccent(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorSInactoveStylesSalute() async throws {
        let appearance = Indicator.s.inactive.appearance
        try await runSnapshotTest(view: IndicatorSInactove(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorLPositiveStylesSalute() async throws {
        let appearance = Indicator.l.positive.appearance
        try await runSnapshotTest(view: IndicatorLPositive(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorLWarningStylesSalute() async throws {
        let appearance = Indicator.l.warning.appearance
        try await runSnapshotTest(view: IndicatorLWarning(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorLNegativeStylesSalute() async throws {
        let appearance = Indicator.l.negative.appearance
        try await runSnapshotTest(view: IndicatorLNegative(appearance: appearance))
    }
}

