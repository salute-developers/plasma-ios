//
//  IndicatorPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 12.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class IndicatorPlasmaHomeDSSnapshotTest: XCTestCase {
    
    @MainActor
    func testIndicatorLDefaultPlasmaHomeDS() async throws {
        let appearance = Indicator.l.default.appearance
        try await runSnapshotTest(view: IndicatorLDefault(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorMAccentPlasmaHomeDS() async throws {
        let appearance = Indicator.m.accent.appearance
        try await runSnapshotTest(view: IndicatorMAccent(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorSInactovePlasmaHomeDS() async throws {
        let appearance = Indicator.s.inactive.appearance
        try await runSnapshotTest(view: IndicatorSInactove(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorLPositivePlasmaHomeDS() async throws {
        let appearance = Indicator.l.positive.appearance
        try await runSnapshotTest(view: IndicatorLPositive(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorLWarningPlasmaHomeDS() async throws {
        let appearance = Indicator.l.warning.appearance
        try await runSnapshotTest(view: IndicatorLWarning(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorLNegativePlasmaHomeDS() async throws {
        let appearance = Indicator.l.negative.appearance
        try await runSnapshotTest(view: IndicatorLNegative(appearance: appearance))
    }
}
