//
//  SwitchStylesSaluteSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 08.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class SwitchStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testSwitchSizeLStylesSalute() async throws {
        let appearance = Switch.l.appearance
        try await runSnapshotTest(view: SwitchSizeL(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeMStylesSalute() async throws {
        let appearance = Switch.m.appearance
        try await runSnapshotTest(view: SwitchSizeM(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeSStylesSalute() async throws {
        let appearance = Switch.s.appearance
        try await runSnapshotTest(view: SwitchSizeS(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeDisabledStylesSalute() async throws {
        let appearance = Switch.m.appearance
        try await runSnapshotTest(view: SwitchSizeDisabled(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeDisabledOffStylesSalute() async throws {
        let appearance = Switch.m.appearance
        try await runSnapshotTest(view: SwitchSizeDisabledOff(appearance: appearance))
    }
}
