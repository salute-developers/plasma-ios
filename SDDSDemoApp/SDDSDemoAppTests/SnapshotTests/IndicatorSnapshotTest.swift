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
    
    func testIndicatorLDefault() async throws {
        try await runSnapshotTest(view: IndicatorLDefault())
    }
    
    func testIndicatorMAccent() async throws {
        try await runSnapshotTest(view: IndicatorMAccent())
    }
    
    func testIndicatorSInactove() async throws {
        try await runSnapshotTest(view: IndicatorSInactove())
    }
    
    func testIndicatorLPositive() async throws {
        try await runSnapshotTest(view: IndicatorLPositive())
    }
    
    func testIndicatorLWarning() async throws {
        try await runSnapshotTest(view: IndicatorLWarning())
    }
    
    func testIndicatorLNegative() async throws {
        try await runSnapshotTest(view: IndicatorLNegative())
    }
}
