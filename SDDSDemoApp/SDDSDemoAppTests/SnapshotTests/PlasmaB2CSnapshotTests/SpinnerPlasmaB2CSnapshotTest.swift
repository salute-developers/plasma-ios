//
//  SpinnerPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 21.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class SpinnerPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testSpinnerXxlDefaultPlasmaB2C() async throws {
        let appearance = Spinner.xxl.default.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerXlSecondaryPlasmaB2C() async throws {
        let appearance = Spinner.xl.secondary.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerLAccentPlasmaB2C() async throws {
        let appearance = Spinner.l.accent.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerMPositivePlasmaB2C() async throws {
        let appearance = Spinner.m.positive.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerSNegativePlasmaB2C() async throws {
        let appearance = Spinner.s.negative.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerXsWarningPlasmaB2C() async throws {
        let appearance = Spinner.xs.warning.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerXxsInfoPlasmaB2C() async throws {
        let appearance = Spinner.xxs.info.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerScalableDefaultPlasmaB2C() async throws {
        let appearance = Spinner.scalable.default.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
}
