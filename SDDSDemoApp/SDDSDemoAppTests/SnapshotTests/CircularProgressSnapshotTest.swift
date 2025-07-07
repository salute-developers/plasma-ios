//
//  CircularProgressSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 29.05.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class CircularProgressSnapshotTest: XCTestCase {

    @MainActor
    func testCircularProgressXxlDefault() async throws {
        try await runSnapshotTest(view: CircularProgressXxlDefault())
    }

    @MainActor
    func testCircularProgressXlSecondary() async throws {
        try await runSnapshotTest(view: CircularProgressXlSecondary())
    }

    @MainActor
    func testCircularProgressLAccent() async throws {
        try await runSnapshotTest(view: CircularProgressLAccent())
    }

    @MainActor
    func testCircularProgressMGradient() async throws {
        try await runSnapshotTest(view: CircularProgressMGradient())
    }

    @MainActor
    func testCircularProgressSInfo() async throws {
        try await runSnapshotTest(view: CircularProgressSInfo())
    }

    @MainActor
    func testCircularProgressXsPositive() async throws {
        try await runSnapshotTest(view: CircularProgressXsPositive())
    }

    @MainActor
    func testCircularProgressXxsWarning() async throws {
        try await runSnapshotTest(view: CircularProgressXxsWarning())
    }

    @MainActor
    func testCircularProgressXxlNegativeNoTrack() async throws {
        try await runSnapshotTest(view: CircularProgressXxlNegativeNoTrack())
    }
}
