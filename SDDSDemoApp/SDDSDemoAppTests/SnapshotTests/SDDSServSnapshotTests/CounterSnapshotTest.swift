//
//  CounterSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class CounterSnapshotTest: XCTestCase {
    
    @MainActor
    func testCounterSizeLDefault() async throws {
        let appearance = Counter.l.default.appearance
        try await runSnapshotTest(view: CounterSizeLDefault(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeMAccent() async throws {
        let appearance = Counter.m.accent.appearance
        try await runSnapshotTest(view: CounterSizeMAccent(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeSPositive() async throws {
        let appearance = Counter.s.positive.appearance
        try await runSnapshotTest(view: CounterSizeSPositive(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeXsWarning() async throws {
        let appearance = Counter.xs.warning.appearance
        try await runSnapshotTest(view: CounterSizeXsWarning(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeXxsNegative() async throws {
        let appearance = Counter.xxs.negative.appearance
        try await runSnapshotTest(view: CounterSizeXxsNegative(appearance: appearance))
    }
    
    @MainActor
    func testCounterSizeLWhite() async throws {
        let appearance = Counter.l.white.appearance
        try await runSnapshotTest(view: CounterSizeLWhite(appearance: appearance))
    }
}
