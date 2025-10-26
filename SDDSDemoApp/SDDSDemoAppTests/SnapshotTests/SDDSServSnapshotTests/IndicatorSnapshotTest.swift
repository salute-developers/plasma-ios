//
//  IndicatorSnapshotTest.swift
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

final class IndicatorSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testIndicatorLDefault() async throws {
        let appearance = Indicator.l.default.appearance
        try await runSnapshotTest(view: IndicatorLDefault(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorMAccent() async throws {
        let appearance = Indicator.m.accent.appearance
        try await runSnapshotTest(view: IndicatorMAccent(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorSInactove() async throws {
        let appearance = Indicator.s.inactive.appearance
        try await runSnapshotTest(view: IndicatorSInactove(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorLPositive() async throws {
        let appearance = Indicator.l.positive.appearance
        try await runSnapshotTest(view: IndicatorLPositive(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorLWarning() async throws {
        let appearance = Indicator.l.warning.appearance
        try await runSnapshotTest(view: IndicatorLWarning(appearance: appearance))
    }
    
    @MainActor
    func testIndicatorLNegative() async throws {
        let appearance = Indicator.l.negative.appearance
        try await runSnapshotTest(view: IndicatorLNegative(appearance: appearance))
    }
}
