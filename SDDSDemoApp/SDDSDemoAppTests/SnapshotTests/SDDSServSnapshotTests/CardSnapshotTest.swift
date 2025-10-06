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
        let appearance = CardSolid.l.appearance
        try await runSnapshotTest(view: CardLHorizontal(apperance: appearance))
    }
    
    @MainActor
    func testCardMVertical() async throws {
        let appearance = CardSolid.m.appearance
        try await runSnapshotTest(view: CardMVertical(appearance: appearance))
    }
    
    @MainActor
    func testCardSHorizontal() async throws {
        let appearance = CardSolid.s.appearance
        try await runSnapshotTest(view: CardSHorizontal(appearance: appearance))
    }
    
    @MainActor
    func testCardLClearVertical() async throws {
        let appearance = CardClear.l.appearance
        try await runSnapshotTest(view: CardLClearVertical(appearance: appearance))
    }
    
    @MainActor
    func testCardMClearHorizontal() async throws {
        let appearance = CardClear.m.appearance
        try await runSnapshotTest(view: CardMClearHorizontal(appearance: appearance))
    }
    
    @MainActor
    func testCardSClearVertical() async throws {
        let appearance = CardClear.s.appearance
        try await runSnapshotTest(view: CardSClearVertical(appearance: appearance))
    }
}
