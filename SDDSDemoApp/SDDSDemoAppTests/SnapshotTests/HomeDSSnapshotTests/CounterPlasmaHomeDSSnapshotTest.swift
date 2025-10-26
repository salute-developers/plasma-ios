//
//  CounterPlasmaHomeDSSnapshotTest.swift
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

final class CounterPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testCounterSizeLDefaultPlasmaHomeDS() async throws {
        let appearance = Counter.l.default.appearance
        try await runSnapshotTest(view: CounterSizeLDefault(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeMAccentPlasmaHomeDS() async throws {
        let appearance = Counter.m.accent.appearance
        try await runSnapshotTest(view: CounterSizeMAccent(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeSPositivePlasmaHomeDS() async throws {
        let appearance = Counter.s.positive.appearance
        try await runSnapshotTest(view: CounterSizeSPositive(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeXsWarningPlasmaHomeDS() async throws {
        let appearance = Counter.xs.warning.appearance
        try await runSnapshotTest(view: CounterSizeXsWarning(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeXxsNegativePlasmaHomeDS() async throws {
        let appearance = Counter.xxs.negative.appearance
        try await runSnapshotTest(view: CounterSizeXxsNegative(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeLWhitePlasmaHomeDS() async throws {
        let appearance = Counter.l.white.appearance
        try await runSnapshotTest(view: CounterSizeLWhite(appearance: appearance))
    }
}
