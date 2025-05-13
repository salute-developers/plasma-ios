//
//  ProgressBarSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 13.05.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class ProgressBarSnapshotTest: XCTestCase {
    
    func testProgressBarDefault() async throws {
        try await runSnapshotTest(view: ProgressBarDefault())
    }
    
    func testProgressBarSecondary() async throws {
        try await runSnapshotTest(view: ProgressBarSecondary())
    }
    
    func testProgressBarWarning() async throws {
        try await runSnapshotTest(view: ProgressBarWarning())
    }
    
    func testProgressBarPositive() async throws {
        try await runSnapshotTest(view: ProgressBarPositive())
    }
    
    func testProgressBarNegative() async throws {
        try await runSnapshotTest(view: ProgressBarNegative())
    }
    
    func testProgressBarGradient() async throws {
        try await runSnapshotTest(view: ProgressBarGradient())
    }
    
    func testProgressBarDefaultValueOne() async throws {
        try await runSnapshotTest(view: ProgressBarDefaultValueOne())
    }
    
    func testProgressBarAccent() async throws {
        try await runSnapshotTest(view: ProgressBarAccent())
    }
}
