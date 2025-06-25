//
//  CardSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 24.06.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class CardSnapshotTest: XCTestCase {
    
    @MainActor
    func testCardLHorizontal() async throws {
        try await runSnapshotTest(view: CardLHorizontal())
    }
    
    @MainActor
    func testCardMVertical() async throws {
        try await runSnapshotTest(view: CardMVertical())
    }
    
    @MainActor
    func testCardSHorizontal() async throws {
        try await runSnapshotTest(view: CardSHorizontal())
    }
    
    @MainActor
    func testCardLClearVertical() async throws {
        try await runSnapshotTest(view: CardLClearVertical())
    }
    
    @MainActor
    func testCardMClearHorizontal() async throws {
        try await runSnapshotTest(view: CardMClearHorizontal())
    }
    
    @MainActor
    func testCardSClearVertical() async throws {
        try await runSnapshotTest(view: CardSClearVertical())
    }
}
