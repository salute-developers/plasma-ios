//
//  SpinnerPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.10.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class SpinnerPlasmaHomeDSSnapshotTest: XCTestCase {
    
    @MainActor
    func testSpinnerMDefaultHomeDS() async throws {
        let appearance = Spinner.m.default.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerMSecondaryHomeDS() async throws {
        let appearance = Spinner.m.secondary.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerMAccentHomeDS() async throws {
        let appearance = Spinner.m.accent.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerMPositiveHomeDS() async throws {
        let appearance = Spinner.m.positive.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerSNegativeHomeDS() async throws {
        let appearance = Spinner.s.negative.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerXsWarningHomeDS() async throws {
        let appearance = Spinner.xs.warning.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerXxsInfoHomeDS() async throws {
        let appearance = Spinner.xxs.info.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerScalableDefaultHomeDS() async throws {
        let appearance = Spinner.scalable.default.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
}
