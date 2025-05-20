//
//  CircularProgressSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 20.05.2025.
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
    
    func testCircularProgressXxlDefault() async throws {
        try await runSnapshotTest(view: CircularProgressXxlDefault())
    }
    
    func testCircularProgressXlSecondary() async throws {
        try await runSnapshotTest(view: CircularProgressXlSecondary())
    }
    
    func testCircularProgressLAccent() async throws {
        try await runSnapshotTest(view: CircularProgressLAccent())
    }
    
    func testCircularProgressMGradient() async throws {
        try await runSnapshotTest(view: CircularProgressMGradient())
    }
    
    func testCircularProgressSInfo() async throws {
        try await runSnapshotTest(view: CircularProgressSInfo())
    }
    
    func testCircularProgressXsPositive() async throws {
        try await runSnapshotTest(view: CircularProgressXsPositive())
    }
    
    func testCircularProgressXxsWarning() async throws {
        try await runSnapshotTest(view: CircularProgressXxsWarning())
    }
    
    func testCircularProgressXxlNegativeNoTrack() async throws {
        try await runSnapshotTest(view: CircularProgressXxlNegativeNoTrack())
    }
}
