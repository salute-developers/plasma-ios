//
//  SpinnerSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 21.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class SpinnerSnapshotTest: XCTestCase {
    
    @MainActor
    func testSpinnerXxlDefaultSddsServ() async throws {
        let appearance = Spinner.xxl.default.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerXlSecondarySddsServ() async throws {
        let appearance = Spinner.xl.secondary.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerLAccentSddsServ() async throws {
        let appearance = Spinner.l.accent.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerMPositiveSddsServ() async throws {
        let appearance = Spinner.m.positive.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerSNegativeSddsServ() async throws {
        let appearance = Spinner.s.negative.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerXsWarningSddsServ() async throws {
        let appearance = Spinner.xs.warning.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerXxsInfoSddsServ() async throws {
        let appearance = Spinner.xxs.info.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
    
    @MainActor
    func testSpinnerScalableDefaultSddsServ() async throws {
        let appearance = Spinner.scalable.default.appearance
        
        try await runSnapshotTest(view: SpinnerTestCase(appearance: appearance))
    }
}
