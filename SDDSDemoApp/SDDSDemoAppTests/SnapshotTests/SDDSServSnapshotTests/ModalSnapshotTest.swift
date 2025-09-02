//
//  ModalSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 27.06.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSservTheme
import UIKit
import SwiftUI

final class ModalSnapshotTest: XCTestCase {
    
    @MainActor
    func testModalUseNativeBlackOutHasClose() async throws {
        let appearance = Modal.default.appearance
        try await runSnapshotTest(view: ModalUseNativeBlackOutHasClose(appearance: appearance))
    }
    
    @MainActor
    func testModalWithoutNativeBlackOut() async throws {
        let appearance = Modal.default.appearance
        try await runSnapshotTest(view: ModalWithoutNativeBlackOut(appearance: appearance))
    }
}
