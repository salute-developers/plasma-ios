//
//  ModalPlasmaB2CSnapshotTest.swift
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

final class ModalPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testModalUseNativeBlackOutHasClosePlasmaB2C() async throws {
        let appearance = Modal.default.appearance
        try await runSnapshotTest(view: ModalUseNativeBlackOutHasClose(appearance: appearance))
    }
    
    @MainActor
    func testModalWithoutNativeBlackOutPlasmaB2C() async throws {
        let appearance = Modal.default.appearance
        try await runSnapshotTest(view: ModalWithoutNativeBlackOut(appearance: appearance))
    }
}
