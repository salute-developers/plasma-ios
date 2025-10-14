//
//  CardPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.10.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class CardPlasmaHomeDSSnapshotTest: XCTestCase {
    
    @MainActor
    func testCardLHorizontalHomeDS() async throws {
        let appearance = Card.l.appearance
        try await runSnapshotTest(view: CardLHorizontal(apperance: appearance))
    }
    
    @MainActor
    func testCardMVerticalHomeDS() async throws {
        let appearance = Card.m.appearance
        try await runSnapshotTest(view: CardMVertical(appearance: appearance))
    }
    
    @MainActor
    func testCardSHorizontalHomeDS() async throws {
        let appearance = Card.s.appearance
        try await runSnapshotTest(view: CardSHorizontal(appearance: appearance))
    }
    
    @MainActor
    func testCardLClearVerticalHomeDS() async throws {
        let appearance = Card.l.appearance
        try await runSnapshotTest(view: CardLClearVertical(appearance: appearance))
    }
    
    @MainActor
    func testCardMClearHorizontalHomeDS() async throws {
        let appearance = Card.m.appearance
        try await runSnapshotTest(view: CardMClearHorizontal(appearance: appearance))
    }
    
    @MainActor
    func testCardSClearVerticalHomeDS() async throws {
        let appearance = Card.s.appearance
        try await runSnapshotTest(view: CardSClearVertical(appearance: appearance))
    }
}
