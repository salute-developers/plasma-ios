//
//  CounterPlasmaB2CSnapshotTest.swift
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

final class CounterPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testCounterSizeLDefaultPlasmaB2C() async throws {
        let appearance = Counter.l.default.appearance
        try await runSnapshotTest(view: CounterSizeLDefault(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeMAccentPlasmaB2C() async throws {
        let appearance = Counter.m.accent.appearance
        try await runSnapshotTest(view: CounterSizeMAccent(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeSPositivePlasmaB2C() async throws {
        let appearance = Counter.s.positive.appearance
        try await runSnapshotTest(view: CounterSizeSPositive(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeXsWarningPlasmaB2C() async throws {
        let appearance = Counter.xs.warning.appearance
        try await runSnapshotTest(view: CounterSizeXsWarning(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeXxsNegativePlasmaB2C() async throws {
        let appearance = Counter.xxs.negative.appearance
        try await runSnapshotTest(view: CounterSizeXxsNegative(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeLWhitePlasmaB2C() async throws {
        let appearance = Counter.l.white.appearance
        try await runSnapshotTest(view: CounterSizeLWhite(appearance: appearance))
    }
}

