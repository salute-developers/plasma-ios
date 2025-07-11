//
//  ModalStylesSaluteSnapshotTest.swift
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

final class ModalStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testModalUseNativeBlackOutHasCloseStylesSalute() async throws {
        let appearance = Modal.default.appearance
        try await runSnapshotTest(view: ModalUseNativeBlackOutHasClose(appearance: appearance))
    }
    
    @MainActor
    func testModalWithoutNativeBlackOutStylesSalute() async throws {
        let appearance = Modal.default.appearance
        try await runSnapshotTest(view: ModalWithoutNativeBlackOut(appearance: appearance))
    }
}
