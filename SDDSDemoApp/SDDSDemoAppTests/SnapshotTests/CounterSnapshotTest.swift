//
//  CounterSnapshotTest.swift
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

final class CounterSnapshotTest: XCTestCase {
    
    @MainActor
    func testCounterSizeLDefault() async throws {
        try await runSnapshotTest(view: CounterSizeLDefault())
    }
    
    @MainActor
    func testCounterSizeMAccent() async throws {
        try await runSnapshotTest(view: CounterSizeMAccent())
    }
    
    @MainActor
    func testCounterSizeSPositive() async throws {
        try await runSnapshotTest(view: CounterSizeSPositive())
    }
    
    @MainActor
    func testCounterSizeXsWarning() async throws {
        try await runSnapshotTest(view: CounterSizeXsWarning())
    }
    
    @MainActor
    func testCounterSizeXxsNegative() async throws {
        try await runSnapshotTest(view: CounterSizeXxsNegative())
    }
    
    @MainActor
    func testCounterSizeLWhite() async throws {
        try await runSnapshotTest(view: CounterSizeLWhite())
    }
}
