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

final class IndicatorSnapshotTest: XCTestCase {
    
    @MainActor
    func testIndicatorLDefault() async throws {
        try await runSnapshotTest(view: IndicatorLDefault())
    }
    
    @MainActor
    func testIndicatorMAccent() async throws {
        try await runSnapshotTest(view: IndicatorMAccent())
    }
    
    @MainActor
    func testIndicatorSInactove() async throws {
        try await runSnapshotTest(view: IndicatorSInactove())
    }
    
    @MainActor
    func testIndicatorLPositive() async throws {
        try await runSnapshotTest(view: IndicatorLPositive())
    }
    
    @MainActor
    func testIndicatorLWarning() async throws {
        try await runSnapshotTest(view: IndicatorLWarning())
    }
    
    @MainActor
    func testIndicatorLNegative() async throws {
        try await runSnapshotTest(view: IndicatorLNegative())
    }
}
