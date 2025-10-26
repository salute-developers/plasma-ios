//
//  CardPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 07.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class CardPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testCardLHorizontalPlasmaB2C() async throws {
        let appearance = CardSolid.l.appearance
        try await runSnapshotTest(view: CardLHorizontal(apperance: appearance))
    }
    
    @MainActor
    func testCardMVerticalPlasmaB2C() async throws {
        let appearance = CardSolid.m.appearance
        try await runSnapshotTest(view: CardMVertical(appearance: appearance))
    }
    
    @MainActor
    func testCardSHorizontalPlasmaB2C() async throws {
        let appearance = CardSolid.s.appearance
        try await runSnapshotTest(view: CardSHorizontal(appearance: appearance))
    }
    
    @MainActor
    func testCardLClearVerticalPlasmaB2C() async throws {
        let appearance = CardClear.l.appearance
        try await runSnapshotTest(view: CardLClearVertical(appearance: appearance))
    }
    
    @MainActor
    func testCardMClearHorizontalPlasmaB2C() async throws {
        let appearance = CardClear.m.appearance
        try await runSnapshotTest(view: CardMClearHorizontal(appearance: appearance))
    }
    
    @MainActor
    func testCardSClearVerticalPlasmaB2C() async throws {
        let appearance = CardClear.s.appearance
        try await runSnapshotTest(view: CardSClearVertical(appearance: appearance))
    }
}
