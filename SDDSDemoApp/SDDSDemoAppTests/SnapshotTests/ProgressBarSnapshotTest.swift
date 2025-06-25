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
    
    @MainActor
    func testProgressBarDefault() async throws {
        try await runSnapshotTest(view: ProgressBarDefault())
    }
    
    @MainActor
    func testProgressBarSecondary() async throws {
        try await runSnapshotTest(view: ProgressBarSecondary())
    }
    
    @MainActor
    func testProgressBarWarning() async throws {
        try await runSnapshotTest(view: ProgressBarWarning())
    }
    
    @MainActor
    func testProgressBarPositive() async throws {
        try await runSnapshotTest(view: ProgressBarPositive())
    }
    
    @MainActor
    func testProgressBarNegative() async throws {
        try await runSnapshotTest(view: ProgressBarNegative())
    }
    
    @MainActor
    func testProgressBarGradient() async throws {
        try await runSnapshotTest(view: ProgressBarGradient())
    }
    
    @MainActor
    func testProgressBarDefaultValueOne() async throws {
        try await runSnapshotTest(view: ProgressBarDefaultValueOne())
    }
    
    @MainActor
    func testProgressBarAccent() async throws {
        try await runSnapshotTest(view: ProgressBarAccent())
    }
    
    @MainActor
    func testProgressBarInfo() async throws {
        try await runSnapshotTest(view: ProgressBarInfo())
    }
}
