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
import SDDSServTheme
import UIKit
import SwiftUI

final class ModalSnapshotTest: XCTestCase {
    
    @MainActor
    func testModalUseNativeBlackOutHasClose() async throws {
        try await runSnapshotTest(view: ModalUseNativeBlackOutHasClose())
    }
    
    @MainActor
    func testModalWithoutNativeBlackOut() async throws {
        try await runSnapshotTest(view: ModalWithoutNativeBlackOut())
    }
}
